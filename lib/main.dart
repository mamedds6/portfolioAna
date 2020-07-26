//flutter run -d chrome
//flutter build web

//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:full_screen_image/full_screen_image.dart';

void main() => runApp(MyApp());

//final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

enum Itemik { dupa, varza, scoala, ciorba }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Home Page'),
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
  Itemik _selection = Itemik.varza;
  //ScrollController _scrollController = ScrollController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  // void _scrollToSection2() {
  //   setState(() {
  //     _scrollController.animateTo(1111,
  //         duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);
  //   });
  // },

  // void _scrollToSection0() {
  //   setState(() {
  //     _scrollController.animateTo(0,
  //         duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: scaffoldKey,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        //controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 555.0,
            forceElevated: true,
            title: Text("Portfolio"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_alert),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  //scaffoldKey.currentState.showSnackBar(snackBar);
                },
              ),
              IconButton(
                icon: const Icon(Icons.plus_one),
                tooltip: '+1',
                onPressed: () {
                  _incrementCounter();
                },
              ),
              IconButton(
                icon: const Icon(Icons.exposure_zero),
                tooltip: '0',
                onPressed: () {
                  _resetCounter();
                  //_scrollToSection0();
                },
              ),
              IconButton(
                icon: const Icon(Icons.format_list_numbered),
                tooltip: 'Scroll to list view',
                onPressed: () {
                  //_scrollToSection2();
                },
              ),
              PopupMenuButton<Itemik>(
                icon: const Icon(Icons.line_weight),
                offset: Offset(100, 100),
                onSelected: (Itemik result) {
                  setState(() {
                    _selection = result;
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Itemik>>[
                  const PopupMenuItem<Itemik>(
                    value: Itemik.dupa,
                    child: Text('dupa'),
                  ),
                  const PopupMenuItem<Itemik>(
                    value: Itemik.varza,
                    child: Text('varza'),
                  ),
                  const PopupMenuItem<Itemik>(
                    value: Itemik.scoala,
                    child: Text('scoala'),
                  ),
                  const PopupMenuItem<Itemik>(
                    value: Itemik.ciorba,
                    child: Text('ciorba'),
                  ),
                ],
              ),
              Text("      "),
            ],
            flexibleSpace: FlexibleSpaceBar(
                //collapseMode: CollapseMode.parallax,
                title: Text('Ana Maria Mihai'),
                background: Image(
                  image: AssetImage("assets/img.jpg"),
                  fit: BoxFit.cover,
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 555,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Counter value:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(_selection.toString().substring(7)),
                  ],
                ),
              ),
            ),
          ),
          SliverSafeArea(
            //gridView
            bottom: true,
            top: true,
            left: true,
            right: true,
            minimum: EdgeInsets.all(100),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 30.0,
                crossAxisSpacing: 30.0,
                childAspectRatio: 0.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                      alignment: Alignment.center,
                      color: Colors.blue[100 * (index + 2 % 9)],
                      child: Text("Grid Item $index"));
                },
                childCount: 4,
              ),
            ),
          ),
          SliverToBoxAdapter(
              //empty77
              child: Container(
            height: 444,
            child: FullScreenWidget(
              child: Center(
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/img.jpg",
                      fit: BoxFit.contain,
                    ),
                    IconButton(
                      onPressed: () {},
                      color: Colors.deepOrange,
                      icon: Icon(Icons.arrow_left),
                      iconSize: 48.0,
                    ),
                  ],
                ),
              ),
            ),
          )),
          SliverSafeArea(
            //listView
            bottom: true,
            top: true,
            left: true,
            right: true,
            minimum: EdgeInsets.all(100),
            sliver: SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.blue[
                        100 + (100 * (index % 6))], //(50 * (index % 4))+ 50],
                    child: Text('List Item $index'),
                  );
                },
                childCount: 24,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: PopupMenuButton<Itemik>(
          icon: const Icon(Icons.blur_on),
          shape: CircleBorder(),
          //elevation: 55,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Itemik>>[
            const PopupMenuItem<Itemik>(
              value: Itemik.dupa,
              child: Center(child: Text('-:-')),
            ),
            PopupMenuItem<Itemik>(
              value: Itemik.varza,
              textStyle: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                // foreground: Paint()
                //   ..shader = ui.Gradient.linear(
                //     const Offset(0, 20),
                //     const Offset(150, 20),
                //     <Color>[
                //       Colors.red,
                //       Colors.yellow,
                //     ],
                //   )
              ),
              child: Center(child: Text('Ana-Maria Mihai')),
            ),
            const PopupMenuItem<Itemik>(
              value: Itemik.ciorba,
              child: Center(child: Text('-:-')),
            ),
          ],
        ),
      ),
    );
  }
}

/*

hiding address bar...

orientation change? on click? on device spin ofc

https://developers.google.com/web/fundamentals/native-hardware/fullscreen#chrome_for_android


!!!!!!!!!!!!!
https://web.dev/add-manifest/

!! //"minimal-ui", //"fullscreen", //"standalone", //"browser" 

fullscreen	Opens the web application without any browser UI and takes up the entirety of the available display area.
standalone	Opens the web app to look and feel like a standalone native app. The app runs in its own window, separate from the browser, and hides standard browser UI elements like the URL bar.

An example of a PWA window with standalone display.

minimal-ui	This mode is similar to standalone, but provides the user a minimal set of UI elements for controlling navigation (such as back and reload).
An example of a PWA window with minimal-ui display.

browser	A standard browser experience.



https://pub.dev/packages/flutter_inappwebview

*/
