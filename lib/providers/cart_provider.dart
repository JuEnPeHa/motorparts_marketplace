import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/models/item.dart';

class CartProvider extends ChangeNotifier {
  final List<ItemInCart> _items = [
    ItemInCart(
        id: "ndc8sn",
        name: "Un artículo de prueba",
        image:
            "https://d3nv2arudvw7ln.cloudfront.net/images/global/950/163/AngelScooter_Technology.png",
        price: 229.99,
        quantity: 2,
        index: 0),
    ItemInCart(
        id: "ndc8dsn",
        name: "Otro artículo de prueba",
        image:
            "https://d3nv2arudvw7ln.cloudfront.net/images/global/777/715/diablo-superbike-technology-4505479678967.png",
        price: 932.99,
        quantity: 3,
        index: 1),
    ItemInCart(
        id: "ndccds8sn",
        name: "Uno más artículo de prueba",
        image:
            "https://d3nv2arudvw7ln.cloudfront.net/images/global/286/610/ScorpionProFIM-Technology-4505481618821.png",
        price: 273.99,
        quantity: 1,
        index: 2),
    ItemInCart(
        id: "ndc8erwsn",
        name: "Un artículo de prueba",
        image:
            "https://d3nv2arudvw7ln.cloudfront.net/images/global/950/163/AngelScooter_Technology.png",
        price: 229.99,
        quantity: 2,
        index: 3),
    ItemInCart(
        id: "ndc8srn",
        name: "Otro artículo de prueba",
        image:
            "https://d3nv2arudvw7ln.cloudfront.net/images/global/777/715/diablo-superbike-technology-4505479678967.png",
        price: 932.99,
        quantity: 3,
        index: 4),
    ItemInCart(
        id: "ndhjc8sn",
        name: "Uno más artículo de prueba",
        image:
            "https://d3nv2arudvw7ln.cloudfront.net/images/global/286/610/ScorpionProFIM-Technology-4505481618821.png",
        price: 273.99,
        quantity: 1,
        index: 5),
    ItemInCart(
        id: "ndcn8sn",
        name: "Un artículo de prueba",
        image:
            "https://d3nv2arudvw7ln.cloudfront.net/images/global/950/163/AngelScooter_Technology.png",
        price: 229.99,
        quantity: 2,
        index: 6),
    ItemInCart(
        id: "ndcbnb8sn",
        name: "Otro artículo de prueba",
        image:
            "https://d3nv2arudvw7ln.cloudfront.net/images/global/777/715/diablo-superbike-technology-4505479678967.png",
        price: 932.99,
        quantity: 3,
        index: 7),
    ItemInCart(
        id: "ndcvbbg8sn",
        name: "Uno más artículo de prueba",
        image:
            "https://d3nv2arudvw7ln.cloudfront.net/images/global/286/610/ScorpionProFIM-Technology-4505481618821.png",
        price: 273.99,
        quantity: 1,
        index: 8),
  ];

  //List<ItemInCart> get items => [..._items];
  UnmodifiableListView<ItemInCart> get items => UnmodifiableListView(_items);

  double get totalPrice => _totalPrice();

  double _totalPrice() {
    double total = 0;
    _items.forEach((ItemInCart item) => {total += item.price * item.quantity});
    return total;
  }

  bool checkIfItemExists(ItemInCart item) {
    return _items.any((itemInCart) => itemInCart.id == item.id);
  }

  void addItem(ItemInCart item) {
    if (checkIfItemExists(item)) {
      incrementQuantity(item);
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void incrementQuantity(ItemInCart item) {
    _items.forEach((itemInCart) {
      if (itemInCart.id == item.id) {
        itemInCart.quantity++;
      }
    });
    notifyListeners();
  }

  void removeItem(ItemInCart item) {
    _items.removeWhere((itemInCart) => itemInCart.id == item.id);
    notifyListeners();
  }

  void removeSingleQuantity(ItemInCart item) {
    bool shouldRemove = false;
    _items.forEach((itemInCart) {
      if (itemInCart.id == item.id) {
        itemInCart.quantity--;
        if (itemInCart.quantity == 0) {
          shouldRemove = true;
        }
      }
    });
    if (shouldRemove) {
      removeItem(item);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // bool checkIfItemExistsById(String id) {
  //   bool isExists = false;
  //   _items.forEach((itemInCart) {
  //     if (itemInCart.id == id) {
  //       isExists = true;
  //     }
  //   });
  //   return isExists;
  // }

  int _cartCount = 0;
  int get cartCount => _cartCount;

  void addToCart() {
    _cartCount++;
    notifyListeners();
  }

  void removeFromCart() {
    _cartCount--;
    notifyListeners();
  }
}
