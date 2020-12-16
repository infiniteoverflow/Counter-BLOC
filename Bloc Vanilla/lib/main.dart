import 'package:bloc_vanilla/counterBloc.dart';
import 'package:bloc_vanilla/counterEvents.dart';
import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    print('Entering Build');
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: _bloc.counter,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StreamBuilder<CounterBloc>(
            stream: null,
            builder: (context, snapshot) {
              return FloatingActionButton(
                onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
                tooltip: 'Increment',
                child: Icon(Icons.remove),
              );
            }
          ),

          SizedBox(width: 10,),

          FloatingActionButton(
            onPressed: ()=> _bloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
