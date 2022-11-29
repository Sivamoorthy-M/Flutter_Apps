
import 'package:flutter/material.dart';
import 'package:localpath/data/remote/response/ApiResponse.dart';
import 'package:localpath/models/FilmsData.dart';
import 'package:localpath/repository/Films/FilmsRepoImp.dart';

class FilmsListVM extends ChangeNotifier {
  final _myRepo = FilmsRepoImp();

  ApiResponse<FilmsData> filmData = ApiResponse.loading();

  void _setFilmsData(ApiResponse<FilmsData> response) {
    print("$response");
    filmData = response;
    notifyListeners();
  }

  Future<void> fetchFilms() async {
    _setFilmsData(ApiResponse.loading());
    _myRepo
      .getFilmsList()
      .then((value) => _setFilmsData(ApiResponse.completed(value)))
      .onError((error, stackTrace) => ApiResponse.error(error.toString()));
  }
}