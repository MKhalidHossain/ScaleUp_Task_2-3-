import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hive/hive.dart';
import '../model/product_model.dart'; 

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts(); // Load products when the controller is initialized
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      
      // First, check if there's cached data
      var box = await Hive.openBox<ProductModel>('products');
      if (box.isNotEmpty) {
        products.value = box.values.toList();
      }
      
      // Fetch products from API if not cached
      final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        var newProducts = data.map((json) => ProductModel.fromJson(json)).toList();
        
        // Save to Hive cache
        await box.clear(); // Clear previous data
        await box.addAll(newProducts); // Save new data
        
        products.value = newProducts;
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading(false);
    }
  }
}