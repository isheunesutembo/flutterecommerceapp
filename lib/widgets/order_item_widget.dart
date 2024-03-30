import 'package:ephamarcy/models/cartitem.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderItemWidget extends StatelessWidget {
  CartItem item;
  OrderItemWidget({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
                    title: Text(item.name,style:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                    leading: Image.network(item.image,height: 30,width: 30,),
                    trailing: Text("\$${item.price}",style:const TextStyle(color: Colors.orange,fontSize: 18,fontWeight: FontWeight.w600),),
                  );
  }
}