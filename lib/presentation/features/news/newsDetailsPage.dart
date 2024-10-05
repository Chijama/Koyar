import "package:flutter/material.dart";
import "package:koyar/presentation/features/news/models/newsModel.dart";
import "package:koyar/presentation/features/news/newsModel.dart";
import "package:koyar/presentation/manager/colorManager.dart";
import "package:koyar/presentation/manager/styleManager.dart";

class NewsDetailPage extends StatelessWidget {
  final NewsModel newsItem;

  const NewsDetailPage({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 400.0,
            collapsedHeight: 70,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.appBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(""),
              background: Hero(
                tag: newsItem.title,
                child: Image.network(
                  newsItem.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.error, color: Colors.red),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(newsItem.title,
                      style: getPlusJakartaSans(
                          textColor: AppColors.appBlack,
                          fontsize: 18,
                          fontweight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text("By ${newsItem.author}",
                      style: getNormalZodiak(
                          textColor: AppColors.appLinkBlue,
                          fontsize: 13,
                          fontweight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: newsItem.tags
                        .split(",")
                        .map((tag) => Chip(
                              label: Text(
                                tag,
                                style: getPlusJakartaSans(
                                    textColor: AppColors.appLinkBlue,
                                    fontsize: 12,
                                    fontweight: FontWeight.w600),
                              ),
                              backgroundColor: Colors.transparent,
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Posted 24hrs ago",
                    style: getPlusJakartaSans(
                        textColor: AppColors.appPrimaryTextDarkGray,
                        fontsize: 14,
                        fontweight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    newsItem.content,
                    style: const TextStyle(fontSize: 16),
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
