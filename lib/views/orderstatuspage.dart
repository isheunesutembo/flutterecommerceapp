import 'package:ephamarcy/controllers/ordercontroller.dart';
import 'package:ephamarcy/widgets/errortext.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class OrderStatusPage extends ConsumerWidget {
  const OrderStatusPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final orders=ref.watch(getUserOrders(currentUser!.uid));
    return  orders.when(data: (data){
      return Scaffold(
      appBar: AppBar(
        title:const Center(child:  Text("My Orders")),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(shrinkWrap: true,itemCount: data.length,itemBuilder: (context,index){
       final order=data[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Card(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
                      const SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                            const Text("OrderId:",
                                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                             Text(order.orderId.toString(),
                                style:const TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500,),),
                           ],
                         ),
                       ),
                          const SizedBox(height: 15,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          const Text("Date",
                                  style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                               Text(DateFormat.yMMMM().format(order.date),
                                  style:const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                      ],),
                    ),
                          const SizedBox(height: 15,),
                  
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          const Text("Total:",
                                  style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                               Text("\$${order.total}",
                                  style:const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                      ],),
                    )
                  
                    ],)
                    ,
                  ),
                ),
                Positioned(top: 2,right: 0,child: Container(decoration: BoxDecoration(color: order.orderStatus.toString()=="OrderStatus.pending"||order.orderStatus.toString()=="OrderStatus.processing"?Colors.yellow[700]:Colors.green,borderRadius: BorderRadius.circular(5)),
                child: Text(order.orderStatus.toString(),style:const TextStyle(color: Colors.white,fontSize: 15),),)),
                 
              ],
            ),
          );

        })
      )
    );

    }, error: (error,stackTrace)=>ErrorText(error:error.toString()), loading: ()=>Loader());
  }
}