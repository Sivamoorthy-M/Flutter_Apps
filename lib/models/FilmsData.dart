import 'dart:convert';

FilmsData filmsDataFromJson(String str) => FilmsData.fromJson(json.decode(str));
String filmsDataToJson(FilmsData data) => json.encode(data.toJson());

class FilmsData {
  FilmsData({this.films});

  List<Films>? films;

  factory FilmsData.fromJson(List<dynamic> json) => FilmsData(
    films: List<Films>.from(json.map((x) => Films.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "films": films == null ? null : List<dynamic>.from(films!.map((x) => x.toJson())),
  };
}

class Films {
  Films({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalTitleRomanised,
    required this.image,
    required this.movieBanner,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.runningTime,
    required this.rtScore,
    required this.people,
    required this.species,
    required this.locations,
    required this.vehicles,
    required this.url,
  });
  late final String id;
  late final String title;
  late final String originalTitle;
  late final String originalTitleRomanised;
  late final String image;
  late final String movieBanner;
  late final String description;
  late final String director;
  late final String producer;
  late final String releaseDate;
  late final String runningTime;
  late final String rtScore;
  late final List<String> people;
  late final List<String> species;
  late final List<String> locations;
  late final List<String> vehicles;
  late final String url;

  Films.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    originalTitle = json['original_title'];
    originalTitleRomanised = json['original_title_romanised'];
    image = json['image'];
    movieBanner = json['movie_banner'];
    description = json['description'];
    director = json['director'];
    producer = json['producer'];
    releaseDate = json['release_date'];
    runningTime = json['running_time'];
    rtScore = json['rt_score'];
    people = List.castFrom<dynamic, String>(json['people']);
    species = List.castFrom<dynamic, String>(json['species']);
    locations = List.castFrom<dynamic, String>(json['locations']);
    vehicles = List.castFrom<dynamic, String>(json['vehicles']);
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['original_title'] = originalTitle;
    _data['original_title_romanised'] = originalTitleRomanised;
    _data['image'] = image;
    _data['movie_banner'] = movieBanner;
    _data['description'] = description;
    _data['director'] = director;
    _data['producer'] = producer;
    _data['release_date'] = releaseDate;
    _data['running_time'] = runningTime;
    _data['rt_score'] = rtScore;
    _data['people'] = people;
    _data['species'] = species;
    _data['locations'] = locations;
    _data['vehicles'] = vehicles;
    _data['url'] = url;
    return _data;
  }
}
