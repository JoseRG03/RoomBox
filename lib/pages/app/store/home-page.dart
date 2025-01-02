import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: TextField(decoration: InputDecoration(hintText: "Buscar..."),)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    Text('Destacados:'),
                    SizedBox(
                      height: 400,
                      child: CarouselView(
                        itemExtent: double.infinity,
                        scrollDirection: Axis.horizontal,
                        children: List<Widget>.generate(10, (int index) {
                          return Card(child: Center(child: Text('Item $index')));
                        }),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Todos los Productos:'),
                    ProductList(),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(child: Center(child: Text((index + 1).toString())));
        });
  }
}
