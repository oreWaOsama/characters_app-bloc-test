// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:new_bloc_app/data/models/characters.dart';
import 'package:new_bloc_app/helper/constants/colors_manager.dart';

class CharacterDetialsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetialsScreen({super.key, required this.character});

  Widget buildSilverAppBar() {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      stretch: true,
      backgroundColor: ColorsManager.myWhite,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name ?? 'No Name',
          style: TextStyle(
            color: ColorsManager.myGray,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Hero(
          tag: character.id!,
          child: Image.network(character.image ?? '', fit: BoxFit.cover),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.myGray,
      body: CustomScrollView(
        slivers: [
          buildSilverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${character.name ?? 'No Name'}',
                      style: TextStyle(
                        color: ColorsManager.myWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Status: ${character.status ?? 'Unknown'}',
                      style: TextStyle(
                        color: ColorsManager.myWhite,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Species: ${character.species ?? 'Unknown'}',
                      style: TextStyle(
                        color: ColorsManager.myWhite,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Type: ${character.type ?? 'Unknown'}',
                      style: TextStyle(
                        color: ColorsManager.myWhite,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
