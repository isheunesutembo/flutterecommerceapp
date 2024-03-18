import 'package:ephamarcy/controllers/productwishlistcontroller.dart';
import 'package:ephamarcy/core/utils.dart';
import 'package:ephamarcy/models/product.dart';
import 'package:ephamarcy/widgets/errortext.dart';
import 'package:ephamarcy/widgets/loader.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';


class ProductsWishListPage extends ConsumerStatefulWidget {
  const ProductsWishListPage({super.key});
  @override
  ConsumerState<ProductsWishListPage> createState() => _ProductsWishListPageState();
}


class _ProductsWishListPageState extends ConsumerState<ProductsWishListPage> {
  @override
  void initState() {
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  final productsController=Get.put(ProductWishListController());
     return Scaffold(
      appBar: AppBar(elevation: 0,
     
      title:const Text("Your Wish List",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),),
      body: GetBuilder<ProductWishListController>(builder: (controller)=>SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(shrinkWrap: false,physics:const BouncingScrollPhysics(),itemCount: controller.productsCount,itemBuilder: (context,index){
        if(controller.productsCount>0){
          Product? product=controller.observableBox.getAt(index);
     return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            product!.image.toString(),
            width: 100,
          ),
        ),
        Column(children: [
          Text(product.name.toString(),
          style:const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w800),),
          Text("\$${product.price}",
          style:const TextStyle(color: Colors.orange,fontSize: 15,fontWeight: FontWeight.w800),),

        ],),
       
        GestureDetector(onTap: (){
         controller.deleteProduct(index, context);
        },child: Icon(Icons.delete,color: Colors.black,))
        
       
       
      ],
    );
        }
             
        }),
      )));
  }
}