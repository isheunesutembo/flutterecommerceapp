import 'package:ephamarcy/widgets/categories_widgets.dart';
import 'package:ephamarcy/widgets/products_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              elevation: 1,
              child: SizedBox(
                height: height * 0.09,
                child: const Center(
                    child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(Icons.tune),
                      hintText: "Search product",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                      contentPadding: EdgeInsets.only(top: 12)),
                )),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoriesWidget(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
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