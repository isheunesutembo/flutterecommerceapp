
import 'package:ephamarcy/controllers/productcontroller.dart';
import 'package:ephamarcy/views/productdetails.dart';
import 'package:ephamarcy/widgets/errortext.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RelatedProducts extends ConsumerWidget {
  String categoryname;
  RelatedProducts({required this.categoryname, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final relatedProducts = ref.watch(relatedProductsProvider(categoryname));

    return relatedProducts.when(
        data: (data) {
          return Container(
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return data.isNotEmpty? Padding(
                  padding: const EdgeInsets.all(2),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(),
                              settings: RouteSettings(arguments: data[index])));
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
                                                color: Colors.blueAccent,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Text(
                                              "Out Of Stock",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
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
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.lineThrough),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ):const Center(child: Text("No Products"),);
              },
            ),
          );
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
