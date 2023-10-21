import 'package:app_creative_val/firebase_options.dart';
import 'package:app_creative_val/src/infrastructure/pokemon_repository.dart';
import 'package:app_creative_val/src/presentation/cubit/pokemon/pokemon_cubit.dart';
import 'package:app_creative_val/src/presentation/cubit/user/user_cubit.dart';
import 'package:app_creative_val/src/presentation/screens/detail_screen.dart';
import 'package:app_creative_val/src/presentation/screens/home_page.dart';
import 'package:app_creative_val/src/presentation/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(
          create: (context) => PokemonCubit(PokemonRepositoryImpl()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomePage(),
      },
      initialRoute: 'login',
    );
  }
}
