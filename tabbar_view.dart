import 'package:flutter/material.dart';
import 'package:untitled/home/home_view.dart';
import 'package:untitled/home/search_view.dart';

class TabbarView extends StatefulWidget {
  const TabbarView({super.key});

  @override
  _TabbarViewState createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  bool _isHeaderClose = false;
  String profileImage = 'assets\profileFoto.jpeg';
  late ScrollController scrollController;
  double lastOffset = 0;

  @override
  void initState() {
    //initState() yöntemi kullanmanın herhangi bir ekstra yararı yoktur. Ancak, bu iki yaklaşımın temel farkı, initState()
    //yöntemi içinde ScrollController'ın nasıl başlatılacağına dair daha fazla esneklik ve kontrol sağlamasıdır. Bazı durumlarda, özellikle başlatma
    //işlemleri karmaşıksa veya duruma bağlı olarak değişiklik gösteriyorsa, initState() içinde başlatma işlemi daha anlamlı olabilir.
    //Örneğin, ScrollController'ın varsayılan yapıcı parametrelerini değiştirmek isteyebilirsiniz veya başlatma sırasında initialScrollOffset veya
    //keepScrollOffset gibi özel başlangıç değerleri belirlemek isteyebilirsiniz. Bu gibi durumlarda initState() yöntemi içinde ScrollController'ı
    //başlatarak daha fazla esneklik kazanabilirsiniz.
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.offset <= 0) {
        _isHeaderClose = false;
      } else if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        _isHeaderClose = true;
      } else {
        _isHeaderClose = scrollController.offset > lastOffset ? true : false;
      }

      setState(() {
        lastOffset = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: _FAButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _bottomAppBar,
        body: Column(
          children: <Widget>[
            _containerAppbar,
            Expanded(
                child: TabBarView(
              // her barın içeriğini doldurur.
              children: <Widget>[
                HomeView(scrollController),
                SearchView(scrollController),
                Text("data"),
                Text("data")
              ],
            )),
            _tabbarItems,
          ],
        ),
      ),
    );
  }

  Widget get _FAButton => FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.adb),
      );

  Widget get _bottomAppBar => BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: _tabbarItems,
      );

  Widget get _containerAppbar => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _isHeaderClose ? 0 : 50,
        child: _appBar,
      );

  Widget get _appBar => AppBar(
        elevation: 0,
        centerTitle: false,
        title: _appBarItems,
      );

  Widget get _appBarItems => Row(children: [
        CircleAvatar(backgroundImage: AssetImage(profileImage)),
        _emptyWidth,
        Expanded(child: _centerAppBarWidget),
        _emptyWidth,
        Icon(
          Icons.settings,
          color: Colors.blue,
        )
      ]);

  Widget get _emptyWidth => SizedBox(width: 20);

  Widget get _centerAppBarWidget => currentIndex == 1
      ? _searchTextField
      : Text(
          "Home",
          style: titleTextStyle,
        );

  Widget get _searchTextField => TextField(
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            hintText: "Search Twitter",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            filled: true,
            focusedBorder: outlineInputBorder,
            border: outlineInputBorder),
      );

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(25));

  Widget get _tabbarItems => TabBar(
          isScrollable: false,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.dashboard),
            ),
            Tab(
              icon: Icon(Icons.dashboard),
            ),
            Tab(
              icon: Icon(Icons.dashboard),
            ),
            Tab(
              icon: Icon(Icons.dashboard),
            )
          ]);
}

final titleTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Colors.black);
