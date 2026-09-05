import 'package:flutter/material.dart';
import 'package:news_app/model/sourcesRespone.dart';
import 'package:news_app/ui/home/categories/news/cubit/news_Widget.dart';
import 'package:news_app/utils/AppColors.dart';

import 'TabNameWidget.dart';

class CustomTabBar extends StatefulWidget {
  List<Sources>? sourcesList;

  CustomTabBar({super.key, required this.sourcesList});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: widget.sourcesList!.length,
      child: Column(
        children: [
          TabBar(
            onTap: (value) {
              selectedIndex = value;
              print(selectedIndex);
              setState(() {});
            },

            tabAlignment: TabAlignment.start,
            isScrollable: true,
            dividerColor: Colors.transparent,
            tabs: widget.sourcesList!.map((object) {
              return TabNameWidget(
                sources: object,
                isSelected:
                    widget.sourcesList!.indexOf(object) == selectedIndex,
              );
            }).toList(),
          ),
          SizedBox(height: height * 0.0114),
          SizedBox(
            height: height * 0.850,
            child: NewsWidget(
              key: ValueKey(widget.sourcesList![selectedIndex].id),
              source: widget.sourcesList![selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
