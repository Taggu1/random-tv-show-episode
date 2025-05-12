class Episode {
  final int id;
  final String name;
  final int season;
  final int number;
  final String airdate;
  final int runtime;
  final String url;
  final String? imageUrl;

  Episode({
    required this.imageUrl,
    required this.id,
    required this.name,
    required this.season,
    required this.number,
    required this.airdate,
    required this.runtime,
    required this.url,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      imageUrl:
          json["image"] != null ? json["image"]["original"] as String : null,
      id: json['id'] as int,
      name: json['name'] as String,
      season: json['season'] as int,
      number: json['number'] as int,
      airdate: json['airdate'] as String,
      runtime: json['runtime'] as int,
      url: json['url'] as String,
    );
  }
}
