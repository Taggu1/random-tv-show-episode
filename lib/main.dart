import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_office_ep/core/theme/app_palette.dart';
import 'package:random_office_ep/features/random_ep/presentation/cubit/random_episode_cubit.dart';
import 'package:random_office_ep/features/random_ep/presentation/page/random_episode_page.dart';

import './dp_injection.dart' as dp;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dp.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => dp.sl<RandomEpisodeCubit>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          scaffoldBackgroundColor: AppPalette.base,
        ),
        home: RandomEpisodePage(),
      ),
    );
  }
}
