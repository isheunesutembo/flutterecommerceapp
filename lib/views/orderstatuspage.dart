import 'package:ephamarcy/controllers/ordercontroller.dart';
import 'package:ephamarcy/widgets/errortext.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:ephamarcy/widgets/order_item_widget.dart';
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
      body: ListView.builder(scrollDirection: Axis.vertical,shrinkWrap: true,itemCount: data.length,itemBuilder: (context,index){
             final order=data[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Card(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
                    ExpansionTile(title: Column(children: [
 const           SizedBox(height: 10,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        const Text("Order Id:",
                            style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                         Expanded(
                           child: Text(order.orderId.toString(),overflow: TextOverflow.ellipsis,
                              style:const TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500,),),
                         ),
                       ],
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
                  ),
                    ],),
                    children: [
                        Column(children: data[index].products.map((order) =>OrderItemWidget(item: order) ).toList())
                    ],),
                   
                 
                
                  ],)
                  ,
                ),
              ),
             if(data[index].isAccepted==true&&data[index].isCancelled==false&&data[index].isDelivered==false)...{
               Positioned(top: 2,right: 0,child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.circular(5)),
                               child:const Text("Accepted",style: TextStyle(color: Colors.white,fontSize: 15),),),
               ))
             }else if(data[index].isDelivered==true&&data[index].isAccepted==true)...{
                Positioned(top: 2,right: 0,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.circular(5)),
                                child:const Text("Delivered",style: TextStyle(color: Colors.white,fontSize: 15),),),
                ))
             }else if(data[index].isCancelled==true)...{
               Positioned(top: 2,right: 0,child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(decoration: BoxDecoration(color:Colors.red,borderRadius: BorderRadius.circular(5)),
                               child:const Text("Cancelled",style: TextStyle(color: Colors.white,fontSize: 15),),),
               ))
             }else if(data[index].isCancelled==false&&data[index].isAccepted==false&&data[index].isDelivered==false)...{
               Positioned(top: 2,right: 0,child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(decoration: BoxDecoration(color:Colors.grey,borderRadius: BorderRadius.circular(5)),
                               child:const Text("Pending",style: TextStyle(color: Colors.white,fontSize: 15),),),
               ))
             }
               
            ],
          ),
        );
      
      })
    );

    }, error: (error,stackTrace)=>ErrorText(error:error.toString()), loading: ()=>Loader());
  }
}