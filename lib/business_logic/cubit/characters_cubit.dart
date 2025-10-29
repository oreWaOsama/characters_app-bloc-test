import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_bloc_app/data/models/characters.dart';
import 'package:new_bloc_app/data/repositroy/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  Future<void> getAllCharacters() async {
    try {
      final characters = await charactersRepository.getAllCharacters();
      this.characters = characters;
      emit(CharactersLoaded(characters));
    } catch (e) {
      emit(CharactersError(e.toString()));
    }
  }
}
