// import 'package:dio/dio.dart';
import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_shope/core/constants/api_paths.dart';
import 'package:new_shope/core/error/exceptions.dart';
import 'package:new_shope/data/data_sources/local/sharedpreferences/user__local_repo.dart';
import 'package:new_shope/data/models/category/category_model.dart';
import 'package:new_shope/data/models/product/product_model.dart';
import 'package:new_shope/data/models/user/user_model.dart';

class MainApi {
  static Future<void> register(UserModel user) async {
    // debugPrint(user.toString());
    var url = Uri(
      scheme: 'https',
      host: ApiPaths.baseUrl,
      path: ApiPaths.registerPath,
    );
    http.Response response = await http.post(url, body: user.toMap());
    if (response.statusCode == 201) {
      // debugPrint(response.body);
      // Emit Something
    } else {
      // debugPrint(response.statusCode.toString());
      String? message;
      if (response.body.contains('message')) {
        var bodyAsMap = response.body as Map;
        message = bodyAsMap['message'].toString();
      }
      throw ApiExeption(message ?? response.body);
    }
  }

  static Future<void> login(String userName, String password) async {
    var url = Uri(
      scheme: 'https',
      host: ApiPaths.baseUrl,
      path: ApiPaths.loginPath,
    );
    http.Response response = await http.post(url, body: {
      "username": userName,
      "password": password,
      "expiresInMins": '43200'
    });
    // debugPrint(response.body);
    if (response.statusCode == 200) {
      // Emit Something
      UserModel user = UserModel.fromMap(jsonDecode(response.body));
      UserRepo.setUserData(user);
    } else {
      var bodyAsMap = jsonDecode(response.body);
      String message = bodyAsMap['message'];
      throw ApiExeption(message);
    }
  }

  static Future<List<ProductModel>> getProducts(int limit, int skip) async {
    var url = Uri(
        scheme: 'https',
        host: ApiPaths.baseUrl,
        path: ApiPaths.productsPath,
        queryParameters: {'limit': '$limit', 'skip': '$skip'});
    http.Response response = await http.get(url);

    var jsonResBody = jsonDecode(response.body)["products"];
    var productsList = List<ProductModel>.from(
        jsonResBody.map((product) => ProductModel.fromMap(product)));
    return productsList;
  }

  static Future<List<CategoryModel>> getcategories() async {
    var url = Uri(
        scheme: 'https', host: ApiPaths.baseUrl, path: ApiPaths.categoriesPath);
    http.Response response = await http.get(url);
    // var jsonResBody = jsonDecode(response.body)["products"];
    var categoryList = List.from(jsonDecode(response.body) as List)
        .map((item) => CategoryModel.fromMap(item))
        .toList();
    // debugPrint(categoryList.toString());
    return categoryList;
  }

  static Future<List<ProductModel>> getProductsByCategory(
      CategoryModel category, int limit, int skip) async {
    var url = Uri(
        scheme: 'https',
        host: ApiPaths.baseUrl,
        path: '${ApiPaths.productsByCategoryPath}/${category.slug}',
        queryParameters: {'limit': '$limit', 'skip': '$skip'});
    http.Response response = await http.get(url);
    debugPrint(response.body);
    var jsonResBody = jsonDecode(response.body)["products"];
    var productsList = List<ProductModel>.from(
        jsonResBody.map((product) => ProductModel.fromMap(product)));
    return productsList;
  }
}
