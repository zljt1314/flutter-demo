import 'dart:math';

import 'package:flutter/material.dart';

/// [extension]关键字是在color类的基础上进行扩展
extension ColorUtils on Color {
  static Color random() {
    int limitA = 120;
    int limitR = 0;
    int limitG = 0;
    int limitB = 0;
    var random = Random();
    var a = limitA + random.nextInt(256 - limitA); //透明度值
    var r = limitR + random.nextInt(256 - limitR); //红值
    var g = limitG + random.nextInt(256 - limitG); //绿值
    var b = limitB + random.nextInt(256 - limitB); //蓝值
    return Color.fromARGB(a, r, g, b); //生成argb模式的颜色
  }

  // 生成随机颜色
  static Color getRandomColor() {
    var letters = '0123456789ABCDEF';
    var ret = 'FF';
    var rng = new Random(); //随机数生成类
    for (var i = 0; i < 6; i++) {
      ret += letters[rng.nextInt(letters.length - 1)];
    }
    return Color(int.parse(ret, radix: 16));
  }
}
