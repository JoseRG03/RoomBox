import 'package:flutter/material.dart';
import 'package:room_box_app/api/database-service.dart';

import '../../../api/articles-service.dart';
import '../../../components/snack-bar.dart';
import '../../../models/responses/article.dart';

class ItemDescription extends StatefulWidget {
  const ItemDescription({super.key, required this.itemID});
  final String itemID;

  @override
  State<ItemDescription> createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {

  bool isLoading = false;
  bool isAddingToCart = false;
  Article? selectedArticle;

  @override
  initState () {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _getInitialData();
    });
  }

  Future<void> _getInitialData () async {
    setState(() {
      isLoading = true;
    });

    ArticlesService articlesService = new ArticlesService();
    Article? article = await articlesService.getArticle(widget.itemID);

    print("Image url: ${selectedArticle?.image}");

    setState(() {
      isLoading = false;
      selectedArticle = article;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading ? Center(child: CircularProgressIndicator()) : Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: 450,
                width: double.infinity,
                child: Stack(children: [
                  Image.network(
                    selectedArticle?.image ?? '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/template-images/base-image.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      );
                    },
                  ),
                ]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    selectedArticle?.articleName ?? '',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '\$${selectedArticle?.articleUnitPrice ?? 0.00} DOP',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                selectedArticle?.articleDescription ?? "Incredible item, comes in all shapes, colors, and flavors"),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Color.fromRGBO(83, 24, 125, 1.0),
              onPressed: () async {
                setState(() {
                  isAddingToCart = true;
                });
                DatabaseService db = DatabaseService.instance;
                await db.addToShoppingCart(widget.itemID, selectedArticle?.articleName ?? '', double.tryParse(selectedArticle?.articleUnitPrice ?? '') ?? 0, selectedArticle?.imageUrl ?? '');

                ScaffoldMessenger.of(context).showSnackBar(addToCartSnackBar);

                setState(() {
                  isAddingToCart = true;
                });
              },
              child: Text('Agregar al Carrito', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
