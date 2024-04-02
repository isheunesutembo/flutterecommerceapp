
import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/controllers/cartcontroller.dart';
import 'package:ephamarcy/controllers/productcontroller.dart';
import 'package:ephamarcy/controllers/productwishlistcontroller.dart';
import 'package:ephamarcy/views/productdetails.dart';
import 'package:ephamarcy/widgets/errortext.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class Products_Widget extends ConsumerWidget {
  const Products_Widget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height=MediaQuery.of(context).size.height;
    final products = ref.watch(getProductsProvider);
    final currentUser = FirebaseAuth.instance.currentUser;
    final userData = ref.watch(getUserDataProvider(currentUser!.uid));
      final propertiesController=Get.put(ProductWishListController());
    return
    userData.when(data: (userData){
      return products.when(
        data: (data) {
          
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 3),
              itemCount: data.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final product = data[index];
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ProductDetailsPage(),
                                settings:
                                    RouteSettings(arguments: data[index])));
                      },
                      child: Container(
                        height:height*0.2,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Expanded(
                              child: Positioned(bottom: 0,left: 0,child: GestureDetector(
                                onTap: (){
                                  propertiesController.addProduct(product, context);
                               
                                },
                                child:const Icon(
                                      Icons.favorite,color: Colors.black,
                                    ),
                              )),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 32,
                                ),
                                Stack(
                                  children: [
                                    Image.network(
                                      data[index].image!,
                                      fit: BoxFit.fitHeight,
                                      height: 150,
                                      width: double.infinity,
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 5,
                                        child: Stack(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                              if(product.isAvailable==true){
                             ref
                                                      .watch(
                                                          cartControllerProvider
                                                              .notifier)
                                                      .addProductToCart(
                                                          data[index], context);
                                              }else{
                                                ScaffoldMessenger.of(context).showSnackBar(
                                           const    SnackBar(content: Text("The product is not in stock")));
                                              }
                                                 
                                                },
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape:
                                                                    BoxShape.circle,
                                                                color: Colors.black),
                                                        child: const Icon(
                                                          Icons
                                                              .shopping_cart_outlined,
                                                          color: Colors.white,
                                                          size: 20,
                                                        )),
                                                      userData.cart != null  ? Positioned(top: 0,right: 5,child: Text(userData.cart!.length.toString(),
                                                      style: const TextStyle(color: Colors.white,fontSize: 15,
                                                      fontWeight: FontWeight.bold),)):const Text("")
                                                  ],
                                                )),
                                          ],
                                        )),
                                     
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: data[index].isAvailable != false
                                            ? const Text("")
                                            : Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: const Text(
                                                  "Out Of Stock",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              )),
                                  ],
                                ),
                                Center(
                                    child: Text(
                                  data[index].name!,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                )),
                                const SizedBox(
                                  height: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${data[index].price}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "\$${data[index].oldprice}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                );
              });
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>Loader());
    
     
  }
}
