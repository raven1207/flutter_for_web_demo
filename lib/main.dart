import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:acg_ui_flutter/acg_ui_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page13331'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  bool isShow=false;
  TabController _tabController;
  List tabs = ['首页', '详情页', '个人'];
  List tabsView = [
    'Content of first tab',
    'Content of two tab',
    'Content of three tab'
  ];
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //   appBar: ACGAppBar(
      //     decoration1: BoxDecoration(
      //         gradient: LinearGradient(
      //       colors: [
      //         Color(0xFF00E5FA),
      //         Color(0xFF0848FF),
      //         Color(0xFFA600EF),
      //         Color(0xFFEC6AB8),
      //       ],
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //     )),
      //     decoration2: BoxDecoration(
      //         gradient: LinearGradient(
      //       colors: [
      //         Color(0xFFA600EF),
      //         Color(0xFFEC6AB8),
      //       ],
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //     )),
      //     child: Container(
      //       padding: EdgeInsets.only(
      //         top: MediaQuery.of(context).padding.top,
      //       ),
      //       child: Center(
      //         child: Text('Demo测试', style: TextStyle(color: Colors.white)),
      //       ),
      //     ),
      //   ),
      body: Container(
        child: SafeArea(
          child: Container(
            color: Color(0xFF141723),
            // padding: EdgeInsets.only(left: 120, right: 120, bottom: 38),
            child: Column(
              children: [
                ACGAppBar(
                  decoration1: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Color(0xFF00E5FA),
                      Color(0xFF0848FF),
                      Color(0xFFA600EF),
                      Color(0xFFEC6AB8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                  decoration2: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Color(0xFFA600EF),
                      Color(0xFFEC6AB8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 40,
                    ),
                    child: Center(
                      child:
                          Text('Demo测试', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Expanded(child: _buildTabs()),
                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 0, right: 12, top: 10),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 18),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1, //宽度
                                color:
                                    Color(0xff505050).withOpacity(0.2), //边框颜色
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 36,
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    _buildLeftLine(),
                                    _buildTitle(),
                                  ],
                                ),
                              ),
                              _buildDescription(),
                              _buildVideoArea(),
                            ],
                          )),
                    );
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoArea() {
    return GestureDetector(
      onTap: () {
        this.setState(() {
          isShow = !isShow;
        });
      },
      child: Container(
          margin: EdgeInsets.only(top: 12),
          child: Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 12),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.network(
                          'https://gw.alicdn.com/imgextra/i3/O1CN01cHyQXq21xPKmAKOcg_!!6000000007051-2-tps-812-375.png',
                          fit: BoxFit.fill))),
            ],
          )),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3, left: 12, right: 6),
          child: SizedBox(
            width: 28,
            height: 12,
            child: Image.network(
                'https://gw.alicdn.com/imgextra/i2/O1CN01d4U3zA1bTvpUZdp78_!!6000000003467-2-tps-184-86.png',
                fit: BoxFit.fill),
          ),
        ),
        Expanded(
          child: Container(
            height: 36,
            padding: EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'PingFangSC-Semibold',
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 12),
      child: Text(
       isShow ?  "新的测试数据说明新的测试数据说明新的测试数据说明新的测试数据说明。。。":'新的测试数据12333',
        style: TextStyle(
            color: Colors.white54,
            fontSize: 12,
            fontFamily: 'PingFangSC-Regular'),
        maxLines: 100,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildLeftLine() {
    // final _isPlayed = widget.lastPlayed == 'true' || widget.hasPlayed == 'true';
    return Positioned(
        top: 10,
        bottom: 10,
        left: 0,
        child: Container(
          width: 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2.0),
                  bottomRight: Radius.circular(2.0)),
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 0.0),
                  blurRadius: 3,
                  // spreadRadius: 0,
                ),
              ]),
          child: null,
        ));
  }

  Widget _buildTabs() {
    return Container(
      child: ACGTabs(
          isScroll: false,
          physics: NeverScrollableScrollPhysics(),
          barLineColor: Colors.blue,
          appBarHeight: 38.0,
          tabController: _tabController,
          bg: Colors.blue,
          selectColor: Colors.red,
          labelStyle: TextStyle(
              fontFamily: 'PingFangSC-Semibold',
              fontSize: 18,
              color: Colors.blue),
          unSelectColor: Colors.blue,
          unselectedLabelStyle: TextStyle(
              fontFamily: 'PingFangSC-Semibold',
              fontSize: 15,
              color: Colors.yellow),
          tabs: tabs
              .map((item) => Container(
                    margin: EdgeInsets.only(top: 10),
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    height: 38,
                    child: Text(item),
                  ))
              .toList(),
          tabsView: tabsView.map((item) {
            var index = tabsView.indexOf(item);
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Image.network(
                  index == 0 || index == 2
                      ? 'https://gw.alicdn.com/imgextra/i4/O1CN01O6gjkA1INXalDgO2t_!!6000000000881-0-tps-1125-640.jpg'
                      : 'https://gw.alicdn.com/imgextra/i3/O1CN01cHyQXq21xPKmAKOcg_!!6000000007051-2-tps-812-375.png',
                  fit: BoxFit.cover,
                ));
          }).toList()),
    );
  }
}
