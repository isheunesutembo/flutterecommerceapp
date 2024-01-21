
import 'package:ephamarcy/controllers/categoriescontroller.dart';
import 'package:ephamarcy/views/productsbycategory.dart';
import 'package:ephamarcy/widgets/errortext.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesWidget extends ConsumerWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 100,
      child:ref.watch(categoriesProvider).when(data: (data)=>
      ListView.builder(
        shrinkWrap: true,
        physics:const ClampingScrollPhysics(),
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsByCategoryPage(),settings: RouteSettings(arguments: data[index])));
              },
              child: Container(
                
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200]),
                child: Column(
                    children: [
                      Image.network(
                          data[index].image.toString(),
                          fit: BoxFit.cover,
                          height: 60,
                          width: 60,
                        ),
                      
                      Text(
                        data[index].name.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
              ),
            ),
          );
         
        },
      ),
      
      
       error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>Loader())
    );
  }
}
