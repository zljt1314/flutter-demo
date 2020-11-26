import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'modules/home/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BotToastInit(child: MaterialApp(
      title: 'Flutter Notes Test',
      debugShowCheckedModeBanner: false,
      // 注册路由观察者
      navigatorObservers: [BotToastNavigatorObserver()],
      home: HomePage(),
    ));
  }
}


