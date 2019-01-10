class Tweet {
  final String user;
  final String userProfileImageUrl;
  final String message;
  final String url;
  //final DateTime date;

  Tweet({this.user, this.userProfileImageUrl, this.message, this.url});//, this.date});

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
        user: json['user'],
        userProfileImageUrl: json['userProfileImageUrl'],
        message: json['tweet'],
        url: json['url'],
        //date: json['date']
    );
  }
}