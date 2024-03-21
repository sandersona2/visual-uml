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

class ItemSource extends StatelessWidget {
  const ItemSource();

  @override
  Widget build(BuildContext context) {
    return Center(

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

  void _d() {
    setState(() {
      a.addAll([SizedBox(
              height: 200,
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
                  height: 200,
                  width: 50,
                  child: Card(color: accepted.isNotEmpty ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary),
                );
              },
              onAcceptWithDetails: (details) {
                setState(() {
                  a.addAll(details.data);
                });
              },
            ),]
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
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Draggable<List<Widget>>(
                data: [SizedBox(
                  height: 200,
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
                      height: 200,
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
            ),
            ElevatedButton(
              onPressed: () {
                _d();
              },
              child: Text('Press here to add item')
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: a.length,
                itemBuilder: (context, index) {
                  return a[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
