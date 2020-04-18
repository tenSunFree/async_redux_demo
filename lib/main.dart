import 'dart:io';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home/home.dart';

Store<HomeState> store;

void main() {
  var state = HomeState.initialState();
  store = Store<HomeState>(initialState: state);
  runApp(App());
  initializeStatusBar();
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreProvider<HomeState>(
        store: store,
        child: MaterialApp(home: HomePageConnector()),
      );
}

/// 設置android狀態欄為透明的沉浸, 以及文字顏色變成黑色
/// 寫在組件渲染之後, 是為了在渲染後進行set賦值, 覆蓋狀態欄
/// 寫在渲染之前, MaterialApp組件會覆蓋掉這個值
void initializeStatusBar() {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Color(0xFFF4A7B9),
          statusBarBrightness: Brightness.light),
    );
  }
}
