import "package:flutter/material.dart";
import 'package:laundry/utils/fontSize.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

         bool passwordVisible = false;
          bool isRemember = false;
    @override
    void initState() {
      super.initState();
      passwordVisible = false;
    }

    @override
    Widget build(BuildContext context) {
 
      return Scaffold(
        body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).backgroundColor,
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
                    Text(
                      "Login",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: textSizeXLarge,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
              /*content*/
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text("Email", fontSize: 16.0),
                    EditText(isPassword: false),
                    SizedBox(
                      height: 25,
                    ),
                    text("Password", fontSize: 16.0),
                    EditText(isSecure: true),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: RaisedButton(
                          child: Text("Sign Up"),
                          onPressed: () {
                            //callNext(T2Dashboard(), context);
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
  
      ));

    }//widget


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
      }//fun
      

  }//class


class EditText extends StatefulWidget {
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var maxLine;
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
      var this.maxLine = 1});

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
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: Colors.blue,
        maxLines: widget.maxLine,
        style: TextStyle(
            fontSize: widget.fontSize,
            color: Colors.blue,
            fontFamily: widget.fontFamily),
      );
    } else {
      return TextField(
          controller: widget.mController,
          obscureText: widget.isPassword,
          cursorColor: Colors.blue,
          style: TextStyle(
              fontSize: widget.fontSize,
              color: Colors.blue,
              fontFamily: widget.fontFamily),
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
