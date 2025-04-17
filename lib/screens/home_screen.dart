import 'package:ecom_app/screens/cart_screen.dart';
import 'package:ecom_app/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  List<Widget> screens = [ProductListScreen(), CartScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold
        ),
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart'
          ),
        ],
      ),
    );
  }
}
