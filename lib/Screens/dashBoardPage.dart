import 'package:flutter/material.dart';
import 'package:laundry/utils/fontSize.dart';
import 'package:laundry/utils/string.dart';
import 'package:laundry/utils/colors.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List<String> cardHeading = <String>[
    "Washing & folding",
    "Dry Cleaning",
    "Ironing",
    "23",
    "43545",
    "hello",
    "world"
  ];

  @override
  Widget build(BuildContext context) {
    var listView = ListView.builder(
        itemCount: cardHeading.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xfffff0),
                      blurRadius: 10,
                      spreadRadius: 2)
                ],
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.people),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(cardHeading[index]), Text("20")],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            tooltip: "Cart",
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Vivek Parmar"),
              accountEmail: Text("abc@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Ttem 1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("Item 2"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            CustomPaint(
              painter: BluePainter(),
              child: Container(),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  child: Icon(Icons.people),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Good Morning Ade,\nwhats are you washing today?',
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height * 0.25),
              child: Text(
                "Services",
                style: TextStyle(
                    fontSize: textSizeLarge, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height * 0.30),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: listView),
            ),
          ],
        ),
      ),
    );
  }
}

class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path ovalPath = Path();
    // Start paint from 28% height to the left
    ovalPath.moveTo(0, height * 0.18);

    // paint a curve from current position to middle of the screen
    ovalPath.quadraticBezierTo(width / 2, height * 0.24, width, height * 0.18);

    ovalPath.lineTo(width, 0);

    ovalPath.lineTo(0, 0);

    // Close line to reset it back
    ovalPath.close();

    paint.color = Colors.blue.shade600;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
