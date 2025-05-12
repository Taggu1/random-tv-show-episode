import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_office_ep/core/theme/app_palette.dart';
import 'package:random_office_ep/features/random_ep/presentation/cubit/random_episode_cubit.dart';
import 'package:random_office_ep/features/random_ep/presentation/widgets/loading_indecator.dart';
import 'package:random_office_ep/features/random_ep/presentation/widgets/random_episdoe_initail_widget.dart';
import 'package:random_office_ep/features/random_ep/presentation/widgets/random_episdoes_loaded_widget.dart';

class RandomEpisodeWidget extends StatelessWidget {
  const RandomEpisodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        width: 600,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppPalette.surface,
          borderRadius: BorderRadius.circular(22),
        ),
        child: BlocBuilder<RandomEpisodeCubit, RandomEpisodeState>(
          builder: (context, state) {
            switch (state) {
              case RandomEpisodeInitial _:
                return RandomEpisdoeInitailWidget();
              case RandomEpisodeLoaded loadedState:
                return RandomEpisdoeLoadedWidget(
                  episode: loadedState.randomEpisode,
                );
              case RandomEpisodeError errorState:
                print(errorState.message);
                return Placeholder();
              case RandomEpisodeLoading _:
                return LoadingIndecator();
            }
          },
        ),
      ),
    );
  }
}
