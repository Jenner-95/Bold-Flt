// import 'package:flutter/material.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
// import 'package:multi_select_flutter/util/multi_select_list_type.dart';

// class ButtonWidget extends StatefulWidget {
//   @override
//   _ButtonWidgetState createState() => _ButtonWidgetState();
// }

// class Animal {
//   final int id;
//   final String name;

//   Animal({
//     this.id,
//     this.name,
//   });
// }

// class _ButtonWidgetState extends State<ButtonWidget> {
//   static List<Animal> _animals = [
//     Animal(id: 1, name: "Lion"),
//     Animal(id: 2, name: "Flamingo"),
//     Animal(id: 3, name: "Hippo"),
//     Animal(id: 4, name: "Horse"),
//     Animal(id: 5, name: "Tiger"),
//     Animal(id: 6, name: "Penguin"),
//     Animal(id: 7, name: "Spider"),
//   ];

//   List<Animal> _selectedAnimals = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('dksdkjkdsdsdk'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.all(20),
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 40),
//               MultiSelectDialogField(
//                 items: _animals.map((e) => MultiSelectItem(e, e.name)).toList(),
//                 listType: MultiSelectListType.CHIP,
//                 onConfirm: (values) {
//                   _selectedAnimals = values;
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
