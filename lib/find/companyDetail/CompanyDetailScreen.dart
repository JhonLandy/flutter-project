import 'package:flutter/material.dart';
import 'package:flutter_project/Application.dart';
import 'package:flutter_project/find/company.dart';
import 'package:flutter_project/find/companyDetail/DotsIndicator.dart';
import 'package:flutter_project/find/companyDetail/company_hot_job.dart';
import 'package:flutter_project/find/companyDetail/company_inc.dart';
import 'package:flutter_project/find/companyDetail/company_info.dart';

const double _kBannerHeight = 256.0;

class Detail extends StatefulWidget {
  final Company _company;

  Detail(this._company);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> with TickerProviderStateMixin {
  List<Widget> images = <Widget>[];

  List<String> urlList = [
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20170725/861159df793857d6cb984b52db4d4c9c.jpg',
    'https://img2.bosszhipin.com/mcs/chatphoto/20151215/a79ac724c2da2a66575dab35384d2d75532b24d64bc38c29402b4a6629fcefd6_s.jpg',
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180207/c15c2fc01c7407b98faf4002e682676b.jpg'
  ];

  List<Tab> _tabs;
  TabController _controller;
  VoidCallback onChanged;
  int tab_Index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    urlList.forEach((String url) {
      images.add(new Container(
        color: Colors.black,
        child: new ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: new Image.network(
            url,
            height: _kBannerHeight,
            fit: BoxFit.cover,
          ),
        ),
      ));
    });

    _tabs = [new Tab(text: '介绍'), new Tab(text: '职位')];
    _controller = new TabController(length: _tabs.length, vsync: this);
    onChanged = () {
      setState(() {
        tab_Index = _controller.index;
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: new Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              SizedBox.fromSize(
                size: Size.fromHeight(_kBannerHeight),
                child: IndicatorViewPager(pages: images),
              ),
              new Container(
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new CompanyInfo(widget._company),
                    new Divider(),
                    new TabBar(
                      tabs: _tabs,
                      controller: _controller,
                      labelColor: Colors.black,
                      labelStyle: new TextStyle(fontSize: 16.0),
                      indicatorWeight: 3.0,
                    )
                  ],
                ),
              ),
              IndexedStack(
                index: tab_Index,
                children: <Widget>[CompanyInc(), CompanyHotJob()],
              )
            ],
          ),
        ),
        new Positioned(
          top: Application.statusBarHeight,
          child: BackButton(color: Colors.white),
        )
      ],
    ));
  }
}
