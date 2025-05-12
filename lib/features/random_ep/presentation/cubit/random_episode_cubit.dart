import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:random_office_ep/features/random_ep/data/random_episode_repository.dart';
import 'package:random_office_ep/features/random_ep/models/episode_model.dart';

import '../../../../core/errors/failures.dart';

part 'random_episode_state.dart';

class RandomEpisodeCubit extends Cubit<RandomEpisodeState> {
  final RandomEpisodeRepository randomEpisodeRepository;
  RandomEpisodeCubit(this.randomEpisodeRepository)
    : super(RandomEpisodeInitial());

  void fetchEpisodes() async {
    emit(RandomEpisodeLoading());

    // TODO: Make the show id given to the cubit
    final failureOrEpisodes = await randomEpisodeRepository.fetchEpisodes(
      showId: 526,
    );

    emit(_mapFailureOrEpisodesToRandomEpisodeState(failureOrEpisodes));
  }

  RandomEpisodeState _mapFailureOrEpisodesToRandomEpisodeState(
    Either<Failure, List<Episode>> failureOrEpisodes,
  ) {
    return failureOrEpisodes.fold(
      (failure) => RandomEpisodeError(message: failure.message),
      (episodes) {
        final rand =
            Random(); // create RNG :contentReference[oaicite:14]{index=14}
        final randomEpisode = episodes[rand.nextInt(episodes.length)];

        return RandomEpisodeLoaded(
          episodes: episodes,
          randomEpisode: randomEpisode,
        );
      },
    );
  }
}
