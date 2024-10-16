class Product{
  final int id;
  final String name;
  final double price;
  final bool selected;
  final String url;

  Product({required this.id,
      required this.name,
      required this.price,
      required this.selected,
      required this.url
    });

  Product copyWith({selected,name,price,url}){
    return Product(
        id: id,
        name: name??this.name,
        price: price??this.price,
        selected: selected??this.selected,
        url: url??this.url,
    );
  }
}