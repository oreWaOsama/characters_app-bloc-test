import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc_app/business_logic/cubit/characters_cubit.dart';
import 'package:new_bloc_app/data/models/characters.dart';
import 'package:new_bloc_app/data/repositroy/characters_repository.dart';
import 'package:new_bloc_app/presentation/screens/character_detials_screen.dart';

import 'package:new_bloc_app/presentation/screens/character_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit characterCubit;

  AppRouter() {
    charactersRepository = CharactersRepository();
    characterCubit = CharactersCubit(charactersRepository);
  }

  // ignore: body_might_complete_normally_nullable
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => characterCubit,
                child: CharacterScreen(),
              ),
        );
      case '/characterDetailsScreen':
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharacterDetialsScreen(character: character),
        );
    }
  }
}
