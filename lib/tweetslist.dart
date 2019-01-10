import 'package:flutter/material.dart';
import 'tweet.dart';

class ListViewTweets extends StatelessWidget {
  final List<Tweet> tweets;

  ListViewTweets({Key key, this.tweets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: tweets.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  title: Text(
                    '${tweets[position].user}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    '${tweets[position].message.substring(0, 50)}...',
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25.0,
                        child: new Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(tweets[position].userProfileImageUrl)
                                )
                            ))
                      )
                    ],
                  ),
                  onTap: () => _onTapItem(context, tweets[position]),
                ),
              ],
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, Tweet tweet) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(tweet.user + ' - ' + tweet.message)));
  }
}
