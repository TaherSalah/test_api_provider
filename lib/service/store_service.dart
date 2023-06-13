import 'dart:convert';

import 'package:api_with_provider/model/store_model.dart';
import 'package:http/http.dart' as http;

class StoreAPiService {
 Future <List<StoreApis>> getAllProducts() async {
    String url = 'https://fakestoreapi.com/products';
    final uri = Uri.parse(url);
    final responce = await http.get(uri);
    if(responce.statusCode ==200){
      final responceData=jsonDecode(responce.body) as List;
      final jsonData=responceData.map((json) {
        return StoreApis(
            id: json['id'],
            title: json['title'],
            price: json['price'],
            description: json['description'],
            category: json['category'],
            image: json['image'],
          // rating: json['rating']
        );
      }).toList();
      return jsonData;
    }else{
      return [];
    }

  }
}
