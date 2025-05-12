import 'package:dartz/dartz.dart';
import 'package:random_office_ep/features/random_ep/data/random_episode_remote_data_source.dart';
import 'package:random_office_ep/features/random_ep/models/episode_model.dart';

import '../../../core/errors/failures.dart';

abstract class RandomEpisodeRepository {
  Future<Either<Failure, List<Episode>>> fetchEpisodes({required int showId});
}

class RandomEpisodeRepositoryImpl implements RandomEpisodeRepository {
  final RandomEpisodeRemoteDataSource randomEpisodeRemoteDataSource;

  RandomEpisodeRepositoryImpl({required this.randomEpisodeRemoteDataSource});

  @override
  Future<Either<Failure, List<Episode>>> fetchEpisodes({
    required int showId,
  }) async {
    try {
      final resault = await randomEpisodeRemoteDataSource.fetchEpisodes(
        showId: showId,
      );

      return Right(resault);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
