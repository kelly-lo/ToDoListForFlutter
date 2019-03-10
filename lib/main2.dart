import 'package:flutter/material.dart';
//import 'package:path/path.dart';

//void main() {
//  runApp(new MyApp
//    (
//    title: new Text("To-Do List"),
//    subtitle: new Text("This is a to-do list"),
//  )
//  );
//}

void main() => runApp(MaterialApp(home: MyApp(
  title: new Text("To-Do List"),
  subtitle: new Text("This is a to-do list"),
  ),
));

class Constants {
  static const String Archive = "Deleted Tasks";
  static const String Clear = "Clear All";

  static const List<String> choices = <String>[
    Archive,
    //Clear
  ];
}

class MyApp extends StatefulWidget {
  MyApp({this.title, this.subtitle});
  final Widget title, subtitle;

  @override
  MyAppState createState() => new MyAppState();
}

//class MyAppState extends State<MyApp> {
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//        home: new CheckListWidget());
//  }
//}
//
//class CheckListWidget extends StatefulWidget {
//  @override
//  MyAppState createState() => new MyAppState();
//}

class MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  TextEditingController eCtrl = new TextEditingController();
  bool showDialog = false;

  static const String Archive = "Deleted Tasks";
  static const String Clear = "Clear All";

  static const List<String> choices = <String>[
    Archive,
    //Clear
  ];
  // List of all the to-do items
  List<String> textList = [];
  // List of the boolean values for checkbox for each item
  List<bool> checkValue = [];
  // List of things that people removed/completed
  List<String> removedList = [];

  @override
  Widget build(BuildContext context) {
    //return new MaterialApp(
      return new Scaffold(
        // Helps with bottom overflow
          resizeToAvoidBottomPadding: false,
          // Creates the title bar
          appBar: new AppBar(
            title: widget.title,
            backgroundColor: Colors.green,
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
//              new PopupMenuButton<String>(
//                onCanceled: () => print("Nothing was chosen"),
//                onSelected: choiceAction,
//                itemBuilder: (BuildContext context) {
//                  return choices.map((String choice) {
//                    return new PopupMenuItem(
//                      value: choice,
//                      child: Text(choice),
//                  );
//                  }).toList();
////                  return choices.map( (String choice) (
////                    return new PopupMenuItem<String>(
////                      value: choice,
////                      child: Text(choice),
////                    )
////                  )).toList();
//                },
//              ),
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
                      child: new Text("CANCEL")),
                  new FlatButton(
                      onPressed: () {
                        setState(() {
                          showDialog = false;
                          if ( (eCtrl.text.isNotEmpty ) ) {
                            textList.add(eCtrl.text);
                            checkValue.add(false);
                          }//} else {
                          //textList.add(eCtrl.text);
                          //checkValue.add(false);
                          //}
                          //checkValue.add(false);
                          //eCtrl.clear();
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
      );
    //);
  }
}