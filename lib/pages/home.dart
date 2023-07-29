

import 'package:ephamarcy/controllers/cartcontroller.dart';
import 'package:ephamarcy/pages/cartpage.dart';
import 'package:ephamarcy/pages/favourites.dart';
import 'package:ephamarcy/pages/mainpage.dart';
import 'package:ephamarcy/pages/profilepage.dart';
import 'package:ephamarcy/widgets/categories_widgets.dart';
import 'package:ephamarcy/widgets/products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int selectedIndex=0;
  void _onItemTap(int index){
    setState(() {
      selectedIndex=index;
    });
  }

  List<Widget>pages=[
   const MainPage(),
   const FavouritesPage(),
   const CartPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    final cart=ref.watch(cartControllerProvider.notifier);
    
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTap
        ,items:  <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.blue,
                  size: 30,
                ),
                label: "Home"),
          const  BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.blue,
                  size: 30,
                ),
                label: "Favourites"),
            BottomNavigationBarItem(
                icon: Stack(
                  children: [
                const    Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.blue,
                      size: 30,
                    ),
                    Positioned(top: -3,right: -1,child: Text("${cart.products.length}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),))
                  ],
                ),
                label: "Cart"),
          const  BottomNavigationBarItem(
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
