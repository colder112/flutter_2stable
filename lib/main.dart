import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_2stable/MyFlexibleSpaceBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      showPerformanceOverlay: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List ll;

  void _incrementCounter() {
    ll?.add("a");
    setState(() {
      _counter++;
    });
  }

  // 需监听fps时注册
  void start() {
    SchedulerBinding?.instance?.addTimingsCallback(_onReportTimings);
  }

// 不需监听时移除
  void stop() {
    SchedulerBinding?.instance?.removeTimingsCallback(_onReportTimings);
  }

  /**
   * [FrameTiming(buildDuration: 3.118ms, rasterDuration: 6.889ms, vsyncOverhead: 17.252ms, totalSpan: 27.352ms),
   * FrameTiming(buildDuration: 5.4110000000000005ms, rasterDuration: 1.925ms, vsyncOverhead: 2.472ms, totalSpan: 9.903ms)]
   * 可以开启isolate去处理数据
   */
  void _onReportTimings(List<FrameTiming> timings) {
    // TODO
    print("timings===" + timings.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    start();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.hashCode;
      print("SchedulerBinding.instance.addPostFrameCallback ==== ${context.hashCode}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (cc, boolcc) {
          return [
            SliverAppBar(
              primary: true,
              // 预留状态栏

              forceElevated: false,
              //展开flexibleSpace之后是否显示阴影

              automaticallyImplyLeading: false,
              // 如果有 leading 这个不会管用 ,相当于忽略这个参数 ； 如果没有leading ，当有侧边栏的时候， false：不会显示默认的图片，true 会显示 默认图片，并响应打开侧边栏的事件

//            titleSpacing: NavigationToolbar.kMiddleSpacing,//flexibleSpace 和 title 的距离 默认是重合的

              expandedHeight: 100.0,
              //200.0, 可滚动视图的高度  伸缩区域大小

              snap: false,
              //与floating结合使用
              floating: false,
              //是否随着滑动隐藏标题,滑动到最上面，再snap滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏，为false是不隐藏
//            title: _title(),
              pinned: true,
              excludeHeaderSemantics: true,
              centerTitle: true,
              // title: Text("centerTitlecenterTitlecenterTitlecenterTitle"),
              //是否固定在顶部,往上滑，导航栏可以隐藏
              // leading: Icon(Icons.menu),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                  ), onPressed: () {  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                  ), onPressed: () {  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                  ), onPressed: () {  },
                ),
                ],
              /*bottom: new TabBar(
                  isScrollable: true,
                  tabs: ["123","22"].map((String choice) {
                    return new Tab(
                      text: choice,
                      icon: new Icon(Icons.more_horiz),
                    );
                  }).toList(),),*/
              flexibleSpace: MyFlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                //可以展开区域，通常是一个FlexibleSpaceBar
                // centerTitle: true,

                // titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                // title:Text("awdwadwadwadawdwaa123123wdwa"),
                title: Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.white,
                  child: TextField(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                    ),
                    decoration: InputDecoration(
                      hintText: "搜索"
                    ),
                  ),
                ),
                background: Container(
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemBuilder: (BuildContext cc, int position) {
            return Text("1");
          },
          itemCount: 500,
        ),
      ),
    );
  }
}
