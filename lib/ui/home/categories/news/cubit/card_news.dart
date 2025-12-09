import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/model/sourcesRespone.dart';
import 'package:news_app/utils/AppColors.dart';
import 'package:news_app/utils/AppStyles.dart';

class CardNews extends StatelessWidget {
  News source;

  CardNews({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: Theme.of(context).indicatorColor, width: 2),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              height: height * 0.3,
              width: double.infinity,
              imageUrl: source.urlToImage ?? "",
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).indicatorColor,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: height * 0.012),
          Text(
            source.title ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: height * 0.012),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "By ${source.author}",
                  style: AppStyles.medium12grey,
                ),
              ),
              Text(source.publishedAt ?? "", style: AppStyles.medium12grey),
            ],
          ),
        ],
      ),
    );
  }


}
