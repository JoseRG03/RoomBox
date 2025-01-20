import 'package:flutter/material.dart';
import 'package:room_box_app/api/database-service.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    super.key,
    required this.title,
    required this.cost,
    required this.units,
    required this.imageUrl, required this.itemId, required this.isEditable,
  });
  final String? itemId;
  final String title;
  final double cost;
  final int units;
  final String imageUrl;
  final bool isEditable;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int quantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      quantity = widget.units;
    });
  }
  void addToQuantity() {
    DatabaseService db = DatabaseService.instance;

    if (widget.itemId != null) {
      db.addToQuantity(widget.itemId ?? '');
    }

    setState(() {
      quantity += 1;
    });
  }

  void removeFromQuantity() {
    DatabaseService db = DatabaseService.instance;

    if (widget.itemId != null) {
      db.removeFromQuantity(widget.itemId ?? '');
    }

    setState(() {
      quantity -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 115,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(2.5, 2.5),
              blurRadius: 10.0,
              spreadRadius: 3.0)
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: widget.isEditable ? EdgeInsets.all(8.0) : EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title.toUpperCase(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('\$${widget.cost} DOP'),
                  Row(
                    children: [
                      Text('${quantity} unidad${quantity > 1 ? 'es' : ''}'),
                      widget.isEditable ? IconButton(onPressed: addToQuantity, icon: Icon(Icons.add), iconSize: 15,) : Container(),
                      widget.isEditable && quantity > 1 ? IconButton(onPressed: removeFromQuantity, icon: Icon(Icons.remove), iconSize: 15,) : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                  height: 150,
                  width: 100,
                  child: Image.network(
                    widget.imageUrl,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/template-images/base-image.jpg',
                        fit: BoxFit.cover,
                      );
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
