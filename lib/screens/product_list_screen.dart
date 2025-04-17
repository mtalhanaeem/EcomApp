import 'package:ecom_app/widgets/product_card.dart';
import 'package:ecom_app/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../global_variables.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const myBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
        right: Radius.zero,
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          /** Top Heading Text and Search Bar */
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Shoes\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: myBorder,
                    enabledBorder: myBorder,
                    focusedBorder: myBorder,
                  ),
                ),
              ),
            ],
          ),
          /** Brand Name Filters Row */
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      label: Text(filter),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 15.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          /** Vertical Product List */
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsScreen(product: product);
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    bgColor: index.isEven
                        ? Color.fromRGBO(216, 240, 253, 1)
                        : Theme.of(context).colorScheme.secondary,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
