import 'package:flutter/material.dart';
import 'package:user_management_app/models/user.dart';
import 'package:user_management_app/services/userservices.dart';

class EditUser extends StatefulWidget {
  final User user;

  const EditUser({Key?key, required this.user}): super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var _userService = UserService();
  @override
  void initState() {
    // TODO: implement initState
    nameController.text = widget.user.name ?? "";
    contactController.text = widget.user.contact ?? "";
    descriptionController.text = widget.user.description ?? "";

    super.initState();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Edit User"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                hintText: "Enter Name",
                labelText: "Name",
              ),
            ),
            SizedBox(height: 15.0,),
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                hintText: "Enter Contact",
                labelText: "Contact",
              ),
            ),
            SizedBox(height: 15.0,),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                hintText: "Enter Description",
                labelText: "Description",
              ),
            ),
            SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(

                    onPressed: (){
                      setState(()  {
                        updateData();
                      });
                    },
                    child: Text("Update"),
                    style:ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white)),
                SizedBox(width: 10,),
                ElevatedButton(
                    onPressed: (){},
                    child: Text("Reset"),
                    style:ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white))
              ],
            )

          ],
        ),

      ),

    );
  }
  Future updateData() async{
    var _user = User();
    _user.id = widget.user.id;
    _user.name = nameController.text;
    _user.contact = contactController.text;
    _user.description = descriptionController.text;

    var result = await _userService.updateUser(_user);
    Navigator.pop(context,result);
    print("user updated!");

  }
}
