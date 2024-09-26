import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/notes_scales.dart';
import 'models/dropdown_item.dart';
import 'components/dropdown_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Jazz helper',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            bodyMedium: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  late DropdownItem selectedScale; // Для першого випадаючого списку
  late DropdownItem selectedNote;  // Для другого випадаючого списку

@override
  void initState() {
    super.initState();
    // Ініціалізуємо вибрані значення
    selectedScale = scales.first;
    selectedNote = notes.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(''),
          Text(''),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Вирівнювання по центру
            children: [
              DropdownButtonCustom( // Перший випадаючий список
                items: scales,
                onChanged: (DropdownItem value) {
                  setState(() {
                    selectedScale = value;
                  });
                },
              ), 
              SizedBox(width: 20), // Додаємо відступ між списками
              DropdownButtonCustom( // Другий випадаючий список
                items: notes,
                onChanged: (DropdownItem value) {
                  setState(() {
                    selectedNote = value;
                  });
                },
              ), 
            ],
          ),
          ElevatedButton(
            onPressed: () {
              print('Selected Scale ID: ${selectedScale.id}');
              print('Selected Note ID: ${selectedNote.id}');
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
