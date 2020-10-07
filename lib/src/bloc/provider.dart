import 'package:flutter/material.dart';
import 'package:bold_app/src/bloc/login_bloc.dart';
export 'package:bold_app/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instancia;

  factory Provider() {
    if (_instancia == null) {
      _instancia = new Provider._internal();
    }
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}
