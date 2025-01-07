import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../components/cards/featured-items-card.dart';
import '../../../components/cards/item-card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(hintText: "Buscar..."),
              )),
              IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('Destacados:',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 400,
                child: TopItemsCarousel(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('Todos los Productos:',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              ProductList(),
            ],
          ),
        ),
      ],
    );
  }
}

class TopItemsCarousel extends StatelessWidget {
  const TopItemsCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
      ),
      items: List<Widget>.generate(5, (int index) {
        return FeaturedItemCard(itemID: 'D${(index + 1).toString()}',);
      }),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ItemCard(itemID: (index + 1).toString(),);
          }),
    );
  }
}
