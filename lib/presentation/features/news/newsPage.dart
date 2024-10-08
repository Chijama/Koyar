import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/common/appBar.dart';
import 'package:koyar/presentation/common/customTextField.dart';
import 'package:koyar/presentation/features/news/models/newsModel.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/routeManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';
import 'package:koyar/presentation/service/firebaseDatabaseService.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: const CustomAppBar(title: "Election News", semanticsLabel: ' '),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder<List<NewsModel>>(
          future: FirebaseDatabaseService()
              .fetchArticles(), // Call the fetch function
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No news available'));
            } else {
              final newsItems = snapshot.data!;
              return Column(
                children: [
                  Semantics(
                      label: "Search for election news.",
                      child: const CustomBoxTextField(
                          hintText: 'Search election news...')),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: newsItems.length,
                      itemBuilder: (context, index) {
                        return NewsItemCard(newsItem: newsItems[index]);
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class NewsItemCard extends StatelessWidget {
  final NewsModel newsItem;

  const NewsItemCard({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: AppColors.appBackgroundColor,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.appMainBackgroundOffWhite,
          border: Border.all(color: AppColors.appBlack.withOpacity(0.2)),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(0),
            bottom: Radius.circular(5),
          ),
        ),
        child: InkWell(
          onTap: () {
            context.push(BaseRouteName.newsDetailPage, extra: newsItem);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                flightShuttleBuilder: (
                  BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext,
                ) {
                  final Widget toHero = toHeroContext.widget;
                  return RotationTransition(
                    turns: animation,
                    child: toHero,
                  );
                },
                tag: newsItem.title,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsItem.title,
                      textAlign: TextAlign.left,
                      style: getPlusJakartaSans(
                        textColor: AppColors.appBlack,
                        fontsize: 18,
                        fontweight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "By ${newsItem.author}",
                      style: getNormalZodiak(
                        textColor: AppColors.appLinkBlue,
                        fontsize: 12,
                        fontweight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      newsItem.content.split("\n").first,
                      style: getPlusJakartaSans(
                        textColor: AppColors.appSecondaryTextMediumGray,
                        fontsize: 13,
                        fontweight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
