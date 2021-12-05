import 'package:flutter/material.dart';
import 'package:insta_clone/constant/search_json.dart';
import 'package:insta_clone/screens/post_page.dart';
import 'package:insta_clone/theme/colors.dart';
import 'package:insta_clone/widgets/search_category_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Row(
              children: [
                const SizedBox(width: 15),
                Container(
                  height: 45,
                  width: size.width - 30,
                  decoration: BoxDecoration(
                      color: textFieldBackground,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(color: white.withOpacity(0.5)),
                        prefixIcon:
                            Icon(Icons.search, color: white.withOpacity(.5))),
                    cursorColor: white.withOpacity(0.3),
                    style: TextStyle(color: white.withOpacity(.3)),
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: List.generate(
                    searchCategories.length,
                    (index) => CategoryStory(
                          name: searchCategories[index],
                        )),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
              runSpacing: 2,
              spacing: 2,
              children: List.generate(
                searchImages.length,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(PostPage.routeName,arguments: searchImages[index]);
                  },
                  child: Container(
                    height: (size.width - 5) / 3,
                    width: (size.width - 5) / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              searchImages[index],
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ))
          // Expanded(
          //   child: GridView.builder(
          //       itemCount: searchImages.length,
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 3,
          //           crossAxisSpacing: 1,
          //           mainAxisSpacing: 1,
          //           childAspectRatio: 1 / 1),
          //       itemBuilder: (_, index) {
          //         return Container(
          //           height: 100,
          //           width: 100,
          //           decoration: BoxDecoration(
          //               image: DecorationImage(
          //                   image: NetworkImage(
          //                     searchImages[index],
          //                   ),
          //                   fit: BoxFit.cover)),
          //         );
          //       }),
          // )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }
}
