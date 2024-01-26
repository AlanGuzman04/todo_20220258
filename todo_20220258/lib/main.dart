import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 4, 4)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> mistareas = [];

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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("To Do List"),
      ),
      body: Column(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Mis Tareas:"),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: mistareas.length,
              itemBuilder: (context, index) {
                return Tareaconcheck(
                  text: mistareas[index],
                  onCheckboxChanged: (value) {
                    setState(() {
                      
                      mistareas[index] = mistareas[index]; 
                      
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          muestrapaagregar();
        },
        tooltip: 'Agregar tarea',
        child: const Icon(Icons.add),
      ),
    );
  }

  void muestrapaagregar() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController inputcontrola = TextEditingController();

        return AlertDialog(
          title: const Text('Agregar tarea'),

          content: TextField(
            controller: inputcontrola,
            
          ),
          actions: [


            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),



            TextButton(
              onPressed: () {
                setState(() {
                  mistareas.add(inputcontrola.text);
                });
                Navigator.pop(context);
              },
              child: const Text('Agregar'),
            ),


          ],
        );


      },
    );
  }



}

class Tareaconcheck extends StatefulWidget {
  final String text;
  final ValueChanged<bool?> onCheckboxChanged;

  const Tareaconcheck({
    Key? key,
    required this.text,
    required this.onCheckboxChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  TareaconcheckState createState() => TareaconcheckState();
}

class TareaconcheckState extends State<Tareaconcheck> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(


      title: Text(
        widget.text,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      
      leading: Checkbox(
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
          widget.onCheckboxChanged(value);
        },
      ),

      
    );
  }
}
