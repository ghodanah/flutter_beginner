import 'package:flutter/foundation.dart';
import 'package:untitled/23_12_29/mask/repository/store_repository.dart';

import '../model/store.dart';

class StoreModel with ChangeNotifier {
  List<Store> stores = [];
  final _storeRepository = StoreRepository();

  StoreModel() {
    fetch();
  }

  Future fetch() async {
    stores = await _storeRepository.fetch();
    notifyListeners();
  }
}