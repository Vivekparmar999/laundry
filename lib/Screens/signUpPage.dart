import "package:flutter/material.dart";
import 'package:laundry/utils/fontSize.dart';
import 'package:laundry/utils/colors.dart';
import 'package:laundry/utils/string.dart';

import 'bottomNavigation.dart';
import 'dashBoardPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(appName),
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));
                            }),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already a Member ?"),
                          Container(
                            height: 20,
                            width: 20,
                          ),
                          new GestureDetector(
                            onTap: () {
                              setState(() {});
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
