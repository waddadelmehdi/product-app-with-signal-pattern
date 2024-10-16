
import 'dart:ffi';

import 'package:productapp/model/product.model.dart';
import 'package:signals/signals.dart';

class Store{
final products = signal<List<Product>>([
  Product(id: 1, name: "Computer", price: 3500, selected: false, url: ""),
  Product(id: 2, name: "Printer", price: 1500, selected: true, url: ""),
  Product(id: 3, name: "Smart Phone", price: 2500, selected: false, url: ""),
]);

  void select(Product product) {
    final prod =product.copyWith(selected: !product.selected);
    final prods = products.value.map((p)=>p==product?prod:p);
    products.value= [...prods];

  }

  void addRandomProduct() {

    final prod = Product(id: products.value.length,
        name: "name",
        price: 4877,
        selected: false,
        url: "");
    products.value=[...products.value,prod];
  }



}

final Store store = new Store();