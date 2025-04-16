import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late int selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Column(
        children: [
          /** Top Heading */
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          /** Spacer for equal space on top and Bottom of Image */
          Spacer(),
          /** Middle Image */
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          Spacer(flex: 2),
          /** Bottom Container */
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(40),
                right: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /** Bottom Container Price */
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                /** Bottom Container Shoe Size List */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {

                            },
                            child: Chip(
                              label: Text(size.toString()),
                              backgroundColor: selectedSize == size
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                /** Bottom Container Add to Cart Button */
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    label: Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
