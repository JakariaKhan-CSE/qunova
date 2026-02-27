// # filtering, searching logic
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:qunova/features/home/data/models/response_data_model.dart';
import 'package:qunova/features/home/data/repositories/home_reposiotry.dart';

class HomeProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  BackendResModel? _data;
  BackendResModel? get data => _data;
  // Filtering states
  String _selectCategoryId = 'all';
  String _searchQuery = "";

  // Debouncer Timer
  Timer? _debounce;

  Future<void> fetchData() async {
    _loading = true;
    notifyListeners();
    _data = await HomeReposiotry.fetchData();
    _loading = false;
    notifyListeners();
  }

  // getters
  List<Category> get categories => _data?.data?.categories ?? [];

  // Logic for filtered contacts
  List<Contact> get filteredContacts {
    List<Contact> allContacts = _data?.data?.contacts ?? [];
    return allContacts.where((contact) {
      bool matchesCategory =
          _selectCategoryId == 'all' || contact.categoryId == _selectCategoryId;
      bool matchesSearch =
          (contact.name!.toLowerCase().contains(_searchQuery.toLowerCase())) ||
          (contact.phone!.contains(_searchQuery));
      return matchesCategory && matchesSearch;
    }).toList();
  }

  // setter with debounce
  void setCategory(String categoryId) {
    _selectCategoryId = categoryId;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    // old timer cancel
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    // 500 mili = 0.5 s
    _debounce = Timer.periodic(Duration(milliseconds: 500), (timer) {
      _searchQuery = query;
      notifyListeners();
    });
  }

  // prevent memory leak
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  // contact, recent select
  int _index = 0;
  int get index => _index;
  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }
  // category index
  int _categoryIndex = 0;
  int get categoryIndex => _categoryIndex;
  void setCategoryIndex(int index) {
    _categoryIndex = index;
    notifyListeners();
  }
}
