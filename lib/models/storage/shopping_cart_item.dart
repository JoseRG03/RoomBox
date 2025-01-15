import 'dart:convert';

List<ShoppingCartItem> shoppingCartItemFromJson(String str) => List<ShoppingCartItem>.from(json.decode(str).map((x) => ShoppingCartItem.fromJson(x)));

String shoppingCartItemToJson(List<ShoppingCartItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShoppingCartItem {
  final int shoppingCartItemId;
  final String shoppingCartItemName;
  final double shoppingCartUnitPrice;
  final int shoppingCartItemAmount;
  final String shoppingCartItemImage;

  ShoppingCartItem({
    required this.shoppingCartItemId,
    required this.shoppingCartItemName,
    required this.shoppingCartUnitPrice,
    required this.shoppingCartItemAmount,
    required this.shoppingCartItemImage,
  });

  factory ShoppingCartItem.fromJson(Map<String, dynamic> json) => ShoppingCartItem(
    shoppingCartItemId: json["shopping_cart_item_id"],
    shoppingCartItemName: json["shopping_cart_item_name"],
    shoppingCartUnitPrice: json["shopping_cart_unit_price"]?.toDouble(),
    shoppingCartItemAmount: json["shopping_cart_item_amount"],
    shoppingCartItemImage: json["shopping_cart_item_image"],
  );

  Map<String, dynamic> toJson() => {
    "shopping_cart_item_id": shoppingCartItemId,
    "shopping_cart_item_name": shoppingCartItemName,
    "shopping_cart_unit_price": shoppingCartUnitPrice,
    "shopping_cart_item_amount": shoppingCartItemAmount,
    "shopping_cart_item_image": shoppingCartItemImage,
  };
}