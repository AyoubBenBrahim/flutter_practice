import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[300],
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.red[400],
              backgroundImage: AssetImage('images/img.jpg'),
            ),
            Text(
              'Genghis Khan',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
            Text(
              'Softwar Devolper',
              style: TextStyle(
                fontFamily: 'Amiri',
                fontSize: 20.0,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              width: 200,
              child: Divider(
                color: Colors.black54,
                thickness: 5,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  // size: 40,
                  color: Colors.green,
                ),
                title: Text(
                  '+212 618156277',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  // size: 40,
                  color: Colors.green,
                ),
                title: Text(
                  'toto@gmail.com',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
