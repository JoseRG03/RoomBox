import 'package:path/path.dart';
import 'package:room_box_app/const.dart';
import 'package:room_box_app/models/storage/shopping-cart-data.dart';
import 'package:room_box_app/models/storage/shopping_cart_item.dart';
import 'package:room_box_app/models/storage/user-data.dart';
import 'package:room_box_app/pages/app/store/total-costs.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _userTableName = 'user';
  final String _userIdColumnName = 'id';
  final String _userJWTColumnName = 'jwt';
  final String _userRefreshColumnName = 'refresh';

  final String _cartTableName = 'shopping_cart';
  final String _cartItemId = 'shopping_cart_item_id';
  final String _cartItemName = 'shopping_cart_item_name';
  final String _cartItemUnitPrice = 'shopping_cart_unit_price';
  final String _cartItemAmount = 'shopping_cart_item_amount';
  final String _cartItemImageUrl = 'shopping_cart_item_image';

  final String _paymentMethodTableName = 'payment_method';
  final String _paymentMethodId = 'payment_method_id';
  final String _paymentMethodAlias = 'payment_method_alias';
  final String _paymentMethodNumber = 'payment_method_number';
  final String _paymentMethodImage = 'payment_method_image';

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'roombox_db.db');
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
       CREATE TABLE $_userTableName (
         $_userIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
         $_userJWTColumnName TEXT NOT NULL,
         $_userRefreshColumnName TEXT NOT NULL
       )
      ''');
        db.execute('''
       CREATE TABLE $_cartTableName (
         $_cartItemId INTEGER PRIMARY KEY,
         $_cartItemName TEXT NOT NULL,
         $_cartItemUnitPrice REAL NOT NULL,
         $_cartItemAmount INTEGER NOT NULL,
         $_cartItemImageUrl TEXT NOT NULL
       )
      ''');
        db.execute('''
       CREATE TABLE $_paymentMethodTableName (
         $_paymentMethodId INTEGER PRIMARY KEY AUTOINCREMENT,
         $_paymentMethodAlias TEXT NOT NULL,
         $_paymentMethodNumber INTEGER NOT NULL,
         $_paymentMethodImage TEXT NOT NULL,
       )
      ''');

      },
    );

    return database;
  }

  void addUserData(String jwt, String refresh) async {
    final db = await database;
    await db.insert(_userTableName, {
      _userIdColumnName: 1,
      _userJWTColumnName: jwt,
      _userRefreshColumnName: refresh
    });
  }

  Future<int> clearUserData() async {
    final db = await database;
    await db.delete(_userTableName);

    return 1;
  }

  Future<UserData> getUserData() async {
    final db = await database;
    final map = await db.rawQuery('SELECT * FROM $_userTableName WHERE id=1');

    return UserData.fromJson(map[0]);
  }

  Future<int> addToShoppingCart(String itemId, String itemName, double unitPrice, String itemImageUrl) async {
    final db = await database;

    var result = await db.rawQuery(
        'SELECT * FROM $_cartTableName WHERE $_cartItemId = ?', [itemId]);

    if (result.isNotEmpty) {
      await db.update(
        _cartTableName,
        {
          _cartItemAmount: (result[0][_cartItemAmount] as int) + 1,
        },
        where: '$_cartItemId = ?',
        whereArgs: [itemId],
      );
      print('Edited item in Shopping cart');
    } else {
      await db.insert(_cartTableName, {
        _cartItemId: itemId,
        _cartItemName: itemName,
        _cartItemUnitPrice: unitPrice,
        _cartItemAmount: 1,
        _cartItemImageUrl: itemImageUrl,
      });
      print('Added to Shopping cart');
    }

    return 1;
  }

  Future<ShoppingCartData> getShoppingCart() async {
    final db = await database;
    final map = await db.rawQuery('SELECT * FROM $_cartTableName');
    double total = 0;
    double taxes = 0;
    double subTotal = 0;

    List<ShoppingCartItem> items = map.map((item) {
      return ShoppingCartItem.fromJson(item);
    }).toList();


    items.forEach((item) {
      total += (item.shoppingCartUnitPrice ?? 0) * (item.shoppingCartItemAmount ?? 0);
    });

    taxes = total * 0.18;
    subTotal = total + taxes;


    TotalCosts totalCosts = TotalCosts(subTotal: subTotal.toStringAsFixed(2), taxes: taxes.toStringAsFixed(2), total: total.toStringAsFixed(2));

    return ShoppingCartData(
        items: items,
        totalCosts: totalCosts);
  }

  Future<ShoppingCartData> clearShoppingCart() async {
    final db = await database;
    await db.delete(_cartTableName);

    return await getShoppingCart();
  }

  Future<int> addToQuantity(String id) async {
    final db = await database;

    var result = await db.rawQuery(
        'SELECT * FROM $_cartTableName WHERE $_cartItemId = ?', [id]);

    await db.update(
      _cartTableName,
      {
        _cartItemAmount: (result[0][_cartItemAmount] as int) + 1,
      },
      where: '$_cartItemId = ?',
      whereArgs: [id],
    );
    print('Added to quantity for item in Shopping cart');

    return 1;
  }

  Future<int> removeFromQuantity(String id) async {
    final db = await database;

    var result = await db.rawQuery(
        'SELECT * FROM $_cartTableName WHERE $_cartItemId = ?', [id]);

    await db.update(
      _cartTableName,
      {
        _cartItemAmount: (result[0][_cartItemAmount] as int) - 1,
      },
      where: '$_cartItemId = ?',
      whereArgs: [id],
    );
    print('Added to quantity for item in Shopping cart');

    return 1;
  }

  Future<void> removeItem(String id) async {
    final db = await database;

    await db.delete(_cartTableName, where: '$id = $_cartItemId');
  }

  Future<int> addPaymentMethod(String alias, String number) async {
    final db = await database;
    String? paymentOrigin;

    if (number.startsWith('2') || number.startsWith('5')) paymentOrigin = masterCardImage;

    if (number.startsWith('4')) paymentOrigin = visaImage;

    if (number.startsWith('3')) paymentOrigin = amexImage;

    try {
      await db.insert(_paymentMethodTableName, {
        _paymentMethodAlias: alias,
        _paymentMethodNumber: number,
        _paymentMethodImage: paymentOrigin ?? baseImageURL
      });

    } catch (err) {
      return 1;
    }
    return 0;
  }
}
