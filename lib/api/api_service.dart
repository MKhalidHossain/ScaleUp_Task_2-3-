import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:task2/model/product_model.dart';


class ApiService {
  final Box<ProductModel> productBox = Hive.box<ProductModel>('products');

  Future<void> fetchProducts() async {
    const String apiUrl = 'https://fakestoreapi.com/products';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<ProductModel> products = (jsonDecode(response.body) as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();

        // Store data in Hive
        await productBox.clear();
        for (var product in products) {
          productBox.put(product.id, product);
        }
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  List<ProductModel> getOfflineProducts() {
    return productBox.values.toList();
  }
}