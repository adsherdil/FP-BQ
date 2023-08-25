// ignore_for_file: camel_case_types

class products {
  final int id;
  final String image;
  final String name;
  final String category;
  final String description;
  final int quantity;
  final int price;

  products({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.image,
    required this.quantity,
    required this.price,
  });
}
