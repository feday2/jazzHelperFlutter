import '../models/dropdown_item.dart';
import '../data/notes_scales.dart';
// отримання нот, на вхід тип приходить ід ладу та номер ноти-тоніки ладу

class ScaleInfo {
  final String chord;
  final String notes;
  final String extra;

  ScaleInfo({required this.chord, required this.notes, required this.extra});
}

ScaleInfo createScaleInfo(DropdownItem scale, DropdownItem mainNote) {
  // Ви можете задати значення для поля 'extra' відповідно до вашої логіки
  String extra = "You select scale id = ${scale.id} and main note id = ${mainNote.id}" ; // Приклад
  return ScaleInfo(
    chord: mainNote.name,
    notes: getNotesFromScale(scale, mainNote),
    extra: extra,
  );
}

getNotesFromScale(DropdownItem scale, DropdownItem mainNote) {
  var selectedNotes = scale.steps.map((index) => notes[(index - 2 + int.parse(mainNote.id))%12].name).join(', ');
  return selectedNotes;
}