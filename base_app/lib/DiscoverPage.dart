import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  // Sample list of pregnancy-related articles
  final List<Map<String, String>> articles = [
    {
      'title': 'Early Pregnancy Symptoms',
      'description': 'Learn about the early signs and symptoms of pregnancy.',
      'emoji': '🤰👶',
    },
    {
      'title': 'Healthy Eating During Pregnancy',
      'description': 'Nutrition tips and advice for expecting mothers.',
      'emoji': '🥗🍏',
    },
    {
      'title': 'Pregnancy Week by Week',
      'description': 'A week-by-week guide to your pregnancy journey.',
      'emoji': '📅🤰',
    },
    {
      'title': 'Exercise for Pregnant Women',
      'description': 'Safe exercises to do during pregnancy.',
      'emoji': '💪🤰',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregnancy Articles'),
        backgroundColor: Color(0xFF8B5E83),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return _buildArticleCard(context, articles[index]);
        },
      ),
    );
  }

  Widget _buildArticleCard(BuildContext context, Map<String, String> article) {
    return GestureDetector(
      onTap: () {
        // Navigate to a detailed page when an article is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(article: article),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article['title']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                article['description']!,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 10),
              Text(
                article['emoji']!,
                style: TextStyle(fontSize: 24), // Emoji display
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  final Map<String, String> article;

  ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['title']!),
        backgroundColor: Color(0xFF8B5E83),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article['title']!,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              article['description']!,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Text(
              "Additional Details (Optional) - Placeholder",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
