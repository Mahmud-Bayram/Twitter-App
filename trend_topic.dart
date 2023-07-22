class TrendTopic {
  late String location;
  late String hashtag;
  late String tweets;

  TrendTopic({required this.location, required this.hashtag, required this.tweets});

  TrendTopic.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    hashtag = json['hashtag'];
    tweets = json['tweets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['hashtag'] = this.hashtag;
    data['tweets'] = this.tweets;
    return data;
  }
}
