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

class MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late DropdownItem selectedScale; // Для першого випадаючого списку
  late DropdownItem selectedNote;  // Для другого випадаючого списку
  ScaleInfo selectedScaleInfo = createScaleInfo(scales.first, allNotes.first);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 2 вкладки
    selectedScale = scales.first;
    selectedNote = allNotes.first;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
              controller: _tabController,
              labelColor: Colors.white, // Текст активної вкладки білий
              unselectedLabelColor: const Color.fromARGB(179, 255, 255, 255), // Текст неактивної вкладки трохи світліший
              indicatorColor: const Color.fromARGB(255, 26, 138, 182), // Лінія під активною вкладкою жовта
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
              tabs: [
                SizedBox(
                  height: 70.0, // Задайте висоту кнопки вкладки
                  child: Center(child: Text('SCALES')), // Центруємо текст
                ),
                SizedBox(
                  height: 70.0, // Задайте висоту кнопки вкладки
                  child: Center(child: Text('Tab 2')), // Центруємо текст
                ),
              ],
            ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Перша вкладка
                Column(
                  children: [
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Вирівнювання по центру
                      children: [
                        Container(
                          height: 70,
                          constraints: BoxConstraints(
                            minWidth: 100, // Задайте мінімальну ширину тут
                          ),
                          child: DropdownButtonCustom(// Перший випадаючий список
                            items: scales,
                            onChanged: (DropdownItem value) {
                              setState(() {
                                selectedScale = value;
                                selectedScaleInfo = createScaleInfo(selectedScale, selectedNote);
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 20), // Додаємо відступ між списками
                        Container(
                          height: 70,
                          constraints: BoxConstraints(
                            minWidth: 100, // Задайте мінімальну ширину тут
                          ),
                          child: DropdownButtonCustom( // Другий випадаючий список
                            items: allNotes,
                            onChanged: (DropdownItem value) {
                              setState(() {
                                selectedNote = value;
                                selectedScaleInfo = createScaleInfo(selectedScale, selectedNote);
                              });
                            },
                          ),
                        ), 
                      ],
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: MediaQuery.of(context).size.width - 20, // Встановлюємо ширину
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 26, 138, 182), // Колір контейнера
                        borderRadius: BorderRadius.circular(15), // Круглі краї
                      ),
                      padding: EdgeInsets.all(20), // Внутрішні відступи (padding) 20 пікселів з усіх боків
                      child: Column(
                        children: [
                          Text(
                            selectedScaleInfo.extra,
                            style: TextStyle(fontSize: 24), // Задайте потрібний розмір шрифту
                          ),
                          Text(
                            selectedScaleInfo.chord,
                            style: TextStyle(fontSize: 24), // Задайте потрібний розмір шрифту
                          ),
                          Text(
                            selectedScaleInfo.notes,
                            style: TextStyle(fontSize: 24), // Задайте потрібний розмір шрифту
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Друга вкладка
                Center(
                  child: Text('Another window in Tab 2'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
