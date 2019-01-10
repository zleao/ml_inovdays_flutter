import 'package:flutter/material.dart';
import 'tweets_page.dart';
import 'login_page.dart';
import 'login_ok_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/LoginScreen': (context) => LoginScreen(),
    LoginOkPage.tag: (context) => LoginOkPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                    icon: new Image.asset("images/tab_twitter.png"),
                    text: "Twitter"),
                Tab(
                    icon: new Image.asset("images/tab_weather.png"),
                    text: "Weather"),
                Tab(
                    icon: new Image.asset("images/tab_authentication.png"),
                    text: "Authentication"),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              TweetsPage(tweets: fetchPosts(http.Client())),
              Tab(
                  icon: new Image.asset("images/tab_weather.png"),
                  text: "Weather"),
              LoginScreen()
            ],
          ),
        ),
      ),
    );
  }
}
