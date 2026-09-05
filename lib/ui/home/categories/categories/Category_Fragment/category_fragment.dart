import 'package:flutter/material.dart';
import 'package:news_app/model/categoryModel.dart';
import 'categoryCard.dart';

class CategoryFragment extends StatelessWidget {
  Function onCardClicked;
  CategoryFragment({super.key, required this.onCardClicked});

@override

  Widget build(BuildContext context) {
   late var categoryList=CategoryModel.createCategoryList(context: context);
    return Expanded(
      child: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onCardClicked(categoryList[index].id);
            },
            child: CategoryCard(category: categoryList[index], index: index),
          );
        },
      ),
    );
  }
}
