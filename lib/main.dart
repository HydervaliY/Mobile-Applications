import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          primary: Colors.teal.shade700,
          secondary: Colors.orange.shade600,
        ),
        useMaterial3: true,
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87),
          labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.teal,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  bool _isFirstImage = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleImage() {
    setState(() {
      _isFirstImage = !_isFirstImage;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
      _isFirstImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter & Image Toggle'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Counter Value: $_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text('Increment'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                _isFirstImage ? 'images/image.jpg' : 'images/image2.jpg',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleImage,
                child: Text('Toggle Image'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _reset,
                child: Text('Reset'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
