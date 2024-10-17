
import 'dart:ffi';

import 'package:productapp/model/product.model.dart';
import 'package:signals/signals.dart';

class Store{
final products = signal<List<Product>>([
  Product(id: 1, name: "Smart Watch", price: 3500, selected: false, url: "https://m.media-amazon.com/images/I/71c2RRGLIGL._AC_UY218_.jpg"),
  Product(id: 2, name: "Printer", price: 1500, selected: true, url: "https://m.media-amazon.com/images/I/71bB0ZWpE2L._AC_UY218_.jpg"),
  Product(id: 3, name: "Smart Phone", price: 2500, selected: false, url: "https://m.media-amazon.com/images/I/41vU1u8DZXL._AC_UY218_.jpg"),
]);

final totalPrices = computed(()=>store.products.value.where((p)=>p.selected)
    .map((p)=>p.price)
    .reduce((sum,p)=>sum + p)
);
final selectedProducts = computed(()=>store.products.value.where((p)=>p.selected).length);

  void select(Product product) {
    final prod =product.copyWith(selected: !product.selected);
    final prods = products.value.map((p)=>p==product?prod:p);
    products.value= [...prods];

  }

  void addRandomProduct() {

    final prod = Product(id: products.value.length,
        name: "Smart Phone",
        price: 4877,
        selected: false,
        url: "https://m.media-amazon.com/images/I/41vU1u8DZXL._AC_UY218_.jpg");
    products.value=[...products.value,prod];
  }



}

final Store store = new Store();