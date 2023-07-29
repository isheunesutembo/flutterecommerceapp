import 'package:ephamarcy/controllers/cartcontroller.dart';
import 'package:ephamarcy/pages/cartpage.dart';
import 'package:ephamarcy/widgets/categories_widgets.dart';

import 'package:ephamarcy/widgets/products_widget.dart';
import 'package:ephamarcy/widgets/searchdelegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    final cart = ref.watch(cartControllerProvider.notifier);
    return Scaffold(
        appBar: AppBar(elevation: 0, backgroundColor: Colors.white, actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                child: Stack(
                  children: [
                    const Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.black,
                    ),
                    Positioned(
                      right: -1,
                      top: -4,
                      child:  Text(
                          "${cart.products.length}",
                          style:const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      
                    ),

                  ],
                )),
                
                
          ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: GestureDetector(onTap: (){
           showSearch(context: context, delegate: SearchProducts(ref));
           },child: const Icon(Icons.search,color: Colors.black,size: 30,)),
         )
        ]),
        body:const SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(
                height: 10,
              ),
             
              
               Padding(
                padding:  EdgeInsets.all(8.0),
                child: CategoriesWidget(),
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(
                      "Products",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const Products_Widget()
            ],
          ),
        ));
  }
}
