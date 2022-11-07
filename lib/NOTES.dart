import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class NOTES extends StatefulWidget {
  @override
  NOTESDATA createState() => NOTESDATA();
}

class NOTESDATA extends State<NOTES> {
  final textControl =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    return Column (children: [
    Title(color: Colors.black, child: Text("TODO List"
    ,style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 30),)),
    StreamBuilder(
            stream: products.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return
                Container (height: 403,
              child: ListView(
                children: snapshot.data!.docs.map((products) {
                  return Center(
                    child: ListTile(onLongPress: () {
                      products.reference.delete();
                    },
                      title: Card ( child: Row (
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                      Text(products['name']),
                      Icon(Icons.delete_forever),

                  ]),
                    ),),
                  );
                }).toList(),
              ),);
            }),
      TextField (
        controller: textControl,
      ),
      FloatingActionButton(

          child: Icon(Icons.save_alt_outlined),
          onPressed: () {
            products.add({
              'name': textControl.text,
            });
            textControl.clear();
          }
      ),
    ]);
  }
}

