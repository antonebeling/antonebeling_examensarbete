import 'package:examensarbete_app/items/ProductItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:examensarbete_app/items/ChildItem.dart';
import 'package:examensarbete_app/items/ArtNr.dart';

class ArtSearch extends StatefulWidget {
  @override
  _ArtSearchState createState() => _ArtSearchState();
}

class _ArtSearchState extends State<ArtSearch> {
  TextEditingController _controller = new TextEditingController();
  String errorResult = "";
  List<ProductItem> _list;

  @override
  void initState() {
    super.initState();
    _list = artNr();
  }

  //Barcode scanners implemented
  Future _scanEAN() async {
    try {
      String eanResult = await BarcodeScanner.scan();
      setState(() {
        _controller.text = eanResult;
        errorResult = "";
        searchOperation(_controller.text);
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          errorResult = "Kamera använing nekades";
        });
      } else {
        setState(() {
          errorResult = "Okänt fel $e";
        });
      }
    } on FormatException {
      setState(() {
        errorResult = "Inget scannat";
      });
    } catch (e) {
      setState(() {
        errorResult = "Okänt fel $e";
      });
    }
  }

  //Changes the state of ErrorResult depending on what is searched on
  void searchOperation(String searchText) {
    //if ((searchText.length > 0) && _list.contains(searchText)) {
    setState(() {
      _buildArtnrSearchList();
      /*if (searchText == '7350058335245') {
          errorResult = "celcius";
        } else if (searchText == '1234567890') {
          errorResult = "pajas";
        } else
          errorResult = "hejsan på dig";*/
    });
    //}
  }

  List<ChildItem> _buildArtnrSearchList() {
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


        if (ean.contains(_controller.text)) {
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
          title: Text("Artikelsökning".toUpperCase(),
              style: TextStyle(fontSize: 25)),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Row with code for the search bar, and barcode scanner
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SizedBox(
                      width: 340,
                      child: TextFormField(
                        controller: _controller,
                        keyboardType:
                        TextInputType.numberWithOptions(signed: true),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          labelText: "Artikelnummer",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            padding: EdgeInsets.only(right: 20),
                            icon: new Image.asset(
                              "assets/img/BarcodeIcon.png",
                            ),
                            onPressed: _scanEAN,
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
                    children: _buildArtnrSearchList(),
                  ))
            ],
          ),
        ));
  }
}

//https://www.youtube.com/watch?v=siuJhQ9BqsU                                 Barcode Scanner

//https://www.youtube.com/watch?v=CSa6Ocyog4U                                 Travel UI

//https://medium.com/@dltlabs/how-to-build-a-flutter-card-list-in-less-than-10-minutes-9839f79a6c08   Cards list

//https://medium.com/@mayowaolunuga1/product-page-in-flutter-f9ca9e19896c     Product Page
