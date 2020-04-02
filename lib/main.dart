import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShaderMask Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("My App Title"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 30.0, top: 10.0),
          child: Column(
            children: [
              Container(
                height: 200.0,
                width: 200.0,

                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.red, Colors.blue],
                      tileMode: TileMode.repeated,
                    ).createShader(bounds);
                  },

                child: Image.asset('assets/images/tealogosm.png'),
                ),
              ),
              Container(
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return RadialGradient(
                      colors: [Colors.red, Colors.green],
                      tileMode: TileMode.mirror,
                    ).createShader(bounds);
                  },
                child: const Text(
                  'Flutter ShaderMask',
                  style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold),
                ),
              ),)
            ],
          ),
        ));
  }
}
