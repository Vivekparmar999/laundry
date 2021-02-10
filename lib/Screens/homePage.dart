import 'package:flutter/material.dart';
import 'login.dart';
import 'settings.dart';
import 'package:laundry/utils/fontSize.dart';
import 'package:laundry/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                /*back icon*/
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                /*heading*/
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Sign Up",
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: textSizeXLarge,
                              color: Colors.blue),
                        ),
                      ),
                      SizedBox(width: 4),
                    ],
                  ),
                ),
                /*content*/
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text("Full Name", fontSize: textSizeMedium),
                      EditText(
                        isPassword: false,
                        icon: Icon(Icons.people),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      text("Email", fontSize: textSizeMedium),
                      EditText(
                        isPassword: false,
                        icon: Icon(Icons.email),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      text("Password", fontSize: textSizeMedium),
                      EditText(
                        isSecure: true,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      text("Re- Enter Password", fontSize: textSizeMedium),
                      EditText(
                        isSecure: true,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: RaisedButton(
                            elevation: 5,
                            color: primaryColor,
                            child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Text("Create Account")),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            }),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Already a Member ?"),
                          Container(
                            height: 20,
                            width: 20,
                          ),
                          new GestureDetector(
                            onTap: () {
                              setState(() {
                         
                              });
                            },
                            child: Padding(
                                padding: EdgeInsets.all(25),
                                child: Text(
                                  "Login in",
                                  style: TextStyle(
                                      color: Colors.blue[900],
                                      ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.settings),
            backgroundColor: primaryColor,
            onPressed: () {}));
  }

  Widget text(var text,
      {var fontSize = 18.0,
      textColor = Colors.blue,
      //var fontFamily = Regular,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.5}) {
    return Text(text,
        textAlign: isCentered ? TextAlign.center : TextAlign.start,
        maxLines: maxLine,
        style: TextStyle(
            // fontFamily: fontFamily,
            fontSize: fontSize,
            color: textColor,
            height: 1.5,
            letterSpacing: latterSpacing));
  } //fun

} //class

class EditText extends StatefulWidget {
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  //var fontFamily;
  var text;
  var maxLine;
  Icon icon;
  TextEditingController mController;
  VoidCallback onPressed;
  EditText(
      {var this.fontSize = 20.0,
      var this.textColor = Colors.blue,
      //var this.fontFamily = ,
      var this.isPassword = true,
      var this.isSecure = false,
      var this.text = "",
      var this.mController,
      var this.maxLine = 1,
      this.icon});

  @override
  State<StatefulWidget> createState() {
    return EditTextState();
  }
}

class EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isSecure) {
      return TextField(
        decoration: InputDecoration(suffixIcon: widget.icon),
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: Colors.blue,
        maxLines: widget.maxLine,
        style: TextStyle(
          fontSize: widget.fontSize,
          color: Colors.blue,
          // fontFamily: widget.fontFamily
        ),
      );
    } else {
      return TextField(
          controller: widget.mController,
          obscureText: widget.isPassword,
          cursorColor: Colors.blue,
          style: TextStyle(
            fontSize: widget.fontSize,
            color: Colors.blue,
            //fontFamily: widget.fontFamily
          ),
          decoration: new InputDecoration(
            suffixIcon: new GestureDetector(
              onTap: () {
                setState(() {
                  widget.isPassword = !widget.isPassword;
                });
              },
              child: new Icon(
                  widget.isPassword ? Icons.visibility : Icons.visibility_off),
            ),
          ));
    }
  }
}
