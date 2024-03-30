import 'package:ephamarcy/views/cartpage.dart';
import 'package:ephamarcy/views/categoriespage.dart';
import 'package:ephamarcy/views/mainpage.dart';
import 'package:ephamarcy/views/productwishlistpage.dart';
import 'package:ephamarcy/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = [
    const MainPage(),
    const CategoriesPage(),
    const ProductsWishListPage(),
    const CartPage(),
    SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(elevation: 0,automaticallyImplyLeading: false,),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.orange,
          onTap: _onItemTap,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                label: "Favourites"),
                 BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black,
                  size: 30,
                ),
                label: "Favourites"),
            BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                  ],
                ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 30,
                ),
                label: "Settings"),
          ],
        ),
        body: pages[selectedIndex]);
  }
}
