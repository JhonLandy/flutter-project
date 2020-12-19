import 'package:flutter/material.dart';
import 'SecondScreen.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('我的'),
      ),
      body: Center(
          child: new Column(
        children: <Widget>[
          RaisedButton(
              child: Text('静态路由跳转'),
              onPressed: () {
                Navigator.of(context).pushNamed('/second').then((value) {
                  print(value);
                });
              }),
          RaisedButton(
              child: Text('动态路由跳转'),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SecondScreen(
                              content: '自定义数据',
                            )));
              }),
          RaisedButton(
              child: Text('自定义动画'),
              onPressed: () {
                Navigator.push(
                    context,
                    new PageRouteBuilder(pageBuilder: (context, _, __) {
                      return SecondScreen(
                        content: '自定义动画',
                      );
                    }, transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return new FadeTransition(
                        opacity: animation,
                        child: new SlideTransition(
                            position: new Tween<Offset>(
                                    begin: Offset(0, 1), end: Offset.zero)
                                .animate(animation),
                            child: child),
                      );
                    }));
              }),
        ],
      )),
    );
  }
}
