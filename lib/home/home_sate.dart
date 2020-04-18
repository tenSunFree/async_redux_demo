import 'package:dio/dio.dart';

class HomeState {
  final bool loading;
  final Response response;

  HomeState({this.loading, this.response});

  HomeState copy({bool waiting, Response response}) {
    return HomeState(
      loading: waiting ?? this.loading,
      response: response ?? this.response,
    );
  }

  static HomeState initialState() => HomeState(loading: false, response: null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HomeState &&
              runtimeType == other.runtimeType &&
              response == other.response &&
              loading == other.loading;

  @override
  int get hashCode => response.hashCode ^ loading.hashCode;
}