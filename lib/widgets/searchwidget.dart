import 'package:ephamarcy/widgets/searchdelegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: TextField(
          decoration: InputDecoration(
            
            hintText: "Search ",
            hintStyle: const TextStyle(color: Colors.black),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    width: 0, style: BorderStyle.solid, color: Colors.black)),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          onTap: () {
            showSearch(context: context, delegate: SearchProducts(ref));
          },
        ),
      ),
    );
  }
}
