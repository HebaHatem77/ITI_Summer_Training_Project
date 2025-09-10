import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import '../models/products_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/content_model.dart';

class ApiProvider {
  late Products productsFromApi;
  static const String baseUrl = "https://dummyjson.com";

  Future getProductsFromApi() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userToken = prefs.getString("userAccessToken") ?? "";

    try {
      Response response = await Dio().get(
        "$baseUrl/products#products-category",
        queryParameters: {
          "select": "id,title,description,category,price,thumbnail",
        },
        options: Options(headers: {"Authorization": "Barer $userToken"}),
      );

      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");

      productsFromApi = Products.fromJson(response.data);

      print(
        "Products fetched successfully: ${productsFromApi.products.length} items",
      );

      print(productsFromApi.products[0].price);

      return productsFromApi;
    } catch (e) {
      print("Error fetching products: $e");
      return null;
    }
  }

  Future userLogin({
    required String userName,
    required String userPassword,
  }) async {
    FormData userData = FormData.fromMap({
      "username": userName,
      "password": userPassword,
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Response response = await Dio().post(
        "$baseUrl/auth/login",
        data: userData,
      );
      print("Response ${response.statusCode}");
      print("Response ${response.data}");
      if (response.statusCode == 200) {
        print("User logged in successfully");
        print("User token: ${response.data['accessToken']}");
        await prefs.setString("userAccessToken", response.data['accessToken']);
        final String userToken = prefs.getString("userAccessToken") ?? "";
        print("Stored user token: $userToken");
        return response.data;
      } else {
        print("Login failed");
        return Future.error("Login failed");
      }
    } catch (e) {
      print("Error during user login: $e");
      if (e is DioException) {
        if (e.response != null) {
          print("Dio error message response: ${e.response?.data}");
          return Future.error(e.response?.data ?? "Unknown error");
        } else {
          print("Dio error: ${e.message}");
        }
      }
    }
  }

  late ContentModel contentModelFromFirebase;

  Future<ContentModel> getUserDataFromFirebase() async {
    await FirebaseFirestore.instance.collection("content").doc("1").get().then((
      value,
    ) {
      print(value.data());
      contentModelFromFirebase = ContentModel.fromJson(value.data()!);
      print(contentModelFromFirebase.title);
      print(contentModelFromFirebase.description);
    });
    return contentModelFromFirebase;
  }
}
