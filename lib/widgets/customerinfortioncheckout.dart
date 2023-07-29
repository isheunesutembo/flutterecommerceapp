import 'package:ephamarcy/models/fakeuser.dart';
import 'package:flutter/material.dart';

class CustomerInformationCheckOut extends StatelessWidget {
  const CustomerInformationCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final user=FakeUser.user[0];
    return Card(
      elevation: 10,
      child: Column(
        children: [
          Text("Fullname"+user.firstname.toString()+user.toString(),style:const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)

        ],
      ),
    );
  }
}