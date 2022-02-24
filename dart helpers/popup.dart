import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Screen 2'),
      ),
      body: Center(
        child: PopupMenuButton(
          child: Center(child: Text('click here')),
          itemBuilder: (context) {
            return List.generate(5, (index) {
              return PopupMenuItem(
                child: Text('button no $index'),
              );
            });
          },
        ),
      ),
    );
  }
}
