import 'dart:developer';

import 'package:counter_bloc/counterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Counter App (BLOC)'),
          ),
          body: BlocProvider<CounterBloc>(
              create: (context) => CounterBloc(0), child: MyHomePage()),
        )
      );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    print(1);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CounterBloc, int>(builder: (context, int state) {
            return Text(
              "Counter Value : $state",
              style: TextStyle(
                fontSize: 20,
              ),
            );
          }),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  _counterBloc.add(CounterEvents.increment);
                },
                child: Text(
                  "Increment",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                onPressed: () {
                  _counterBloc.add(CounterEvents.decrement);
                },
                child: Text(
                  "Decrement",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
