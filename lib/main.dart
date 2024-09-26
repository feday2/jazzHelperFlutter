import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/notes_scales.dart';
import 'models/dropdown_item.dart';
import 'components/dropdown_button.dart';
import 'components/scale_info.dart';

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
  MyHomePageState createState() => MyHomePageState();
}


class MyHomePageState extends State<MyHomePage> {
  late DropdownItem selectedScale; // Для першого випадаючого списку
  late DropdownItem selectedNote;  // Для другого випадаючого списку
  ScaleInfo selectedScaleInfo = createScaleInfo(scales.first, notes.first);

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
          SizedBox(height: 50),
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
              setState(() {
                 selectedScaleInfo = createScaleInfo(selectedScale, selectedNote); // Оновлюємо текст при натисканні кнопки
              });
              print('Selected Scale ID: ${selectedScale.id}');
              print('Selected Note ID: ${selectedNote.id}');
            },
            child: Text('Next'),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width - 20, // Встановлюємо ширину
            // height: 100, // Встановлюємо висоту
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 26, 138, 182), // Колір контейнера
                borderRadius: BorderRadius.circular(15), // Круглі краї
            ),
            padding: EdgeInsets.all(20), // Внутрішні відступи (padding) 20 пікселів з усіх боків
            child: Column(
              children: [
              Text(
                selectedScaleInfo.chord,// 'Сmaj7',
              ),
              Text(
                selectedScaleInfo.notes// 'C D E F G A H',
              ),
              Text(
                selectedScaleInfo.extra,
            ),],)
          ),
        ],
      ),
    );
  }
}






