import 'package:ficha_3det/app/dice_screen.dart';
import 'package:ficha_3det/app/ficha_screen.dart';
import 'package:ficha_3det/app/raca_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Ficha3det());
}

class Ficha3det extends StatefulWidget {
  const Ficha3det({super.key});

  @override
  State<Ficha3det> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Ficha3det> {
  int indiceAtual = 0;

  List<Widget> body = const [
    Icon(Icons.list),
    Icon(Icons.book),
    Icon(Icons.gamepad),
  ];
  late PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (indice) {
              setState(
                () {
                  indiceAtual = indice;
                },
              );
            },
            children: [
              Container(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: Colors.indigo,
                  ),
                  home: const FichasTela(),
                ),
              ),
              Container(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: Colors.indigo,
                  ),
                  home: const ClassesTela(),
                ),
              ),
              Container(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: Colors.indigo,
                  ),
                  home: const DadoTela(),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indiceAtual,
          onTap: (indice) {
            setState(() {
              _pageController.jumpToPage(indice);
            });
          },
          items: const [
            BottomNavigationBarItem(label: 'Fichas', icon: Icon(Icons.list)),
            BottomNavigationBarItem(label: 'Classes', icon: Icon(Icons.book)),
            BottomNavigationBarItem(label: 'Dado', icon: Icon(Icons.gamepad)),
          ],
        ),
      ),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
