import 'package:examensarbete_app/items/ProductItem.dart';

List artNr() {
  List<ProductItem> _list;
  _list = List();
  _list.add(new ProductItem(
      "HAWK T-SHIRT",
      "08-20955-05",
      "Hawk t-shirt har extremt bra fukttransport genom materialet Polartec® "
          "Powerdry Odour Resistant. Därför håller du dig torr närmast intill "
          "kroppen vilket ger en fräsch känsla trots hårt arbete.",
      "assets/img/hawk_tr_ja_099_ny_design.jpg",
      462.50,
      "xs-3xl",
      ["0xFF000000"]));

  _list.add(new ProductItem(
      "HAWK AMB PW T-SHIRT 2.0",
      "08-51801-05",
      "En rundhalsad t-shirt med mycket goda fukttransporterande egenskaper. "
          "Den har merinoull på insidan för komfort och fukttransport och "
          "polyester på utsidan för hållbarhet och färgäkthet.",
      "assets/img/hawk_amb_t-shirt_066_ny_design_3.jpg",
      593.75,
      "xs-3xl",
      ["0xFF00563F"]));

  _list.add(new ProductItem(
      "ARCTIC JACKET 4.0",
      "01-21828-05",
      "Vår varmaste jacka med fast varmfoder håller dig varm i riktigt tuffa "
          "vinterförhållanden då den har ett tydligt ursprung hos yrkesarbetare "
          "i arktiska miljöer.",
      "assets/img/arctic_jacka_3.0_099_med_reflexer_1.jpg",
      7743.75,
      "xs-3xl",
      ["0xFF000000"]));

  _list.add(new ProductItem(
      "HOLD BRACES",
      "20-30507-05",
      "Vårt unika hängslesystem med kardborrereglering för rätt längd.",
      "assets/img/h_ngslen_099.jpg",
      493.75,
      "xs-3xl",
      ["0xFF000000"]));

  _list.add(new ProductItem(
      "PILOT JACKET WOMEN",
      "01-24644-04",
      "Vind - och vattentät halvlång Gore-Texjacka framtagen för arbete ombord "
          "på båt med gul fluorescerande och justerbar huva med formbar skärm "
          "och säkerhetshandtag på axlarna. Jackan passar för exempelvis lotsar, "
          "båtsmän och till allmän sjötjänst. Kan kompletteras med Denver foder.",
      "assets/img/pilot_jacka_058_framifr_n_1.jpg",
      5870.00,
      "DC36-DC46",
      ["0xFF002649"]));

  _list.add(new ProductItem(
      "TUCSON JACKET 3.0",
      "01-21614-05",
      "Robust vind och vattentät jacka i parkasmodell. TWP är ett material som "
          "även ger god andningsförmåga. Jackan har många bra och funktionella "
          "fickor, corduraförstärkningar på utsatta ställen samt kan "
          "kompletteras med Denver foder för vinterbruk.",
      "assets/img/tucson_jacka_3.0_036_ny_design.jpg",
      3743.00,
      "XS-3XL",
      ["0xFFE8112D", "0xFF002649", "0xFF000000"]));

  return _list;
}

//https://github.com/Olunuga/tutorial-flutter-product-page/blob/master/lib/main.dart
