import 'package:flutter/material.dart';
import 'package:petfeed/src/assets/assets.dart';

class PetFeedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.paw,
          color: Colors.black,
          size: FontSize.fontSize20,
        ),
        SizedBox(width: 5),
        Text(
          "PetFeed",
          style: TextStyle(
            fontSize: FontSize.fontSize18,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
