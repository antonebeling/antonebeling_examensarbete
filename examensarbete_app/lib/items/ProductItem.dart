

class ProductItem {
  String name;
  String ean;
  String spec;
  String img;
  double price;
  String size;
  var color;


  ProductItem(name, ean, spec, img, price, size, color){
    this.name = name;
    this.ean = ean;
    this.spec = spec;
    this.img = img;
    this.price = price;
    this.size = size;
    this.color = color;
  }
}
