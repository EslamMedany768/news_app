import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/ui/home/HomeScreen.dart';

import 'package:news_app/utils/AppColors.dart';
import 'package:news_app/utils/AppStyles.dart';
import 'package:news_app/utils/AppTheme.dart';
import 'package:provider/provider.dart';

import '../../../providers/language_provider.dart';

class CustomDrawer extends StatelessWidget {
  Function onHomeButtonClicked;

  CustomDrawer({super.key, required this.onHomeButtonClicked});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.684,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: AppColors.white,
            height: height * 0.194,
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context)!.news_app,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              color: AppColors.black,
              child: Column(
                children: [
                  //todo: homeButton
                  InkWell(
                    onTap: () {
                      onHomeButtonClicked();
                      // Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.home_outlined, color: AppColors.white),
                        SizedBox(width: width * 0.03),
                        Text(
                          AppLocalizations.of(context)!.go_to_home,
                          style: AppStyles.bold16white.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Divider(),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.format_paint_outlined, color: AppColors.white),
                      SizedBox(width: 12),
                      Text(
                        AppLocalizations.of(context)!.theme,
                        style: AppStyles.bold16white.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  DropdownMenu(
                    width: width * 0.59,
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      hintStyle: AppStyles.bold16white.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                      suffixIconColor: AppColors.white,
                    ),

                    hintText: themeProvider.appTheme == ThemeMode.light
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    textStyle: AppStyles.bold16white.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),

                    menuStyle: MenuStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      maximumSize: MaterialStatePropertyAll(
                        Size(width * 0.58, height * 0.2),
                      ),

                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                        value: 1,
                        label: AppLocalizations.of(context)!.dark,
                      ),
                      DropdownMenuEntry(
                        value: 2,
                        label: AppLocalizations.of(context)!.light,
                      ),
                    ],
                    onSelected: (value) {
                      value == 1
                          ? themeProvider.changeTheme(ThemeMode.dark)
                          : themeProvider.changeTheme(ThemeMode.light);
                    },
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.language_outlined, color: AppColors.white),
                      SizedBox(width: 12),
                      Text(
                        AppLocalizations.of(context)!.language,
                        style: AppStyles.bold16white.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  DropdownMenu(textStyle:AppStyles.bold16white.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                    width: width * 0.59,
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      hintStyle: AppStyles.bold16white.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                      suffixIconColor: AppColors.white,
                    ),
                    initialSelection: languageProvider.language=="en"?1:2,

                    // hintText:
                    //     Localizations.localeOf(context).languageCode == "ar"
                    //     ? AppLocalizations.of(context)!.arabic
                    //     : AppLocalizations.of(context)!.english,
                    // textStyle: AppStyles.bold16white.copyWith(
                    //   color: Theme.of(context).primaryColor,
                    // ),

                    menuStyle: MenuStyle(

                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      maximumSize: MaterialStatePropertyAll(
                        Size(width * 0.58, height * 0.2),
                      ),

                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor,
                      ),
                    ),

                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: 1, label: AppLocalizations.of(context)!.english),
                      DropdownMenuEntry(value: 2, label: AppLocalizations.of(context)!.arabic),
                    ],
                    onSelected: (value) {
                      value == 1
                          ? languageProvider.changeLanguage("en")
                          : languageProvider.changeLanguage("ar");

                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
