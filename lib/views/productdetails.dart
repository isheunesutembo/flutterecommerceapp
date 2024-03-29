
import 'package:ephamarcy/controllers/cartcontroller.dart';
import 'package:ephamarcy/controllers/productwishlistcontroller.dart';
import 'package:ephamarcy/core/utils.dart';
import 'package:ephamarcy/models/product.dart';
import 'package:ephamarcy/views/relatedproducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends ConsumerStatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  ConsumerState<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends ConsumerState<ProductDetailsPage> {
  bool _isFavourite=false;
  Product? product;
  @override
  
  @override
  Widget build(BuildContext context) {

      final productsController=Get.put(ProductWishListController());
   
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    
    final cart=ref.watch(cartControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            
                  GestureDetector(
                      onTap: (){
                         ref.watch(cartControllerProvider.notifier).addProductToCart(product,context);
                         showSnackBar(context, "Added to Cart");
                      },
                      child:const Stack(
                        children: [
                           Icon(
                            Icons.shopping_cart,
                            color: Colors.blue,
                            size: 25,
                          ),
                         
                        ],
                      ),
                    ),
                 IconButton(onPressed:(){
               productsController.addProduct(product, context);
                 
                 },icon:Icon( _isFavourite? Icons.favorite:Icons.favorite_outline,size: 30,))
                
           ],)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            
                Image.network(
                  product.image!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
               
              
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                product.name!,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.description!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "\$${product.price}",
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                         ref.read(cartControllerProvider.notifier).addProductToCart(product,context);
                         showSnackBar(context, "Added to Cart");
                        
                      }, child: Text("Add To Cart"))),
            ),
            const SizedBox(
              height: 32,
            ),
           
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Similar Products",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
             
              
            const SizedBox(
              height: 16,
            ),
            RelatedProducts(categoryname: product.categoryname.toString())
          ],
        ),
      ),
    );
  }
}
