import 'package:flutter/material.dart';
import 'package:insta_clone/constant/story_json.dart';
import 'package:insta_clone/theme/colors.dart';

class Story extends StatelessWidget {
  final int index;
  const Story({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 1),
      child: Column(children: [
        Container(
          width: 75,
          height: 75,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: storyBorderColor,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                  border: Border.all(color: black, width: 2),
                  image: DecorationImage(
                      image: NetworkImage(stories[index]['img']),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            width: 70,
            child: Text(
              stories[index]['name'],
              style: const TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12),
            ))
      ]),
    );
  }
}
