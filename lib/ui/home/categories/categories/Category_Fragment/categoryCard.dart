import 'package:flutter/material.dart';
import 'package:news_app/model/categoryModel.dart';
import 'package:news_app/utils/AppColors.dart';
import 'package:news_app/utils/AppStyles.dart';

class CategoryCard extends StatelessWidget {
  CategoryModel category;
  int index;

  CategoryCard({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.242,
      alignment: index % 2 == 0 ? Alignment.topRight : Alignment.topLeft,
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.all(Radius.circular(24)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(category.image),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category.title, style: Theme.of(context).textTheme.labelLarge),
          Container(
            // padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
            width: width * 0.452,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.all(Radius.circular(84)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text("View All", style: Theme.of(context).textTheme.labelLarge),
                    SizedBox(height: height * 0.005),
                  ],
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.black,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
