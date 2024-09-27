import '../models/dropdown_item.dart'; // Імпортуємо визначення DropdownItem

// Список для scales
var scales = <DropdownItem>[
  DropdownItem(id: '1', name: 'Major', steps: [1,3,5,6,8,10,12]),
  DropdownItem(id: '2', name: 'Minor', steps: [1,3,4,6,8,9,11]),
  DropdownItem(id: '3', name: 'Lydian', steps: [1,3,5,7,8,10,12]),
  DropdownItem(id: '4', name: 'Mixolydian', steps: [1,3,5,6,8,10,11]),
  DropdownItem(id: '5', name: 'Dorian', steps: [1,3,4,6,8,10,11]),
  DropdownItem(id: '6', name: 'Phrygian', steps: [1,2,4,6,8,9,11]),
  DropdownItem(id: '7', name: 'Locrian', steps: [1,2,4,6,7,9,11]),

  DropdownItem(id: '8', name: 'Min Melodic', steps: [1,3,4,6,8,10,12]),
  DropdownItem(id: '9', name: 'Phryg-Dorian(?)', steps: [1,2,4,6,8,10,11]),
  DropdownItem(id: '10', name: 'Lydian #5', steps: [1,3,5,7,9,10,12]),
  DropdownItem(id: '11', name: 'Lydian b7', steps: [1,3,5,7,8,10,11]),
  DropdownItem(id: '12', name: 'Mixolydian b6', steps: [1,3,4,6,8,9,11]),
  DropdownItem(id: '13', name: 'Locrian n2', steps: [1,3,4,6,7,9,11]),
  DropdownItem(id: '14', name: 'Alter', steps: [1,2,4,5,7,9,11]),
  DropdownItem(id: '15', name: 'poluton-ton', steps: [1,2,4,5,7,8,10,11]),
  DropdownItem(id: '16', name: 'ton-poluton', steps: [1,3,4,6,7,9,10,12]),
  DropdownItem(id: '17', name: 'full tone', steps: [1,3,5,7,9,11]),
];

// Список для notes
var allNotes = <DropdownItem>[
  DropdownItem(id: '1', name: 'C', steps: []),
  DropdownItem(id: '2', name: 'Db', steps: []),
  DropdownItem(id: '3', name: 'D', steps: []),
  DropdownItem(id: '4', name: 'Eb', steps: []),
  DropdownItem(id: '5', name: 'E', steps: []),
  DropdownItem(id: '6', name: 'F', steps: []),
  DropdownItem(id: '7', name: 'Gb', steps: []),
  DropdownItem(id: '8', name: 'G', steps: []),
  DropdownItem(id: '9', name: 'Ab', steps: []),
  DropdownItem(id: '10', name: 'A', steps: []),
  DropdownItem(id: '11', name: 'Bb', steps: []),
  DropdownItem(id: '12', name: 'B', steps: []),
];
