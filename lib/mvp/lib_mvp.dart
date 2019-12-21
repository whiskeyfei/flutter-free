import 'package:flutter/material.dart';

abstract class IBaseView {}

class IPresenter {}

abstract class BasePresenter<V, T extends IBaseView> implements IPresenter {
  T mView;
  V viewModel;
  Function updateState;

  BasePresenter(this.mView, this.viewModel);

  void subscribe(Function state) {
    this.updateState = state;
    this.updateState(viewModel);
  }

  void unSubscribe() {
    this.updateState = null;
    this.viewModel = null;
  }
}

abstract class IBaseState<T extends StatefulWidget, V, P extends BasePresenter> extends State<T> implements IBaseView {
  V viewModel;
  P presenter;

  IBaseState() {
    init();
    presenter = createPresenter();
    presenter.mView = this;
  }

  P createPresenter();

  void init();

  @override
  void initState() {
    super.initState();
    presenter?.subscribe(applyState);
  }

  @override
  void dispose() {
    super.dispose();
    presenter?.unSubscribe();
  }

  void applyState(V viewModel) {
    setState(() {
      this.viewModel = viewModel;
    });
  }
}
