import 'package:flutter/widgets.dart';

class MProduct {
  String id;
  String title;
  String quantity;
  String description;
  double price;
  String image;
  bool liked = false;
  int pieces = 0;

  MProduct(
      {this.title,
      this.id,
      this.quantity,
      this.price,
      this.image,
      this.description = ""});

  void likeUnlike() {
    liked = !liked;
  }
}

class CProduct with ChangeNotifier {
  List<MProduct> products = [
    MProduct(
      id: "bl",
      title: "Black label",
      image: "blckl.jpg",
      price: 5000,
      quantity: "750 ml",
    ),
    MProduct(
      id: "gr",
      title: "Grants",
      image: "grants.jpg",
      price: 1600,
      quantity: "750 ml",
    ),
    MProduct(
      id: "jd",
      title: "Jack Daniels",
      image: "jackd.png",
      price: 3100,
      quantity: "750 ml",
    ),
    MProduct(
      id: "jm",
      title: "Jameson",
      image: "jameson.jpg",
      price: 2500,
      quantity: "750 ml",
    ),
    MProduct(
      id: "jb",
      title: "J & B",
      image: "jb.jpg",
      price: 3500,
      quantity: "750 ml",
    ),
    MProduct(
      id: "pd",
      title: "Paddy's",
      image: "paddys.jpg",
      price: 3600,
      quantity: "750 ml",
    ),
  ];

  List<MProduct> _cart = [];

  double get total {
    double t = 0;
    _cart.forEach((p) => t += (p.price * p.pieces));
    return t;
  }

  List<MProduct> get cart {
    _cart.sort((a, b) => a.title.compareTo(b.title));
    return _cart;
  }

  void addToCart(MProduct product) {
    product.pieces++;
    if (!_cart.contains(product)) {
      _cart.add(product);
    }

    print(product.pieces);
    _cart.remove(product);
    _cart.add(product);

    notifyListeners();
  }

  void removeItem(MProduct product) {
    product.pieces--;
    if (product.pieces < 1) {
      _cart.remove(product);
    }
    notifyListeners();
  }

  void likeUnlike(String id) {
    products = products.map((MProduct product) {
      if (product.id == id) {
        product.liked = !product.liked;
      }
      return product;
    }).toList();
    notifyListeners();
  }

  void clearCart() {
    _cart.forEach((product) => product.pieces = 0);
    _cart = [];
    notifyListeners();
  }
}
