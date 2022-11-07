import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GRIDHOME extends StatelessWidget {
  final Function screenChange;

  GRIDHOME(this.screenChange);


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.only(left: 250, top:50, right:250, bottom: 50),
      crossAxisSpacing: 50,
      mainAxisSpacing: 50,
      crossAxisCount: 2,
      children: <Widget>[
        Column (children: [
          Container(height: 200,width: 200,
            child: GestureDetector(onTap: () => screenChange,
              child: Card(
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Japanese_Road_sign_%28Parking_lot_A%2C_Parking_permitted%29.svg/675px-Japanese_Road_sign_%28Parking_lot_A%2C_Parking_permitted%29.svg.png', fit: BoxFit.fill,),
              ),
            ),
          ),Text("Parking Slots"),]),


        Column (children: [
          Container(height: 200,width: 200,
            child: GestureDetector(onTap: () => print("Tapped 2"),
              child: Card(
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Tomboy_logo.svg/1200px-Tomboy_logo.svg.png', fit: BoxFit.fill,),
              ),
            ),
          ),Text("Notes"),/*APIWidget(),*/]),

        Column(children: [
          Container(height: 200,width: 200,
            child: GestureDetector(onTap: () => print("Tapped 3"),
              child: Card(
                child: Image.network(
                  'data:image/png;base64,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', fit: BoxFit.fill,),
              ),
            ),
          ),Text("Games"),]),

      ],
    );
  }
}

