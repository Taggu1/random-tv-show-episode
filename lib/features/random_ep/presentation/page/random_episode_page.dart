import 'package:flutter/material.dart';
import 'package:random_office_ep/features/random_ep/presentation/widgets/random_episode_widget.dart';

class RandomEpisodePage extends StatelessWidget {
  const RandomEpisodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Align(
            alignment: Alignment.center,
            child: RandomEpisodeWidget(),
          ),
        ),
      ),
    );
  }
}
