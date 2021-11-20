import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/constant/post_json.dart';
import 'package:insta_clone/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class PostItem extends StatefulWidget {
  final int index;

  const PostItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  var availablePosts = posts;

  updateLikes(index) {
    setState(() {
      availablePosts[index]['isLoved'] = !availablePosts[index]['isLoved'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  availablePosts[widget.index]["profileImg"]),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      availablePosts[widget.index]['name'],
                      style: const TextStyle(
                          color: white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    )
                  ],
                ),
                const Icon(LineIcons.verticalEllipsis, color: white)
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(availablePosts[widget.index]['postImg']),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        updateLikes(widget.index);
                      },
                      child: availablePosts[widget.index]['isLoved']
                          ? SvgPicture.asset("assets/images/loved_icon.svg",
                              width: 24)
                          : SvgPicture.asset("assets/images/love_icon.svg",
                              width: 24),
                    ),
                    const SizedBox(width: 16),
                    SvgPicture.asset("assets/images/comment_icon.svg",
                        width: 24),
                    const SizedBox(width: 16),
                    SvgPicture.asset("assets/images/message_icon.svg",
                        width: 24),
                  ],
                ),
                SvgPicture.asset("assets/images/save_icon.svg", width: 24)
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "Liked by ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              TextSpan(
                  text: "${availablePosts[widget.index]['likedBy']} ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 15)),
              const TextSpan(
                  text: "and ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              const TextSpan(
                  text: "others ",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
            ])),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "${availablePosts[widget.index]['name']} ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 15)),
              TextSpan(
                  text: "${availablePosts[widget.index]['caption']} ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 15)),
            ])),
          ),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                  "View ${availablePosts[widget.index]['commentCount']} comments",
                  style: TextStyle(
                      color: white.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.w500))),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      availablePosts[widget.index]['profileImg']),
                                  fit: BoxFit.cover))),
                      const SizedBox(width: 10),
                      Text("Add a Comment",
                          style: TextStyle(
                              color: white.withOpacity(0.5),
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      // Container(
                      //   width: 200,
                      //   child: TextField(
                      //     onTap: () {
                      //       print("tapped");
                      //     },
                      //     style: const TextStyle(
                      //         color: white,
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.w400,
                      //         letterSpacing: 1),
                      //     decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         hintText: "Add a Comment",
                      //         hintStyle:
                      //             TextStyle(color: white.withOpacity(0.5))),
                      //   ),
                      // ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("😂", style: TextStyle(fontSize: 16)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("😍", style: TextStyle(fontSize: 16)),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.add_circle, color: white.withOpacity(0.5))
                    ],
                  )
                ],
              )),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("${availablePosts[widget.index]['timeAgo']}",
                style: TextStyle(
                    color: white.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
