class API {
  final String baseUrl;
  final String apiKey;
  final String endPoint;

  API({
    required this.baseUrl,
    required this.apiKey,
    required this.endPoint,
  });

  String URL({Map<String, dynamic>? queries}) {
    String url = "$baseUrl$endPoint?access_key=$apiKey";

    if (queries != null) {
      queries.forEach((key, value) {
        url += "&$key=$value";
      });
    }
    return url;
  }
}
