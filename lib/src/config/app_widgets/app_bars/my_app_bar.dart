import 'package:flutter/material.dart';

class MyAppBar {

  PreferredSizeWidget init() {
    
    String dropdownValue = 'By days';

    var items = [
      'By days',
      'By hours'
    ];

    return AppBar(
      title: GestureDetector(
        onTap: () => print('app bar'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) => print(newValue),
            ),
          ],
        ),
      ),
    );
  }
}
