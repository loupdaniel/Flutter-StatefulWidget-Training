import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

/*
// the state of the stateful widget is the one that holds the data and the ui of the widget
class _AppState extends State<App> {
  List<int> numbers = [];

  int counter = 0;

  void onClickedPlus() {
    setState(() {
      numbers
          .add(numbers.length); // length == The number of objects in this list
    }); //setState function is a function that we use to notify our state class that the data has changed
  }

  void onClickedMinus() {
    setState(() {
      numbers.remove(numbers.length - 1);
    }); //setState function is a function that we use to notify our state class that the data has changed
  }

/*
  void onClickedMinus() {
    setState(() {
      numbers.removeLast();
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(
            0xFFF4EDDB), //Color.fromRGBO => red, green, blue, opacity
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(fontSize: 30),
              ),
              for (var n in numbers) Text('$n'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 40,
                    onPressed: onClickedPlus,
                    icon: const Icon(Icons.add_box_rounded),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: onClickedMinus,
                    icon: const Icon(Icons.remove_circle_outline_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

//#4.3 BuildContext (10:18) & #4.4 Widget Lifecylce (07:18)
class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    // build makes the UI that your widget outputs
    // the BuildContext gives you the location of your widget in the widget tree
    // the context contains information about the widget tree and it's very useful because it alows us to get data from a very far away father
    return MaterialApp(
      theme: ThemeData(
        // Default visual properties, like colors fonts and shapes, for this app's material widgets.
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // It's used to initialize our state
    // TODO: implement initState
    super.initState();
    print('hello!');
  } // when sometimes your widget needs to initialize some data that depends on the parents, you will use the initState
  // initState method is always called(ran) before the build method and it's always called once

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose!');
  } // dispose method is a method that gets called when the widget is being removed from the screen
  //dispose method is where we are going to cancel things we want to cancel things before our widget is removed from the widget tree

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
