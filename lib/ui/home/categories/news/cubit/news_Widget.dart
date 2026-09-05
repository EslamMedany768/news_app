import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/model/sourcesRespone.dart';
import 'package:news_app/ui/home/categories/news/cubit/news_states.dart';
import 'package:news_app/ui/home/categories/news/cubit/news_view_model.dart';
import 'package:news_app/utils/AppColors.dart';

import '../../../../../l10n/app_localizations.dart';
import 'card_news.dart';

class NewsWidget extends StatefulWidget {
  Sources source;

  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {

  int page = 1;
  NewsViewModel viewModel = NewsViewModel();


  @override
  void initState() {
    // TODO: implement initState
    print("sourceId is : ${widget.source.id}");
    viewModel.getNews(widget.source.id!, page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<NewsViewModel, NewsState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsSuccessState) {
          viewModel.NewsList.addAll(state.newsList);
          state.newsList.clear();

          return ListView.builder(
            itemCount: viewModel.NewsList.length + 1,
            itemBuilder: (context, index) {
              if (index < viewModel.NewsList.length)
                return InkWell(
                  onTap: () {
                    modalBottomSheet(height: height, source: viewModel.NewsList[index]);
                  },
                  child: CardNews(source: viewModel.NewsList[index]),
                );
              else if (viewModel.NewsList.isEmpty) {
                return Column(children: [Text("this source is empty")]);
              } else {
                page++;
                viewModel.getNews(widget.source.id!, page);
                return Center(
                  child: CircularProgressIndicator(color: AppColors.black),
                );
              }
            },
          );
        } else if (state is NewsErrorState) {
          return Text(
            state.errorMessage,
            style: Theme.of(context).textTheme.titleLarge,
          );
        } else if (state is NewsLoadingState && viewModel.NewsList.isEmpty) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.black),
          );
        } else {
          return Container();
        }
      },
    );
  }

  // FutureBuilder<NewsResponse?>(
  //       future: ApiManager.getNewsBySourceId(widget.source.id ?? ""),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return C
  //         } else if (snapshot.hasError) {
  //           Column(
  //             children: [
  //               ElevatedButton(
  //                 onPressed: () {
  //                   ApiManager.getNewsBySourceId(widget.source.id ?? "");
  //                   setState(() {});
  //                 },
  //                 child: Text(
  //                   "Try Again",
  //                   style: Theme.of(context).textTheme.titleLarge,
  //                 ),
  //               ),
  //             ],
  //           );
  //         }
  //         if (snapshot.data!.status != "ok") {
  //
  //         }
  //
  //         );
  //       },
  //     )

  void modalBottomSheet({required var height, required News source}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(9),
          height: height * 0.52,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    height: height * 0.33,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl: source.urlToImage!,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).indicatorColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    source.description!,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).indicatorColor,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.view_full_article,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
