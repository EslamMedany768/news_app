import 'package:flutter/material.dart';

import 'categories/categories/Category_Fragment/category_fragment.dart';
import 'categories/categories/cubit/source_details_view.dart';
import 'categories/news/cubit/news_Widget.dart';
import 'drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: CustomDrawer(onHomeButtonClicked: onDrawerIconClicked),
      appBar: AppBar(title: Text("Home")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          category == null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    "Good Morning\nHere is Some News For You",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              : SizedBox(),
          category == null
              ? CategoryFragment(onCardClicked: onCardClicked)
              : SourceDetailsView(category: category!),
        ],
      ),
    );
  }

  static String? category;

  void onCardClicked(String newCategory) {
    category = newCategory;
    setState(() {});
  }

  void onDrawerIconClicked() {
    Navigator.pop(context);
    category = null;
    setState(() {});
  }
}
