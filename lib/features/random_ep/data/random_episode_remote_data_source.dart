import 'package:http/http.dart' as http;
import 'package:random_office_ep/features/random_ep/models/episode_model.dart';
import 'dart:convert';

abstract class RandomEpisodeRemoteDataSource {
  Future<List<Episode>> fetchEpisodes({required int showId});
}

class RandomEpisodeRemoteDataSourceImpl extends RandomEpisodeRemoteDataSource {
  @override
  Future<List<Episode>> fetchEpisodes({required int showId}) async {
    final uri = Uri.parse('https://api.tvmaze.com/shows/$showId/episodes');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load episodes: HTTP ${response.statusCode}');
    }

    final List<dynamic> data = json.decode(response.body) as List<dynamic>;
    return data
        .map((e) => Episode.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
