import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIWidget extends StatefulWidget {
  @override
  APIDATA createState() => APIDATA();

}


class APIDATA extends State<APIWidget> {

  getData() async {
    var resp = await http.get(Uri.https('jsonplaceholder.typicode.com','users'));
  var jsonData = jsonDecode(resp.body);
  List<User> users = [];

    for(var u in jsonData) {
      User user = User(u["name"],u["email"],u["username"]);
      users.add(user);
      print(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text("Contacts"
        ,style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 30)),
        Container (height: 430,
        child: Card (
           child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.data == null) {
                return Container(
                    child: Center(
                      child: Text("Loading users..."),
                    ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return Card (child: ListTile(
                      title: Text(snapshot.data[i].name),
                      trailing: Text(snapshot.data[i].email),
                    ),);
              },);
              }
            },

          ),
            ),),]);

        /*ElevatedButton (onPressed: () {
          getData();
        },
        child: Text("Get Info")
        );*/
  }
}

class User {
  final String name, email, userName;
  User(this.name, this.email, this.userName);
}
