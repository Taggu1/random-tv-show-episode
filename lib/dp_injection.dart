import 'package:get_it/get_it.dart';
import 'package:random_office_ep/features/random_ep/data/random_episode_remote_data_source.dart';
import 'package:random_office_ep/features/random_ep/data/random_episode_repository.dart';
import 'package:random_office_ep/features/random_ep/presentation/cubit/random_episode_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initRandomEpisode();
}

void initRandomEpisode() {
  sl.registerFactory(() => RandomEpisodeCubit(sl()));

  sl.registerLazySingleton<RandomEpisodeRepository>(
    () => RandomEpisodeRepositoryImpl(randomEpisodeRemoteDataSource: sl()),
  );

  sl.registerLazySingleton<RandomEpisodeRemoteDataSource>(
    () => RandomEpisodeRemoteDataSourceImpl(),
  );
}
