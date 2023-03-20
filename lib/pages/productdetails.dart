
import 'package:ephamarcy/models/product.dart';
import 'package:ephamarcy/pages/relatedproducts.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Image.network(
                  product.image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Positioned(
                      top: 10,
                      left: 10,
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.black,
                      )),
                ),
                const Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(
                      Icons.shopping_basket,
                      color: Colors.blue,
                      size: 25,
                    )),
                const Positioned(
                    top: 10,
                    right: 60,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.blue,
                      size: 25,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                product.name,
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
                  product.description,
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
                      onPressed: () {}, child: Text("Add To Cart"))),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Related Products",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "See All",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          //  const RelatedProducts()
          ],
        ),
      ),
    );
  }
}
