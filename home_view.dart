import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView(this.controller, {super.key});

  final ScrollController controller;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _randomImage = 'https://picsum.photos/200/300';
  String dummyTweet =
      "As for Alaturka, it means Turkish-style in English. It is a term used to describe things related to Turkish culture and traditions. For instance, Alaturka tuvalet translates to Turkish-style toilet and refers to the traditional floor-level toilet commonly used in Turkey and some Middle Eastern countries.";

  void dispose() {
    //dispose() yöntemi, bir StatefulWidget ömrü sona erdiğinde (bir widget ağacından kalıcı olarak kaldırıldığında) çağrılan bir
    //yaşam döngüsü yöntemidir. Bu yöntem, ilgili State nesnesini temizlemek ve gerektiğinde kaynakları serbest bırakmak için kullanılır. Bu sayede,
    //hafıza sızıntılarını önler ve uygulama performansını artırır.
    super.dispose();
    // scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: _FAButton, body: _listView);
  }

  Widget get _FAButton => FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      );

  Widget get _expandedListView => Expanded(
        child: _listView,
      );

  Widget get _listView => ListView.builder(
      itemCount: 10,
      controller: widget.controller,
      itemBuilder: (context, index) {
        return _listViewCard;
      });

  Widget get _listViewCard => Card(
          child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(_randomImage),
        ),
        title: Wrap(
          direction: Axis.horizontal,
          runSpacing: 5,
          children: <Widget>[
            _listCardTitle("Hello"),
            Text(dummyTweet),
            _placeHolderField,
            _footerButtonRow
          ],
        ),
      ));

  Widget _listCardTitle(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget get _placeHolderField => Container(
        height: 100,
        child: Placeholder(),
      );

  Widget _iconLabel(String text) => Wrap(
        spacing: 5,
        children: <Widget>[
          Icon(
            Icons.comment,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text)
        ],
      );

  Widget get _iconLabelButton => InkWell(
        child: _iconLabel("1"),
        onTap: () {},
      );

  Widget get _footerButtonRow => Row(
        children: [
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton,
        ],
      );

  // Widget get

  // Widget get
}

final titleTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Colors.black);
