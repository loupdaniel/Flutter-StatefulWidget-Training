import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

// the state of the stateful widget is the one that holds the data and the ui of the widget
class _AppState extends State<App> {
  List<int> numbers = [];

  int counter = 0;

  void onClickedPlus() {
    setState(() {
      numbers.add(numbers.length);
    }); //setState function is a function that we use to notify our state class that the data has changed
  }

  void onClickedMinus() {
    setState(() {
      numbers.remove(numbers.length);
    }); //setState function is a function that we use to notify our state class that the data has changed
  }

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
