import 'package:examensarbete_app/items/ProductItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:examensarbete_app/items/ChildItem.dart';
import 'package:examensarbete_app/items/ArtNr.dart';

class FilterSearch extends StatefulWidget {
  @override
  _FilterSearchState createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch>{
  TextEditingController _controller = new TextEditingController();
  String errorResult = "";
  List<ProductItem> _list;

  @override
  void initState() {
    super.initState();
    _list = artNr();
  }

  void searchOperation(String searchText) {
    //if ((searchText.length > 0) && _list.contains(searchText)) {
    setState(() {
      _buildFilterSearchList();
      /*if (searchText == '7350058335245') {
          errorResult = "celcius";
        } else if (searchText == '1234567890') {
          errorResult = "pajas";
        } else
          errorResult = "hejsan på dig";*/
    });
    //}
  }

  List<ChildItem> _buildFilterSearchList() {
    if (_controller.text.isEmpty) {
      return List();
    } else {
      List<ProductItem> _searchList = List();

      for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i).name;
        String ean = _list.elementAt(i).ean;
        String spec = _list.elementAt(i).spec;
        String img = _list.elementAt(i).img;
        double price = _list.elementAt(i).price;
        String size = _list.elementAt(i).size;
        var color = _list.elementAt(i).color;

        if (name.toLowerCase().contains(_controller.text.toLowerCase()) ||
            spec.toLowerCase().contains(_controller.text.toLowerCase())) {
          _searchList.add(new ProductItem(name, ean, spec, img, price, size, color));
        }
      }
      return _searchList.map((contact) => new ChildItem(contact)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filtersökning".toUpperCase(),
              style: TextStyle(fontSize: 25)),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SizedBox(
                      width: 340,
                      child: TextFormField(
                        controller: _controller,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          labelText: "Söktext",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onChanged: searchOperation,
                      ),
                    ),
                  ),
                ],
              ),
              new Expanded(
                  child: ListView(
                    children: _buildFilterSearchList(),
                  ))
            ],
          ),
        ));
  }
}
