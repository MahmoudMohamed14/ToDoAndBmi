import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class UserModel{
  int id;
  final String name,phone;

  UserModel({@required this.id,@required this.name, @required this.phone});
}

class UsersModel extends StatelessWidget {
  @override
  List<UserModel>users=[
    UserModel(id: 1, name: 'mahmoud', phone: '01778674535'),
    UserModel(id: 2, name: 'mohamed', phone: '0107675535'),
    UserModel(id: 3, name: 'ahmed', phone: '0167866535'),
    UserModel(id: 4, name: 'mahmoud', phone: '01548674535'),
    UserModel(id: 1, name: 'mahmoud', phone: '01778674535'),
    UserModel(id: 2, name: 'mohamed', phone: '0107675535'),
    UserModel(id: 3, name: 'ahmed', phone: '0167866535'),
    UserModel(id: 4, name: 'mahmoud', phone: '01548674535'),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Users',

       ),
        titleSpacing: 20,
      ),
      body: ListView.separated(
          itemBuilder: (context,item)=>UserModelItem(users[item]),
          separatorBuilder: (context,item)=>Container(width: double.infinity,height: 1,color: Colors.grey[300],),
          itemCount: users.length)
    );
  }
  Widget UserModelItem(UserModel user)=>Padding(
    padding: const EdgeInsets.all(20),
    child: Row(

      children: [

        CircleAvatar(
          radius: 30,
          child: Text(
           '${user.id}' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          mainAxisSize: MainAxisSize.min,
          children: [
            Text(user.name),
            Text(user.phone),

          ],)

      ],),
  );
}
