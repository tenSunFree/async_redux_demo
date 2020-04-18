import 'dart:convert';
import 'package:async_redux/async_redux.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class HomePageConnector extends StatelessWidget {
  HomePageConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<HomeState, HomeViewModel>(
      model: HomeViewModel(),
      builder: (BuildContext context, HomeViewModel viewModel) => HomePage(
          getDataAction: viewModel.getDataAction,
          loading: viewModel.loading,
          response: viewModel.response),
    );
  }
}

class HomePage extends StatefulWidget {
  final bool loading;
  final Function getDataAction;
  final Response response;

  HomePage({
    Key key,
    this.loading,
    this.getDataAction,
    this.response,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.getDataAction();
  }

  @override
  Widget build(BuildContext context) {
    Map map = json.decode(widget.response.toString());
    HomeModel homeModel = HomeModel.fromMap(map);
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 3.5),
            child: Column(
              children: <Widget>[
                buildTopBarImage(),
                buildListExpanded(homeModel),
                buildBottomBarImage(),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                buildTopBarImage(),
                Expanded(child: Container()),
                buildBottomBarImage(),
              ],
            ),
          ),
          buildLoadingWidget(),
        ],
      ),
    );
  }

  Image buildTopBarImage() {
    return Image(
      image: AssetImage("assets/icon_top_bar.png"),
      fit: BoxFit.fitWidth,
    );
  }

  Image buildBottomBarImage() {
    return Image(
      image: AssetImage("assets/icon_bottom_bar.png"),
      fit: BoxFit.fitWidth,
    );
  }

  Widget buildLoadingWidget() {
    return widget.loading
        ? Center(child: CircularProgressIndicator())
        : Container();
  }

  Expanded buildListExpanded(HomeModel homeModel) {
    return Expanded(
      child: GridView.builder(
        itemCount: isEmpty(homeModel) ? 0 : homeModel.result.results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 橫軸三個子widget
            childAspectRatio: 0.46 // 寬高比
            ),
        itemBuilder: (context, index) {
          return Container(
            color: Color(0xFF54545),
            margin: EdgeInsets.only(right: 3.5, bottom: 3.5),
            child: Column(
              children: <Widget>[
                buildListImageExpanded(homeModel, index),
                buildListTextExpanded(homeModel, index),
              ],
            ),
          );
        },
      ),
    );
  }

  Expanded buildListTextExpanded(HomeModel homeModel, int index) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '${homeModel.result.results[index].APic04ALT}',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, color: Color(0xFF000000)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 6.0),
              alignment: Alignment.centerLeft,
              child: Text(
                '${homeModel.result.results[index].ACode}',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 11, color: Color(0xFF969696)),
              ),
            ),
          ]),
      flex: 12,
    );
  }

  Expanded buildListImageExpanded(HomeModel homeModel, int index) {
    return Expanded(
      child: Image.network(homeModel.result.results[index].APic02URL,
          fit: BoxFit.cover),
      flex: 33,
    );
  }
}

PreferredSize buildAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(0.0),
    child: AppBar(),
  );
}

/// 檢查對象或List或Map是否為空
bool isEmpty(Object object) {
  if (object == null) return true;
  if (object is String && object.isEmpty) {
    return true;
  } else if (object is List && object.isEmpty) {
    return true;
  } else if (object is Map && object.isEmpty) {
    return true;
  }
  return false;
}
