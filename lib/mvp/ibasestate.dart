import 'package:flutter/material.dart';

abstract class IBaseState<T extends StatefulWidget, V> extends State<T> {
  V viewModel;

  IBaseState() {
//    initViewModel();
  }

  void applyState(V viewModel) {
    setState(() {
      this.viewModel = viewModel;
    });
  }

//  void initViewModel();
}
