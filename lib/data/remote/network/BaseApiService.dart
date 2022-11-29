abstract class BaseApiService {

  final String baseUrl = "https://ghibliapi.herokuapp.com/";

  Future<dynamic> getResponse(String url);
}