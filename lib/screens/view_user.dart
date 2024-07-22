import 'package:flutter/material.dart';
import 'package:user_management_app/models/user.dart';
import 'package:user_management_app/services/userservices.dart';

class ViewUser extends StatefulWidget {
  final User user;
  const ViewUser({Key? key,required this.user}) : super(key: key);




  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View User"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Container(
        height: 200,
        padding: EdgeInsets.all(15.0),
       child: Card(
         elevation: 15.0,
         color: Colors.blueAccent,
         child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
             children: [
               Row(
                 children: [
                   Text("ID",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                   Text(widget.user.id.toString(), style: TextStyle(fontSize: 16,color: Colors.white),),
                 ],
               ),
               Row(
                 children: [
                   Text("Name: " ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                   Text(widget.user.name ?? "" , style: TextStyle(fontSize: 16,color: Colors.white),),
                 ],
               ),
               Row(
                 children: [
                   Text("Contact: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                   Text(widget.user.name ?? "" , style: TextStyle(fontSize: 16,color: Colors.white),),
                 ],
               ),
               Row(
                 children: [
                   Text("Description: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                   Text(widget.user.name ?? "" , style: TextStyle(fontSize: 16,color: Colors.white),),
                 ],
               ),
             ],
           ),
         ),
       ),
      ),

    );
  }
}
