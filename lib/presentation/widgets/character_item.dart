// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:new_bloc_app/data/models/characters.dart';
import 'package:new_bloc_app/helper/constants/colors_manager.dart';

// ignore: must_be_immutable
class CharacterItem extends StatelessWidget {
  Character character;
  CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: ColorsManager.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/characterDetailsScreen',
            arguments: character,
          );
        },
        child: GridTile(
          footer: Hero(
            tag: character.id!,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                "${character.name}",
                style: TextStyle(
                  color: ColorsManager.myWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          child: Container(
            color: ColorsManager.myGray,
            child:
                character.image!.isNotEmpty
                    ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,

                      placeholder: 'assets/images/loading.gif',
                      image: character.image!,
                      fit: BoxFit.cover,
                    )
                    : Image.asset('assets/images/oreWaOsama.jpg'),
          ),
        ),
      ),
    );
  }
}
