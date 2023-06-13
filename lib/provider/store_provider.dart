import 'package:api_with_provider/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/store_service.dart';

class StoreProvider extends ChangeNotifier {
  final StoreAPiService service = StoreAPiService();

  List<StoreApis> _store = [];
  List<StoreApis> get store => _store;
  bool isLoading = false;

  Future<void> getAllProducts() async {
    isLoading = true;
    notifyListeners();
    final responProv = service.getAllProducts();
    _store = await responProv;
    isLoading = false;
    notifyListeners();
  }
}
