class StationeryStore {
  final String name;
  final double rating;
  final String location;
  final List<Product> topSellingItems;
  final String imageUrl;

  StationeryStore({
    required this.name,
    required this.rating,
    required this.location,
    required this.topSellingItems,
    required this.imageUrl,
  });
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
// }
// class StationeryStore {
//   final String name;
//   final double rating;
//   final String location;
//   final List<Product> topSellingItems;
//   final String imageUrl;
//   final String email;
//   final String whatsappNumber;
//   final String priceListUrl; // URL for rates template (PDF/Image)

//   StationeryStore({
//     required this.name,
//     required this.rating,
//     required this.location,
//     required this.topSellingItems,
//     required this.imageUrl,
//     required this.email,
//     required this.whatsappNumber,
//     required this.priceListUrl,
//   });
// }
}
