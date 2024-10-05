
class NewsItem {
  final String imageUrl;
  final String title;
  final String content;
  final List<String> tags;
  final String author;

  NewsItem({
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.tags,
    required this.author,
  });
}

List<NewsItem> dummyNewsItems = [
  NewsItem(
    imageUrl: "https://example.com/basketball.jpg",
    title: "3x3 Basketball Stars Shine: Champions Park Highlights in Los Angeles",
    content: "In a thrilling display of athleticism and determination, the 3x3 Basketball tournament in sports entertainment kicked off with a bang, marking one of the most intense championship games of the season. The packed Park Stadium buzzed with long-anticipated matchups between the reigning champions, the Falcon City Flyers, and their rivals, the Silver Ridge Warriors.\n\nFrom the first whistle, both teams showcased their prowess, keeping spectators on the edge of their seats. The Flyers, led by star point guard James \"Flash\" Mitchell, dominated the first half with a series of impressive passes and signature plays. Mitchell connected with his all-star receiver Derek Stone for two explosive alley-oops that brought the crowd to their feet.\n\nHowever, the Warriors were not going to back down without a fight. After a shaky start, they regrouped during halftime and came out with renewed fire, hatching through the Flyers' defense with precision and teamwork. Rookie sensation Kyle Harris stunned with a series of three-pointers that shifted the crowd's energy and tilted the momentum in the Warriors' favor.",
    tags: ["Sports", "Nigeria"],
    author: "John Smith",
  ),
  NewsItem(
    imageUrl: "https://example.com/tech_conference.jpg",
    title: "Global Tech Summit 2024: Innovations Shaping Our Future",
    content: "The annual Global Tech Summit kicked off yesterday in Silicon Valley, bringing together the brightest minds in technology from around the world. This year's theme, \"Innovations Shaping Our Future,\" has already sparked intense discussions and unveiled groundbreaking technologies that promise to revolutionize various industries.",
    tags: ["Technology", "Innovation"],
    author: "Emily Chen",
  ),
  NewsItem(
    imageUrl: "https://example.com/climate_change.jpg",
    title: "New Study Reveals Accelerated Pace of Climate Change",
    content: "A comprehensive study published today in the Journal of Environmental Science has revealed that the pace of climate change is accelerating at a rate faster than previously predicted. The research, conducted over a decade by an international team of scientists, provides compelling evidence of the urgent need for global action.",
    tags: ["Environment", "Science"],
    author: "Dr. Michael Johnson",
  ),
];