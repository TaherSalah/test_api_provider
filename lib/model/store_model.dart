class StoreApis {
  final int id;
  final String title;

final  num price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  StoreApis(
      {required this.id,
      required this.title,
      required   this.price,
      required this.description,
      required this.category,
      required this.image,
       this.rating});

  factory StoreApis.fromJson(Map<String, dynamic> json) {
    return StoreApis(
      id: json['id'],
      title: json['title'],
      price : json['price'] ,
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'],
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
