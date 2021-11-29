import 'package:examensarbete_app/items/ProductItem.dart';
import 'package:examensarbete_app/ProductPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChildItem extends StatelessWidget {
  final ProductItem item;
  ChildItem(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(item))),

        child: Padding(
          padding: const EdgeInsets.only(bottom: 4.0, left: 4.0, right: 4.0),
          child: new Card(
            elevation: 3,
            child: Column(children: <Widget>[
              ListTile(
                title: Text(item.name),
                subtitle: new Text(item.ean.toString()),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Image.asset(
                    item.img,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(r"" + item.price.toStringAsFixed(2) +"kr",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                          color: Color(0xFF2F2F3E)
                      ),
                    )
                ),
              ),

            ]),
          ),
        ));
  }
}