import 'package:flutter/material.dart';
import 'package:insta_clone/theme/colors.dart';

class CategoryStory extends StatelessWidget {
  final String name;
  const CategoryStory({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: black,
            border: Border.all(color: white.withOpacity(0.2))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            name,
            style: const TextStyle(
                color: white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
