import 'package:ephamarcy/controllers/productcontroller.dart';
import 'package:ephamarcy/models/categories.dart';
import 'package:ephamarcy/views/productdetails.dart';
import 'package:ephamarcy/widgets/errortext.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/loader.dart';

class ProductsByCategoryPage extends ConsumerWidget {
  ProductsByCategoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ModalRoute.of(context)!.settings.arguments as Categories;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ))),
      body: ref.watch(getProductByCategoryNameProvider(categories.name!)).when(
          data: (data) {
            return data.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 2 / 3),
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductDetailsPage(),
                                        settings: RouteSettings(
                                            arguments: data[index])));
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
                                      Stack(
                                        children: [
                                          Image.network(
                                            data[index].image!,
                                            fit: BoxFit.fitHeight,
                                            height: 150,
                                            width: double.infinity,
                                          ),
                                          Positioned(
                                              top: 5,
                                              right: 0,
                                              child: data[index].isAvailable!
                                                  ? const Text("")
                                                  : Container(
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.blueAccent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: const Text(
                                                        "Out Of Stock",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ))
                                        ],
                                      ),
                                      Center(
                                          child: Text(
                                        data[index].name!,
                                        style: const TextStyle(
                                            fontSize: 20,
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
                                            Text(
                                              "\$${data[index].oldprice}",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }))
                : const Center(
                    child: Text(
                      "No products in this category",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                  );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader()),
    );
  }
}
