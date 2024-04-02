import 'package:ephamarcy/controllers/addresscontroller.dart';
import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/controllers/ordercontroller.dart';
import 'package:ephamarcy/controllers/stripepaymentcontroller.dart';
import 'package:ephamarcy/models/address.dart';
import 'package:ephamarcy/models/user.dart';
import 'package:ephamarcy/views/add_addresspage.dart';
import 'package:ephamarcy/views/ordercompletedpage.dart';
import 'package:ephamarcy/widgets/cart_item_widget.dart';
import 'package:ephamarcy/widgets/errortext.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckOutScreen extends ConsumerWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

        final currentUser = FirebaseAuth.instance.currentUser;
        final useraddress = ref.watch(getUserAddress);
       
        final userProvider = ref.watch(getUserDataProvider(currentUser!.uid));
    return Scaffold(
      appBar: AppBar(
        title:const Center(child:  Text("CheckOut ",
        style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
        elevation: 0,
       
      ),
      body: userProvider.when(data: (userData){
        return userData.cart!.isNotEmpty? useraddress !=null? useraddress.when(data: (address){
        final addressData=AddressModel(city: address.city, address: address.address, houseNo: address.houseNo, zipCode: address.zipCode);
        

        return SingleChildScrollView(
          child: Column(
            children: [
          const  Center(child:  Text("Your Address",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
              Stack(
                children: [
                

                  Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 300,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Address:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      address.address,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "City",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      address.city,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "HouseNo",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      address.houseNo,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "ZipCode",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      address.zipCode.toString(),
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                         GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddAddressPage()));
                 },child: const Positioned(top: 0,left: 5,child: Icon(Icons.add))),
                ],
              ),
                    const Text("Your Products",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    userProvider.when(data: (data){
                       
                       return SizedBox(
                        height: MediaQuery.of(context).size.height*0.8,
                         child: ListView(
                                             children: [
                                               Column(
                            children: data.cart!
                                .map((cartItem) => CartItemWidget(item: cartItem))
                                .toList()),
                                const SizedBox(height: 16,),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                         children: [
                                                          const Text("Total",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                                      
                                                           Text(
                                                                 "\$${data.grandTotal.toString()}",
                                                                 style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                                               ),
                                                         ],
                                                       ),
                                 ),

                                     Center(
                                       child: Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: SizedBox(
                                          height: 50,
                                          width: 400,
                                           child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                                           ref.read(getUserDataProvider(currentUser!.uid))
                                           .whenData((value) {
                                             return ref.read(orderControllerProvider.notifier)
                                            .createOrder(context,currentUser.uid, value,addressData, data.grandTotal)
                                            .then((value){
                                             ref.read(stripePaymentController.notifier).makePayment(context, data.grandTotal)
                                             .then((value) {
                                           
                                              Navigator.push(context, MaterialPageRoute(builder:(context)=>const OrderCompletedPage()));
                                             });
                                            
                                      
                                            
                                              
                                            }  );
                                           });
                                            
                                         
                                            
                                           
                                                               }, child:const Text("Place Order",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                         ),
                                       ),
                                     )
                                             ],
                                           ),

                       );
                    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader()),
                
                   
            ],
          ),
        );
        

      }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader()):const Center(child: const Text("Your address is empty please make sure you add an addrress to continue",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)):const Text("You cannot place an order on empty items",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),);
      }, error:(error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader())

    );
  }
}