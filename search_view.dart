import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/trend_topic.dart';

import '../custom/refresh2.dart';

class SearchView extends StatefulWidget {
  SearchView(this.scrollController);
  final ScrollController scrollController;

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  double _padding = 20;
  late TrendTopic _topic;
  bool isRefresh = false;

  Widget get _divider => Divider(height: 0, color: Colors.grey);

  Widget get _downIconWidget => AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: isRefresh ? 60 : 30,
        child: isRefresh
        ?Center(child: CircularProgressIndicator())
        : Icon(
          Icons.arrow_downward,
          color: Colors.grey,
        ),
      );

  Widget get _emptySpace => SizedBox(
        height: 10,
      );

  Widget get _listHashView => ListView.separated(
      itemCount: 5,
      shrinkWrap:
          true, //İçeriğin ekrana sığdırıldığı boyutu kapsar. Yani, ekrana sığmayan veya taşınamayan
      //içerikleri küçültmek için kullanılır.
      physics:
          NeverScrollableScrollPhysics(), //Bu fizik modeli, belirli bir widget'ın kaydırılmasını devre dışı bırakır.
      separatorBuilder: (context, index) => _divider,
      itemBuilder: (context, index) => cardListMethod(context));

  Widget get _trendTitleWidget => Card(
        margin: EdgeInsets.all(0),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(color: Colors.grey, width: .5)),
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: _padding),
          alignment: Alignment.centerLeft,
          child: Text(
            "Trends for you",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator2(
        onRefresh: tempFuture,
        child: ListView(
          controller: widget.scrollController,
          children: <Widget>[
          _downIconWidget,
          _emptySpace,
          _trendTitleWidget,
          _listHashView,
        ]));
  }

  Card cardListMethod(BuildContext context) {
    return Card(
      // Card component'inin kendine ait
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          side: BorderSide(style: BorderStyle.none, color: Colors.transparent)),
      child: listPadding(context),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _topic = TrendTopic(
        hashtag: "#Champions League",
        location: "Trendin in Turkey",
        tweets: "16.8K Tweets");
  }

  Padding listPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _padding, vertical: 5),
      child: row(context),
    );
  }

  Row row(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Wrap(
          //"Container" widget'ı içerisindeki widget'ları düzenlemek ve stillemek için
          //  kullanılırken, "Wrap" widget'ı içerisindeki widget'ları sığdırmak ve esnek bir düzen oluşturmak için kullanılır.
          direction: Axis.vertical,
          spacing: 5,
          children: <Widget>[
            Text(_topic.location, style: Theme.of(context).textTheme.bodySmall),
            Text(_topic.hashtag,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontSize: 15)),
            Text(_topic.tweets, style: Theme.of(context).textTheme.labelLarge),
          ],
        )),
        Icon(Icons.arrow_drop_down)
      ],
    );
  }

  Future tempFuture() async {
    setState(() {
      isRefresh = !isRefresh;
    });
    await Future.delayed(Duration(milliseconds: 500));
     setState(() {
      isRefresh = !isRefresh;
    });
  }

  // Widget get _ =>

  // Widget get _ =>

  // Widget get _ =>

  // Widget get _ =>

  // Widget get _ =>

  // Widget get _ =>

  // Widget get _ =>

  // Widget get _downIcon =>
}
