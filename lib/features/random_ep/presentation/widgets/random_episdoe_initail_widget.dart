import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:random_office_ep/core/theme/app_palette.dart';
import 'package:random_office_ep/features/random_ep/presentation/cubit/random_episode_cubit.dart';
import 'package:random_office_ep/features/random_ep/presentation/widgets/custom_button.dart';

class RandomEpisdoeInitailWidget extends StatelessWidget {
  const RandomEpisdoeInitailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset("assets/sad_animation.json", height: 300),
        Text(
          "Are you feeling down?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppPalette.text,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),

        CustomButton(
          onTap: () {
            context.read<RandomEpisodeCubit>().fetchEpisodes();
          },
          title: "Make me happy",
        ),
      ],
    );
  }
}
