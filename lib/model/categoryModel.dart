
import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';

class CategoryModel {
  String id;
  String image;
  String title;

  CategoryModel({required this.id, required this.title, required this.image});

  static List<CategoryModel> createCategoryList({required BuildContext context}) {
    return [
      CategoryModel(
        id: "general",
        title: AppLocalizations.of(context)!.general,
        image: "assets/images/general.png",
      ),
      CategoryModel(
        id: "business",
        title: AppLocalizations.of(context)!.business,
        image: "assets/images/busniess.png",
      ),
      CategoryModel(
        id: "entertainment",
        title: AppLocalizations.of(context)!.entertainment,
        image: "assets/images/entertainment.png",
      ),
      CategoryModel(
        id: "health",
        title: AppLocalizations.of(context)!.health,
        image: "assets/images/helth.png",
      ),
      CategoryModel(
        id: "science",
        title: AppLocalizations.of(context)!.science,
        image: "assets/images/science.png",
      ),
      CategoryModel(
        id: "technology",
        title:AppLocalizations.of(context)!.technology,
        image: "assets/images/technology.png",
      ),
      CategoryModel(
        id: "sports",
        title: AppLocalizations.of(context)!.sports,
        image: "assets/images/sport.png",
      ),
    ];
  }
}
