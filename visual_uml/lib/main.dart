import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visual UML',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Visual UML'),
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
  List<Widget> a = [
      Container(
        height: 200,
        child: Text('test'),
      ),
    ];

  void _d() {
    setState(() {
      a.add(Container(
              height: 200,
              child: Text('test'),
            ),
      );
    });
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
          children: [
            TextButton(
              onPressed: () {
                _d();
              },
              child: Text('Press here to add item')
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OverflowBar(
                
                children: a,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
