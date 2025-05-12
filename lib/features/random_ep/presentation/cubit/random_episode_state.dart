part of 'random_episode_cubit.dart';

sealed class RandomEpisodeState extends Equatable {
  const RandomEpisodeState();

  @override
  List<Object> get props => [];
}

final class RandomEpisodeInitial extends RandomEpisodeState {}

final class RandomEpisodeLoading extends RandomEpisodeState {}

final class RandomEpisodeLoaded extends RandomEpisodeState {
  final List<Episode> episodes;
  final Episode randomEpisode;

  const RandomEpisodeLoaded({
    required this.episodes,
    required this.randomEpisode,
  });

  @override
  List<Object> get props => [episodes, randomEpisode];
}

final class RandomEpisodeError extends RandomEpisodeState {
  final String message;

  const RandomEpisodeError({required this.message});

  @override
  List<Object> get props => [message];
}
