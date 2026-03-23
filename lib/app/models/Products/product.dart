class Product {
  final int id;
  final String nom;
  final double prix;
  final int categoryId; // 🔥 IMPORTANT

  Product({
    required this.id,
    required this.nom,
    required this.prix,
    required this.categoryId,
  });
}