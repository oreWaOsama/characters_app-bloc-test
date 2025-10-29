import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc_app/business_logic/cubit/characters_cubit.dart';
import 'package:new_bloc_app/data/models/characters.dart';
import 'package:new_bloc_app/helper/constants/colors_manager.dart';
import 'package:new_bloc_app/presentation/widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedCharacters;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  int index = 0;

  Widget bulidSearchField() {
    return TextField(
      controller: _searchController,
      cursorColor: ColorsManager.myGray,
      style: TextStyle(color: ColorsManager.myGray),
      decoration: InputDecoration(
        hintText: 'Search Characters',
        hintStyle: TextStyle(color: ColorsManager.myGray),
        border: InputBorder.none,
      ),
      onChanged: (searchedCharacter) {
        searchedCharacters =
            allCharacters
                .where(
                  (character) =>
                      character.name?.toLowerCase().startsWith(
                        searchedCharacter.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
        setState(() {});
      },
    );
  }

  List<Widget> buildActions() {
    if (_isSearching) {
      return [
        IconButton(
          icon: Icon(Icons.clear, color: ColorsManager.myGray),
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: Icon(Icons.search, color: ColorsManager.myGray),
          onPressed: _startSearching,
        ),
      ];
    }
  }

  void _startSearching() {
    ModalRoute.of(
      context,
    )?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget blocBuildWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildListWidgets();
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.myYellow,
              strokeWidth: 1.0,
            ),
          );
        }
      },
    );
  }

  Widget buildListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: ColorsManager.myGray,
        child: buildCharactersList(),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount:
          _searchController.text.isEmpty
              ? allCharacters.length
              : searchedCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character:
              _searchController.text.isEmpty
                  ? allCharacters[index]
                  : searchedCharacters[index],
        );
      },
    );
  }

  Widget buildAppBarTitle() {
    return Text('Characters', style: TextStyle(color: ColorsManager.myGray));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? bulidSearchField() : buildAppBarTitle(),
        actions: buildActions(),
        backgroundColor: ColorsManager.myYellow,
      ),
      body: blocBuildWidget(),
    );
  }
}
