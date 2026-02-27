// # filtering, searching logic
import 'package:flutter/cupertino.dart';
import 'package:qunova/features/home/data/models/response_data_model.dart';
import 'package:qunova/features/home/data/repositories/home_reposiotry.dart';

class HomeProvider extends ChangeNotifier{
  bool _loading = false;
  bool get loading =>_loading;
  BackendResModel? _data;
  BackendResModel? get data => _data;
  Future<void> fetchData()async{
    _loading = true;
    notifyListeners();
    _data = await HomeReposiotry.fetchData();
    _loading = false;
    notifyListeners();
  }

}