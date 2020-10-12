import 'package:flutter/material.dart';

class MyChips extends StatefulWidget {
  final List<String> items;
  final Function(int) onItemSelected;

  MyChips({@required this.items, this.onItemSelected});

  @override
  State<StatefulWidget> createState() => _MyChipsState();
}

class _MyChipsState extends State<MyChips> {
  int selectedChoice = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        spacing: 6.0,
        runSpacing: 2.0,
        children: List<Widget>.generate(widget.items.length, (index) {
          return ChoiceChip(
            label: Text(widget.items[index]),
            selectedColor: Color.fromRGBO(243, 211, 4, 1.0),
            selected: index == selectedChoice,
            labelStyle: TextStyle(color: Colors.black,),
            onSelected: (selected){
              setState(() {
                selectedChoice = index;
                if(widget.onItemSelected != null){
                  widget.onItemSelected(index);
                }});
            },
          );
        })
    );
  }
}
