import 'package:flutter/material.dart';
import 'package:flutter_free/mvp/ibasepresenter.dart';

import 'ibasestate.dart';
import 'ibaseview.dart';
import 'ipresenter.dart';

class MainModel {
  MainModel({this.counter = 0});

  int counter;
}

class DemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoPageState();
  }

}

class IDemoPresenter implements IPresenter {
  void incrementButtonClick(){

  }
}

abstract class IDemoView implements IBaseView {
  void printTodo();
}

class DemoPresenter extends BasePresenter<MainModel,IDemoView> implements IDemoPresenter{

  DemoPresenter(IBaseView view, MainModel viewModel) : super(view, viewModel);

  @override
  void incrementButtonClick() {
    viewModel.counter++;
    updateState(viewModel);
    mView?.printTodo();
  }

}

class DemoPageState extends IBaseState<DemoPage,MainModel> implements IDemoView{

  DemoPresenter _presenter;

  DemoPageState() {
    viewModel = MainModel();
    _presenter = DemoPresenter(this, viewModel);
  }

  @override
  void initState() {
    super.initState();
    _presenter?.subscribe(applyState);
  }

  @override
  void dispose() {
    super.dispose();
    _presenter?.unSubscribe();
  }

  @override
  void printTodo() {
    print("-> printTodo");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new mvp"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "${viewModel.counter}",
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _presenter.incrementButtonClick();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}
