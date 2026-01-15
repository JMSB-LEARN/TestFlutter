/*
Author: Jose Marques Sanchez-Bote
Date: January 2026
Description: A Flutter application that demonstrates a counter of pineapples with increment, decrement, multiply, and divide functionalities using floating action buttons arranged based on device orientation.
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 36, 221, 7),
        ),
        useMaterial3: true,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color.fromARGB(255, 36, 221, 7),
        ),
      ),

      home: const MyHomePage(title: 'Flutter Demo Alterada'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(int quantity) {
    if (quantity < 0) {
      return;
    }
    setState(() {
      _counter += quantity;
    });
  }

  void _decrementCounter(int quantity) {
    if (quantity < 0) {
      return;
    }
    setState(() {
      _counter -= quantity;
    });
  }

  //¿Deberia usar este metodo?
  void _multiplyCounter(int quantity) {
    if (_counter != 0) {
      setState(() {
        _counter *= quantity;
      });
    }
  }

  //¿O este metodo?
  void _divideCounter(int quantity) {
    if (quantity < 0) {
      return;
    }
    if (_counter < 0) {
      if ((_counter / quantity).ceil() == 0) {
        return;
      }
      setState(() {
        _counter = (_counter / quantity).ceil();
      });
    } else {
      if ((_counter / quantity).floor() == 0) {
        return;
      }
      setState(() {
        _counter = (_counter / quantity).floor();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Number of Pineapples:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: LayoutBuilder(
        builder: (context, constraints) {
          bool isPortrait = constraints.maxWidth < constraints.maxHeight;

          List<Widget> actionButtons = [
            FloatingActionButton(
              onPressed: () => _incrementCounter(1),
              tooltip: 'Increment 1',
              child: const Icon(Icons.exposure_plus_1),
            ),
            FloatingActionButton(
              onPressed: () => _incrementCounter(2),
              tooltip: 'Increment 2',
              child: const Icon(Icons.exposure_plus_2),
            ),
            FloatingActionButton(
              onPressed: () => _decrementCounter(1),
              tooltip: 'Decrement 1',
              child: const Icon(Icons.exposure_minus_1),
            ),
            FloatingActionButton(
              onPressed: () => _decrementCounter(2),
              tooltip: 'Decrement 2',
              child: const Icon(Icons.exposure_minus_2),
            ),
            FloatingActionButton(
              onPressed: () => _multiplyCounter(2),
              tooltip: 'Multiply 2',
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.close, semanticLabel: 'Multiply icon'),
                  Icon(Icons.looks_two),
                ],
              ),
            ),
            FloatingActionButton(
              onPressed: () => _multiplyCounter(3),
              tooltip: 'Multiply 3',
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.close, semanticLabel: 'Multiply icon'),
                  Icon(Icons.looks_3),
                ],
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () => _divideCounter(2),
              label: const Text("÷ 2"),
            ),
            FloatingActionButton.extended(
              onPressed: () => _divideCounter(10),
              label: const Text("÷ 10"),
            ),
            FloatingActionButton.extended(
              onPressed: () => _multiplyCounter(-1),
              label: const Text("∓"),
            ),
          ];

          if (isPortrait) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: actionButtons
                  .map(
                    (btn) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: btn,
                    ),
                  )
                  .toList(),
            );
          } else {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: actionButtons
                  .map(
                    (btn) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: btn,
                    ),
                  )
                  .toList(),
            );
          }
        }, // Closing builder
      ), // Closing LayoutBuilder and property
    ); // Closing Scaffold
  } // Closing build method
} // Closing _MyHomePageState class

// Madre que largo se me hizo esto
