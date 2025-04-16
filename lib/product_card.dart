import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color bgColor;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 5),
          Text(
            "\$$price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 5),
          Center(
            child: Image.asset(
              image,
              height: 185,
            ),
          ),
        ],
      ),
    );
  }
}
