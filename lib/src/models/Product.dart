class Product {
  final String id;
  final String name;
  final List images;
  final String description;
  final double rating;
  final double price;
  final int countInStock;
  final List reviews;
  final int numReviews;
  final List colors;
  int total;
  Product({
    this.id,
    this.name,
    this.images,
    this.description,
    this.rating,
    this.price,
    this.countInStock,
    this.reviews,
    this.numReviews,
    this.colors,
    this.total,
  });
}
