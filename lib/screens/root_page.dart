import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/screens/home_page.dart';
import 'package:insta_clone/screens/search_page.dart';
import 'package:insta_clone/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      pageIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_icon.svg",
      pageIndex == 3
          ? "assets/images/love_active_icon.svg"
          : "assets/images/love_icon.svg",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];

    selectedTab(index) {
      setState(() {
        pageIndex = index;
      });
    }

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: const BoxDecoration(color: appFooterColor),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, bottom: 20, right: 20, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
              onTap: () {
                selectedTab(index);
              },
              child: SvgPicture.asset(
                bottomItems[index],
                width: 27,
              ),
            );
          }),
        ),
      ),
    );
  }

  PreferredSizeWidget? getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
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
                    //     right: 0,
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
      );
    } else if (pageIndex == 1) {
      return null;
    } else if (pageIndex == 2) {
      return AppBar(
        backgroundColor: appBarColor,
        title: const Text("Upload"),
      );
    } else if (pageIndex == 3) {
      return AppBar(
        backgroundColor: appBarColor,
        title: const Text("Activity"),
      );
    } else {
      return AppBar(
        backgroundColor: appBarColor,
        title: const Text("Account"),
      );
    }
  }

  Widget getBody() {
    List<Widget> pages = const [
      HomePage(),
      SearchPage(),
      Center(
        child: Text(
          "Upload Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      Center(
        child: Text(
          "Activity Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      Center(
        child: Text(
          "Account Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    ];

    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: black,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }
}
