import 'package:async_redux/async_redux.dart';
import 'package:async_redux_demo/common/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class HomeViewModel extends BaseModel<HomeState> {
  HomeViewModel();

  bool loading;
  Function getDataAction;
  Response response;

  HomeViewModel.build({
    @required this.loading,
    @required this.getDataAction,
    @required this.response,
  }) : super(equals: [loading]);

  @override
  HomeViewModel fromStore() => HomeViewModel.build(
      loading: state.loading,
      getDataAction: () {
        dispatch(GetDataAction());
      },
      response: state.response);
}

class GetDataAction extends ReduxAction<HomeState> {
  @override
  Future<HomeState> reduce() async {
    var url = Api.URL;
    Response response = await Dio().get(url);
    return state.copy(response: response);
  }

  void before() => dispatch(LoadingAction(true));

  void after() => dispatch(LoadingAction(false));
}

class LoadingAction extends ReduxAction<HomeState> {
  final bool loading;

  LoadingAction(this.loading);

  @override
  HomeState reduce() => state.copy(waiting: loading);
}
