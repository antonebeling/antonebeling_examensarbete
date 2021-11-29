import 'package:flutter/material.dart';
import 'package:examensarbete_app/items/ProductItem.dart';

class ProductPage extends StatefulWidget {
  final ProductItem item;
  ProductPage(this.item);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              appBar(context),
              hero(),
              purchase(),
              property(),
              desc(),
            ],
          ),

        ),
      ),
    );
  }

  //*********************APPBAR*************************************************
  Widget appBar(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      //width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                Text(
                  widget.item.ean.toString(),
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                Text(
                  widget.item.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F2F3E),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            color: Colors.black,
          )
        ],
      ),
    );
  }

  //**********************HERO**************************************************
  Widget hero() {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            widget.item.img,
          ),
        ],
      ),
    );
  }

  //*********************PURCHASE***********************************************
  Widget purchase() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(r"" + widget.item.price.toStringAsFixed(2) +"kr",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w100,
                color: Color(0xFF2F2F3E)
            ),
          )
        ],
      ),
    );
  }

  //*********************PROPERTY***********************************************
  Widget property() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Färger"),
              Row(
                children: <Widget>[
                  for (var i in widget.item.color) colorPicker(i),
                ],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text("Storlekar"),
              Text(
                widget.item.size.toUpperCase(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F2F3E)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget colorPicker(String color) {
    return Container(
      decoration: BoxDecoration(color: Color(int.parse(color)), shape: BoxShape.circle),
      width: 30,
      height: 30,
      margin: EdgeInsets.all(5),
    );
  }

  //*********************DESC***************************************************
  Widget desc() {
    return Container(
      child: Text(
        widget.item.spec,
        textAlign: TextAlign.left,
        style: TextStyle(height: 1.5, color: Color(0xFF6F8398), fontSize: 18),
      ),
      padding: EdgeInsets.all(16),
    );
  }
}
