import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  List<Widget> a = [];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: ListView(
                children: [Draggable<List<Widget>>(
                  data: [SizedBox(
                      width: 100,
                      child: Card(
                        color: Theme.of(context).colorScheme.primary,
                        child: Center(
                          child: Text('test',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )
                        ),
                      ),
                    ),
                    DragTarget<List<Widget>>(
                      builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                      ) {
                        return SizedBox(
                          width: 50,
                          child: Card(color: accepted.isNotEmpty ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary),
                        );
                      },
                      onAcceptWithDetails: (details) {
                        setState(() {
                          a.addAll(details.data);
                        });
                      },
                    ),
                  ],
                  feedback: SizedBox(
                    height: 100,
                    width: 100,
                    child: Card(
                      color: Theme.of(context).colorScheme.primary,
                      child: Center(
                        child: Text('drag',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Card(
                      color: Theme.of(context).colorScheme.primary,
                      child: Center(
                        child: Text('drag',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),]
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: DragTarget<List<Widget>>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: a.length,
                    itemBuilder: (context, index) {
                      return a[index];
                    },
                  ),
                );
              },
              onAcceptWithDetails: (details) {
                setState(() {
                  a.addAll(details.data);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
