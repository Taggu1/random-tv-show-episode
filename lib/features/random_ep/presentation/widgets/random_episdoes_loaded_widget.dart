import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_office_ep/features/random_ep/models/episode_model.dart';
import 'package:random_office_ep/features/random_ep/presentation/cubit/random_episode_cubit.dart';
import 'package:random_office_ep/features/random_ep/presentation/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class RandomEpisdoeLoadedWidget extends StatelessWidget {
  final Episode episode;
  const RandomEpisdoeLoadedWidget({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    print(episode.runtime);
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (episode.imageUrl != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(22),

            child: Image.network(
              episode.imageUrl!,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
        SizedBox(height: 10),
        SelectableText(
          "Watch Episode ${episode.number} From The office Season ${episode.season}\nName ${episode.name}",
        ),
        SizedBox(height: 20),
        if (size.width > 500)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(episode.url))) {
                    throw Exception('Could not launch ${episode.url}');
                  }
                },
                title: "Go to episode",
              ),
              CustomButton(
                onTap: () {
                  context.read<RandomEpisodeCubit>().fetchEpisodes();
                },
                title: "Load another one",
              ),
            ],
          ),
        if (size.width <= 500)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButton(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(episode.url))) {
                    throw Exception('Could not launch ${episode.url}');
                  }
                },
                title: "Go to episode",
              ),
              SizedBox(height: 10),

              CustomButton(
                onTap: () {
                  context.read<RandomEpisodeCubit>().fetchEpisodes();
                },
                title: "Load another one",
              ),
            ],
          ),
      ],
    );
  }
}
