import 'package:flutter/material.dart';

import '../../../api/articles-service.dart';
import '../../../models/responses/article.dart';

class ItemDescription extends StatefulWidget {
  const ItemDescription({super.key, required this.itemID});
  final String itemID;

  @override
  State<ItemDescription> createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {

  bool isLoading = false;
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

    print("WIDGET ID: ${widget.itemID}");
    ArticlesService articlesService = new ArticlesService();
    Article? article = await articlesService.getArticle(widget.itemID);

    print("RECIEVED ARTICLE: ${article?.articleName}");

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
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: AssetImage(
                          selectedArticle?.imageUrl ?? 'assets/template-images/base-image.jpg'),
                      fit: BoxFit.cover),
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
                'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. '),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.yellow,
              onPressed: () {
                print('Carrito');
              },
              child: Text('Agregar al Carrito'),
            ),
          ],
        ),
      ),
    );
  }
}
