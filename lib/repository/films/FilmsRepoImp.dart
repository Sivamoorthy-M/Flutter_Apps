import 'package:localpath/data/remote/network/BaseApiService.dart';
import 'package:localpath/data/remote/network/NetworkApiService.dart';
import 'package:localpath/models/FilmsData.dart';
import 'package:localpath/repository/films/FilmRepo.dart';
import 'package:localpath/data/remote/network/ApiEndPoints.dart';

class FilmsRepoImp implements FilmRepo{

  BaseApiService _apiService = NetworkApiService();

  @override
  Future<FilmsData?> getFilmsList() async {
    try {
      dynamic response = await _apiService.getResponse(ApiEndPoints().getFilms);
      print("Response - $response");
      final jsonData = FilmsData.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
      print("Error - $e}");
    }
  }
}
