import 'package:flutter/material.dart';
import 'package:mvp/mvp.dart';

class MainModel {
  MainModel({this.counter = 0});

  int counter;
}

class MainPresenter extends MvpPresenter<MainModel, MainScreenState> {

  @override
  void initializeViewModel() {
    viewModel = MainModel();
  }

  void incrementButtonClick() {
    viewModel.counter++;
    callback(viewModel);
  }

}

class MainScreen extends StatefulWidget {

  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends MvpScreen<MainScreen, MainModel> {

  final presenter = MainPresenter();

  @override
  void initializeViewModel() {
    viewModel = MainModel();
  }

  @override
  void initState() {
    super.initState();
    // Always remember to bind the presenter in initState().
    presenter.bind(applyState, this);
  }

  @override
  void dispose() {
    super.dispose();
    // And remember to release presenter binding in dispose().
    presenter.unbind();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mvp"),
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
          presenter.incrementButtonClick();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

