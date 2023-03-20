
import 'package:ephamarcy/pages/cart_page.dart';
import 'package:ephamarcy/pages/favourites.dart';
import 'package:ephamarcy/pages/mainpage.dart';
import 'package:ephamarcy/pages/profilepage.dart';
import 'package:ephamarcy/widgets/categories_widgets.dart';
import 'package:ephamarcy/widgets/products_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex=0;
  void _onItemTap(int index){
    setState(() {
      selectedIndex=index;
    });
  }

  List<Widget>pages=[
    MainPage(),
    FavouritesPage(),
    CartPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTap
        ,items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.blue,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.blue,
                  size: 30,
                ),
                label: "Favourites"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.blue,
                  size: 30,
                ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 30,
                ),
                label: "Profile"),
          ],
        ),
        body: pages[selectedIndex]);
  }
}
