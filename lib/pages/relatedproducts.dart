
import 'package:ephamarcy/pages/productdetails.dart';
import 'package:flutter/material.dart';
/*
class RelatedProducts extends StatelessWidget {
  const RelatedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: FakeData.products.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(),
                      settings:
                          RouteSettings(arguments: FakeData.products[index])));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 1,
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      FakeData.products[index].productImage,
                      fit: BoxFit.fitHeight,
                      height: 150,
                    ),
                    Center(
                        child: Text(
                      FakeData.products[index].productName,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "\$${FakeData.products[index].productPrice}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
*/
