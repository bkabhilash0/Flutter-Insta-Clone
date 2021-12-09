import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/constant/post_json.dart';
import 'package:insta_clone/constant/story_json.dart';
import 'package:insta_clone/screens/chat_page.dart';
import 'package:insta_clone/theme/colors.dart';
import 'package:insta_clone/widgets/post_item.dart';
import 'package:insta_clone/widgets/story_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var availablePosts = posts;
  PageController pageC = PageController();

  updateLikes(index) {
    setState(() {
      availablePosts[index]['isLoved'] = !availablePosts[index]['isLoved'];
    });
  }

  triggerGoBack() {
    pageC.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Instagram",
              style: TextStyle(fontFamily: "Billabong", fontSize: 35),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/upload_icon.svg",
                  width: 25,
                ),
                const SizedBox(
                  width: 15,
                ),
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/images/message_icon.svg",
                      width: 25,
                    ),
                    // Positioned(
                    //     right: -5,
                    //     top: -10,
                    //     child: Container(
                    //       padding: const EdgeInsets.all(2),
                    //       width: 18,
                    //       height: 18,
                    //       decoration: const BoxDecoration(
                    //           color: Colors.red, shape: BoxShape.circle),
                    //       child: const Center(
                    //         child: Text("7",
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(fontSize: 13)),
                    //       ),
                    //     ))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 15, bottom: 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Stack(children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(profile),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 19,
                                  width: 19,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: white),
                                  child: const Icon(
                                    Icons.add_circle,
                                    color: buttonFollowColor,
                                    size: 19,
                                  ),
                                ))
                          ]),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                            width: 70,
                            child: Text(
                              name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12),
                            ))
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(
                        stories.length, (index) => Story(index: index)),
                  )
                ],
              ),
            ),
            Divider(
              color: white.withOpacity(0.3),
            ),
            // const SizedBox(height: 15,),
            Column(
              children: List.generate(
                  posts.length,
                  (index) => PostItem(
                        index: index,
                      )),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageC,
        itemCount: 2,
        itemBuilder: (_, index) {
          if (index == 0) {
            return getBody();
          } else {
            return ChatPage(onPress: triggerGoBack);
          }
        });
  }
}
