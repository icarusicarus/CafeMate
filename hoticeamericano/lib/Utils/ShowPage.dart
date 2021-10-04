import 'package:flutter/material.dart';

import '../Pages/MainPage.dart';
import '../Pages/GifticonPage.dart';
import '../Pages/MyPage.dart';

Widget? showPage(int i) {
  Widget? res;

  switch(i) {
    case 0: res = GifticonPage();  break;
    case 1: res = MainPage(); break;
    case 2: res = MyPage(); break;
  }
  
  return res;
}