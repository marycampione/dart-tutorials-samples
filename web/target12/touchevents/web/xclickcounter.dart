import 'package:web_ui/web_ui.dart';
import 'dart:html';

class CounterComponent extends WebComponent {
  @observable
  int count = 0;

  void increment() {
    count++;
  }
  
  int _startTime;
  
  /// Listen for touch to start. Clicks will pass through.
  touchStart(TouchEvent event) {
    (event.currentTarget as Element).classes.add('touched');
    _startTime = event.timeStamp;
  }
  
  /// Listen for moves, which stop clicks.
  touchMove(TouchEvent event) {
    event.preventDefault();
  }
  
  /// After waiting for a longpress, send a mail of the document.
  touchEnd(TouchEvent event) {
    (event.currentTarget as Element).classes.remove('touched');
    if (event.timeStamp > _startTime + 700) {
      event.preventDefault();
      print('touch ended');
      increment();
    }
  }
  
  /// Simply stop the event wholesale.
  void touchCancel(TouchEvent event) {
    event.preventDefault();
  }
}
