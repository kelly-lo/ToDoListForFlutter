import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp
    (
      title: new Text("To-Do List"),
      subtitle: new Text("This is a to-do list"),
    )
  );
}

class MyApp extends StatefulWidget {
  MyApp({this.title, this.subtitle});
  final Widget title, subtitle;

  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {

  TextEditingController eCtrl = new TextEditingController();
  bool showDialog = false;

  // List of all the to-do items
  List<String> textList = [];
  // List of the boolean values for checkbox for each item
  List<bool> checkValue = [];
  // List of things that people removed/completed
  List<String> removedList = [];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          // Helps with bottom overflow
          resizeToAvoidBottomPadding: false,
          // Creates the title bar
          appBar: new AppBar(
            title: widget.title,
            backgroundColor: Colors.blueGrey,
            actions: <Widget>[
              // Button to add
              new IconButton(
                icon: new Icon(Icons.add_circle),
                onPressed: () {
                  setState(() {
                    showDialog = true;
                  });
                },
              ),
              new IconButton(
                icon: new Icon(Icons.delete),
                onPressed: () {
                  int counter = 0;
                  while ( counter < textList.length ) {
                    if ( checkValue[counter] == true ) {
                      removedList.add(textList[counter]);
                      checkValue.removeAt(counter);
                      textList.removeAt(counter);
                      counter = 0;
                    } else {
                      counter++;
                    }
                  }
                  setState(() { });
                },
              ),
              new PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  value: null;
                  child: Text("Return Removed");
                },
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: new Column(
            children: <Widget>[
              showDialog == true?
              new AlertDialog(
                title: new Text("Add to your To-Do list"),
                content: new TextField(
                  controller: eCtrl,
                  decoration: new InputDecoration.collapsed(hintText: "ADD"),
                  maxLines: 3,
                  onSubmitted: (String text) {

                  },
                ),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        setState(() {
                          showDialog = false;
                          eCtrl.clear();

                        });//Navigator.of(context).pop();
                      },
                      child: new Text("Cancel")),
                  new FlatButton(
                      onPressed: () {
                        setState(() {
                           showDialog = false;
                           //if ( (eCtrl.text == null ) ) {
                             textList.add(eCtrl.text);
                             checkValue.add(false);
                           //} else {
                             //textList.add(eCtrl.text);
                             //checkValue.add(false);
                           //}
                           //checkValue.add(false);
                           eCtrl.clear();
                        });
                      },
                      child: new Text("OK!")
                  )
                ],
                ) : new Text(""),

              new Flexible(
                  child: new ListView.builder(
                      itemCount: textList.length ,
                      itemBuilder: (BuildContext context, int index) {
                        return new Row(
                          children: <Widget>[
                            new Checkbox(
                                value: checkValue[index],
                                onChanged: (bool newValue) {
                                  checkValue[index] = newValue;
                                  setState(() {

                                  });
                                },
                            ),
                            new Text(textList[index]),
                          ],
                        );
                      })
              )
            ],
          )
      ),
    );
  }
}

// This implementation is from video 6.
//enum TestEnum { A }
//class MyAppState extends State<MyApp> {
//  int counter = 0;
//  bool checkValue = false;
//  String text = "";
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp (
//       home: new Scaffold(
//          appBar: new AppBar(
//            title: widget.title,
//            backgroundColor: Colors.green,
//            actions: <Widget>[
//              new IconButton(
//                  icon: new Icon(Icons.add_comment),
//                  onPressed: () {
//                    setState(() {
//                      text = "Add comment";
//                    });
//                  }
//              ),
//              new IconButton(
//                  icon: new Icon(Icons.remove),
//                  onPressed: () {
//                    setState(() {
//                      text = "Remove comment";
//                    });
//                  }
//              ),
//              new PopupMenuButton(
//                  itemBuilder: (BuildContext context) {
//                    return <PopupMenuEntry<TestEnum>>[
//                      new PopupMenuItem(
//                          child: new FlatButton(
//                              onPressed: () {
//                                 setState(() {
//                                   text =  "POPUP";
//                                 });
//                              },
//                              child: new Text("Button "))
//                      )
//                    ];
//                  }
//              )
//            ]
//          ),
//         body: new Column(
//           children: <Widget>[
//             widget.subtitle,
//             new Text("Text Value => $text"),
//           ],
//         )
//       )
//    );
//  }

// This set is from video 4.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp
//      (
//      home: new Scaffold
//        (
//        appBar: new AppBar( title: widget.title ),
//        body: new Column(
//          children: <Widget>[
//            widget.subtitle,
//            new FlatButton
//              (
//                onPressed: () {
//                  setState(() {
//                    counter++;
//                  });
//                },
//                child: new Text("A Button $counter"),
//            ),
//            new Checkbox
//              (
//                value: checkValue,
//                onChanged: (bool newVal) {
//                  setState(() {
//                    checkValue = newVal;
//                  });
//                }
//            )
//          ],
//        )
//      )
//    );
//  }
// }



//void main() {
//  runApp(new MyApp
//  (
//    title: new Text("wath"),
//    subtitle: new Text("SOHLFGLJDSFLJ"),
//  )
//  );
//}
//
//
//class MyApp extends StatelessWidget {
//
//  MyApp({this.title, this.subtitle});
//  final Widget title, subtitle;
//  int counter = 0;
//  bool chkValue = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp
//    (
//      home: new Scaffold
//      (
//        appBar: new AppBar
//        (
//          title: new Text("To-Do App")
//        ),
//        body: new Column
//        (
//          children: <Widget>[
//            new Text("Counter value => $counter"),
//            new FlatButton
//            (
//              onPressed: () { counter++; },
//              child: new Text("Abutton")
//            ),
//            new Checkbox
//            (
//              value: chkValue,
//              onChanged: (bool newValue) {
//                chkValue =  newValue;
//              }
//            )
//          ]
//        )
//      ),
//    );
//  }
//
//}
