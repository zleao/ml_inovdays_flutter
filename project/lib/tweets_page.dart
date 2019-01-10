import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'tweet.dart';
import 'tweetslist.dart';

Future<List<Tweet>> fetchPosts(http.Client client) async {
  final response = await client.get('https://mliotplatform.azurewebsites.net/api/tweets/azure');

  return compute(parsePosts, response.body);
}

List<Tweet> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Tweet>((json) => Tweet.fromJson(json)).toList();
}

class TweetsPage extends StatelessWidget {
  final Future<List<Tweet>> tweets;

  TweetsPage({Key key, this.tweets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Tweet>>(
        future: tweets,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListViewTweets(tweets: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}