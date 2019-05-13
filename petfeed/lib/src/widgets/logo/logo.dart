import 'package:flutter/material.dart';
import 'package:petfeed/src/assets/assets.dart';

class PetFeedLogo extends StatelessWidget {
  final bool inverted;

  const PetFeedLogo({Key key, this.inverted = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.paw,
          color: inverted ? Colors.grey[400] : Colors.black,
          size: FontSize.fontSize30,
        ),
        SizedBox(width: 5),
        Text(
          "PetFeed",
          style: TextStyle(
            fontSize: FontSize.fontSize30,
            color: inverted ? Colors.grey[400] : Colors.black,
          ),
        ),
      ],
    );
  }
}
