class Canteen {
  final String name;
  final double rating;
  final String type;
  final String time;
  final String items;
  final String note;
  final double lat;
  final double lng;
  final String imageUrl; // 🔹 New Field for Image URL

  Canteen({
    required this.name,
    required this.rating,
    required this.type,
    required this.time,
    required this.items,
    required this.note,
    required this.lat,
    required this.lng,
    required this.imageUrl, // 🔹 Initialize Image URL
  });
}
