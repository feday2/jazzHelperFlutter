import '../models/dropdown_item.dart'; // Імпортуємо визначення DropdownItem
import 'package:flutter/material.dart';

class DropdownButtonCustom extends StatefulWidget {
  final List<DropdownItem> items; // Поле для зберігання списку
  final Function(DropdownItem) onChanged; // Колбек для передачі обраного значення

  const DropdownButtonCustom({
    super.key,
    required this.items,
    required this.onChanged,
  });

  @override
  State<DropdownButtonCustom> createState() => _DropdownButtonCustomState();
}

class _DropdownButtonCustomState extends State<DropdownButtonCustom> {

  late DropdownItem dropdownValue;

  @override
  void initState() {
    super.initState();
    // Ініціалізуємо значення випадаючого меню першим елементом зі списку
    dropdownValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<DropdownItem>(
      itemHeight: 60,
      value: dropdownValue,
      icon: SizedBox.shrink(),
      alignment: Alignment.center,
      underline: Container(
        height: 2,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      dropdownColor: Colors.grey, // Встановлюємо сірий фон
      onChanged: (DropdownItem? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
        widget.onChanged(dropdownValue); // Передаємо обране значення батьківському віджету
      },
      items: widget.items.map<DropdownMenuItem<DropdownItem>>((DropdownItem item) {
        return DropdownMenuItem<DropdownItem>(
          value: item,
          child: Text(
            item.name,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 38,), // Колір тексту випадаючого списку,
           ), 
        );
      }).toList(),
    );
  }
}
