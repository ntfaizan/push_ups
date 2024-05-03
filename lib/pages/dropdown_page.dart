import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  List<DropdownMenuItem<String?>>? itemsList = [
    const DropdownMenuItem<String>(
      value: 'mon',
      child: Text('Monday'),
    ),
    const DropdownMenuItem<String>(
      value: 'tue',
      child: Text('Tuesday'),
    ),
    const DropdownMenuItem<String>(
      value: 'wed',
      child: Text('Wednesday'),
    ),
    const DropdownMenuItem<String>(
      value: 'thu',
      child: Text('Thursday'),
    ),
    const DropdownMenuItem<String>(
      value: 'fri',
      child: Text('Friday'),
    ),
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DropdownButton<String?>(
            hint: const Text('Choose a day'),
            value: selectedValue,
            items: itemsList,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
