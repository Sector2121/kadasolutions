class Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final int stock;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
    required this.thumbnail,
    required this.images,
  });
}
