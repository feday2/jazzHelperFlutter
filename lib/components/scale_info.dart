import '../models/dropdown_item.dart';
import '../data/notes_scales.dart';
import '../data/chords.dart';
import '../models/chord.dart';

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
    chord: getMainChord(scale, mainNote),
    notes: getNotesOfScale(scale, mainNote),
    extra: extra,
  );
}

getNotesOfScale(DropdownItem scale, DropdownItem mainNote) {
  var selectedNotes = scale.steps.map((index) => notes[(index - 2 + int.parse(mainNote.id))%12].name).join(', ');
  return selectedNotes;
}

getMainChord(DropdownItem scale, DropdownItem mainNote) {

  List<int> chordSteps = [
    for (int i = 0; i < scale.steps.length; i++) 
      if (i % 2 == 0) scale.steps[i]
  ];

  print(chordSteps);

  var chordNotes = chordSteps.map((index) => notes[(index - 2 + int.parse(mainNote.id))%12].name).join(', ');

   String? foundChordName = chords
      .firstWhere(
        (chord) => chord.steps.toSet().difference(chordSteps.toSet()).isEmpty,
        orElse: () => Chord(name: 'Not found', steps: []), // Значення за замовчуванням
      )
      .name;

  return "${mainNote.name}$foundChordName ($chordNotes)";
  
}

