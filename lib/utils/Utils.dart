class Utils {
  static double setAverageRating(List<int> ratings) {
    var avgRating = 0;
    for (int i = 0; i < ratings.length; i++) {
      avgRating = avgRating + ratings[i];
    }
    return double.parse((avgRating / ratings.length).toStringAsFixed(1));
  }

  static double setRating(List<String> ratings) {
    var avgRating = 0;
    for (int i = 0; i < ratings.length; i++) {
      avgRating = ratings[i].length >= 5 ? 5 : ratings[i].length;
    }
    return double.parse((avgRating / ratings.length).toStringAsFixed(1));
  }
}