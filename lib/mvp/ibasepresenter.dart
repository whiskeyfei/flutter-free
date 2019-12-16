import 'package:flutter_free/mvp/ibaseview.dart';

import 'ipresenter.dart';

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
