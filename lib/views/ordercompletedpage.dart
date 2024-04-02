import 'package:ephamarcy/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
      automaticallyImplyLeading: false,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
            CircleAvatar(child:Image.asset('assets/icon/order.png') ,radius: 80,),
             const Text("Thank you!,Order placed and is being processed",
            style: TextStyle(color: Colors.orange,fontSize: 15,
            fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              },
              child: const Text("Back To Shopping",
              style: TextStyle(color: Colors.orange,fontSize: 15,)),
            )
          ],
        ),
      ),
    );
  }
}