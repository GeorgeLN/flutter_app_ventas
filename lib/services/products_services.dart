import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:seguridad_clientes_app/models/models.dart';

class ProductsServices extends ChangeNotifier {
  final String _baseURL = 'flutter-varios-1d42c-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  ProductsServices() {
    loadProducts();
  }

  //TODO: <List<Product>>
  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'products.json');
    final response = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(response.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    
    isLoading = false;
    notifyListeners();

    return products;
  }


  Future saveOrCreateProduct( Product product ) async {
    isSaving = true;
    notifyListeners();

    if ( product.id == null) {
      await createProduct(product);
    }
    else {
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct( Product product ) async {
    //[PUT] para actualizar.
    //Actualizar la lista de productos.
    final index = products.indexWhere( (element) => element.id == product.id );
    products[index] = product;

    return product.id!;
  }

  Future<String> createProduct( Product product ) async {
    final url = Uri.https(_baseURL, 'products.json');
    final response = await http.post( url, body: product.toJson() ); //[POST] para agregar.
    final decodeData = json.decode( response.body );

    //Agregar a la lista de productos.
    product.id = decodeData['name'];

    products.add(product);

    return product.id!;
  }

  void updateSelectedProductImage( String path ) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri( Uri(path: path ) );

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if ( newPictureFile == null ) {
      return null;
      //Returna null porque si llama el uploadImage sin tener nada seleccionado, genera un error.
    }
    
    isSaving = true;
    notifyListeners();

    final url = Uri.parse('https://api.cloudinary.com/v1_1/du26naka7/image/upload?upload_preset=f5p5cmhj');

    final imageUploadRequest = http.MultipartRequest( 'POST', url );

    final file = await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();

    final response = await http.Response.fromStream(streamResponse);

    if ( response.statusCode != 200 && response.statusCode != 201 ) {
      //print( 'Algo salió mal' );
      //print( response.body );
    }

    newPictureFile = null;

    final decodeData = json.decode(response.body);

    return decodeData['secure_url'];
  }
}