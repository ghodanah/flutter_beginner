import 'package:flutter/foundation.dart';
import 'package:untitled/23_12_29/mask/repository/store_repository.dart';

import '../model/store.dart';

class StoreModel with ChangeNotifier {
  List<Store> stores = [];
  var isLoading = false;

  final _storeRepository = StoreRepository();

  StoreModel() {
    fetch();
  }

  Future fetch() async {
    isLoading = true;
    notifyListeners();

    stores = await _storeRepository.fetch();
    isLoading = false;
    notifyListeners();
  }
}