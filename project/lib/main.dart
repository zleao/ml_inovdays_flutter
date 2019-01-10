import 'package:flutter/material.dart';
import 'tweets_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: new Image.asset("images/tab_twitter.png"), text: "Twitter"),
                Tab(icon: new Image.asset("images/tab_weather.png"), text: "Weather"),
                Tab(icon: new Image.asset("images/tab_authentication.png"), text: "Authentication"),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              TweetsPage(tweets: fetchPosts(http.Client())),
              new Image.asset("images/tab_weather.png"),
              new Image.asset("images/tab_authentication.png"),
            ],
          ),
        ),
      ),
    );
  }
}