import 'package:flutter/material.dart';
import 'package:user_management_app/models/user.dart';
import 'package:user_management_app/screens/add_user.dart';
import 'package:user_management_app/screens/edit_user.dart';
import 'package:user_management_app/screens/view_user.dart';
import 'package:user_management_app/services/userservices.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<User> _userList = <User>[];
  final _useService = UserService();

  getAllUsers() async {
    var users = await _useService.readAllUsersData();
    _userList = <User>[];
    users.forEach((user){
      setState((){
        var userModel = User();
        userModel.id = user['id'];
        userModel.name = user['name'];
        userModel.contact = user['contact'];
        userModel.description = user['description'];
        _userList.add(userModel);
      });
    });
  }
  @override
  void initState(){
    //implement initial state
    getAllUsers();
    super.initState();
  }


  _showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message),),);
  }

  _deleteDataDialog(BuildContext context,userId){
    return showDialog(
        context: context,
        builder:(param){
          return AlertDialog(
            title: Text("Are you sure to delete it?"),
            actions: [
              ElevatedButton(
                  onPressed: () async{
                    var result = await _useService.deleteUser(userId);
                    setState(() {
                      if(result != null){
                        Navigator.pop(context);
                        getAllUsers();
                        _showSnackBar("User has been deleted!");
                      }
                    });
                  },
                  child:Text("Delete")),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child:Text("Cancel")),
            ],
          );
        });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite CRUD App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: _userList.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context) => ViewUser(user: _userList[index],) ));
                },
                leading: Icon(Icons.person),
                title: Text(_userList[index].name ?? ''),
                subtitle: Text(_userList[index].contact ?? ''),
                trailing: SizedBox(
                  width: 150.0,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder:(context) => EditUser(user: _userList[index],) )).then((value) => ((data){

                            }));

                          },
                          icon:Icon(Icons.edit),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: (){
                            _deleteDataDialog(context, _userList[index].id);
                          },
                          icon:Icon(Icons.delete),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(context) => AddUser() ));
        },
        child:Icon(Icons.add)
      ),
    );
  }
}
