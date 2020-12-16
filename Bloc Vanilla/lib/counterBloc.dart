import 'dart:async';

import 'package:bloc_vanilla/counterEvents.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvents>();
  Sink<CounterEvents> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvents counterEvents) {
    if(counterEvents is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }

    _inCounter.add(_counter);
  }

  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }
}