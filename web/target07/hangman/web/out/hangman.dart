// Auto-generated from hangman.html.
// DO NOT EDIT.

library hangman_html;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'package:web_ui/web_ui.dart';


// Original code


String answer = 'ambidextrous';

List<String> characters   = answer.split("");
List<String> hyphens      = toObservable(answer.replaceAll(new RegExp('.'), '-').split(""));
List<String> wrongletters = toObservable(new List());
List<List> hangmandisplay;

final __changes = new __observe.Observable();

String __$guessedletter = '';
String get guessedletter {
  if (__observe.observeReads) {
    __observe.notifyRead(__changes, __observe.ChangeRecord.FIELD, 'guessedletter');
  }
  return __$guessedletter;
}
set guessedletter(String value) {
  if (__observe.hasObservers(__changes)) {
    __observe.notifyChange(__changes, __observe.ChangeRecord.FIELD, 'guessedletter',
        __$guessedletter, value);
  }
  __$guessedletter = value;
}
bool __$dead = false;
bool get dead {
  if (__observe.observeReads) {
    __observe.notifyRead(__changes, __observe.ChangeRecord.FIELD, 'dead');
  }
  return __$dead;
}
set dead(bool value) {
  if (__observe.hasObservers(__changes)) {
    __observe.notifyChange(__changes, __observe.ChangeRecord.FIELD, 'dead',
        __$dead, value);
  }
  __$dead = value;
}
bool __$won = false;
bool get won {
  if (__observe.observeReads) {
    __observe.notifyRead(__changes, __observe.ChangeRecord.FIELD, 'won');
  }
  return __$won;
}
set won(bool value) {
  if (__observe.hasObservers(__changes)) {
    __observe.notifyChange(__changes, __observe.ChangeRecord.FIELD, 'won',
        __$won, value);
  }
  __$won = value;
}

void main() {
  setUpHangmanGrid();
}

void checkit() {
  const int maxwrong = 7;
  if (characters.contains(guessedletter)) {  // guess is correct
    revealletters();
    if (!hyphens.contains('-')) {
      won = true;
    }
  } else {                                   // guess is wrong
    revealnewbodypart();                                  
    wrongletters.add(guessedletter);
    if (wrongletters.length == maxwrong) {
      dead = true;
    }
  }
  guessedletter = '';
}

void revealletters() {
  for (int i = 0; i < characters.length; i++) {
    if (characters[i] == guessedletter) {
      hyphens[i] = guessedletter;
    }
  }
}

void revealnewbodypart() {
  // triplets: row, col, character for body part
  var deadmanparts = [ [1,4,'0'],   /* head */
                       [2,3,'\/'],  /* left arm */
                       [2,4,'\|'],  /* upper body */
                       [2,5, '\\'], /* right arm */
                       [3,4, '\|'], /* lower body */
                       [4,3, '\/'], /* left leg */
                       [4,5,'\\']   /* right leg */
                     ];

  var row = deadmanparts[wrongletters.length][0];
  var col = deadmanparts[wrongletters.length][1];
  hangmandisplay[row][col] = deadmanparts[wrongletters.length][2];
}

void setUpHangmanGrid() {
  var gallows = [ '+---+  ',
                  '\|      ',
                  '\|      ',
                  '\|      ',
                  '\|      ' ];
  hangmandisplay = new List(gallows.length);
  
  for (int i = 0; i < gallows.length; i++) {
    List<String> row = gallows[i].split("");
    hangmandisplay[i] = toObservable(row);
  }
}

// Additional generated code
void init_autogenerated() {
  var __root = autogenerated.document.body;
  final __html0 = new autogenerated.TableRowElement(), __html1 = new autogenerated.Element.tag('td'), __html2 = new autogenerated.InputElement(), __html3 = new autogenerated.Element.html('<p>\n            <template></template>\n          </p>'), __html4 = new autogenerated.Element.html('<p id="wrong">\n            <template></template>\n          </p>');
  var __e12, __e13, __e14, __e3, __e5;
  var __t = new autogenerated.Template(__root);
  __e3 = __root.nodes[3].nodes[1].nodes[1];
  __t.loopIterateAttr(__e3, () => hangmandisplay, ($list, $index, __t) {
    var row = $list[$index];
    var __e2;
    __e2 = __html0.clone(true);
    __t.loopIterateAttr(__e2, () => row, ($list, $index, __t) {
      var cell = $list[$index];
      var __e1;
      __e1 = __html1.clone(true);
      var __binding0 = __t.contentBind(() => cell, false);
      __e1.nodes.add(__binding0);
    __t.addAll([new autogenerated.Text('\n            '),
        __e1,
        new autogenerated.Text('\n          ')]);
    });
  __t.addAll([new autogenerated.Text('\n          '),
      __e2,
      new autogenerated.Text('\n        ')]);
  });
  __e5 = __root.nodes[5].nodes[1];
  __t.loop(__e5, () => hyphens, ($list, $index, __t) {
    var character = $list[$index];
    var __binding4 = __t.contentBind(() => character, false);
  __t.addAll([new autogenerated.Text(' '),
      __binding4,
      new autogenerated.Text(' ')]);
  });
  __e12 = __root.nodes[7].nodes[1];
  __t.conditional(__e12, () => !dead && !won, (__t) {
    var __e10, __e11, __e6, __e7, __e8;
    __e6 = __html2.clone(true);
    __t.listen(__e6.onInput, ($event) { guessedletter = __e6.value; });
    __t.listen(__e6.onKeyUp, ($event) { $event = new autogenerated.KeyEvent($event); checkit(); });
    __t.oneWayBind(() => guessedletter, (e) { if (__e6.value != e) __e6.value = e; }, false, false);
    __e8 = __html3.clone(true);
    __e7 = __e8.nodes[1];
    __t.conditional(__e7, () => wrongletters.length != 0, (__t) {
    __t.add(new autogenerated.Text(' Sorry! The word contains no: '));
    });

    __e11 = __html4.clone(true);
    __e10 = __e11.nodes[1];
    __t.loop(__e10, () => wrongletters, ($list, $index, __t) {
      var wrongchar = $list[$index];
      var __binding9 = __t.contentBind(() => wrongchar, false);
    __t.addAll([new autogenerated.Text(' '),
        __binding9,
        new autogenerated.Text(' ')]);
    });
  __t.addAll([new autogenerated.Text('\n          Guess a letter...\n          '),
      __e6,
      new autogenerated.Text('\n          '),
      __e8,
      new autogenerated.Text('\n          '),
      __e11,
      new autogenerated.Text('\n        ')]);
  });

  __e13 = __root.nodes[7].nodes[3];
  __t.conditional(__e13, () => dead, (__t) {
  __t.add(new autogenerated.Text(' You\'re dead! '));
  });

  __e14 = __root.nodes[7].nodes[5];
  __t.conditional(__e14, () => won, (__t) {
  __t.add(new autogenerated.Text(' You Win! '));
  });

  __t.create();
  __t.insert();
}

//# sourceMappingURL=hangman.dart.map