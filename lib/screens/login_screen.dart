import 'package:flutter/material.dart';
import 'package:instagram_layout_clean/widget/navigator.dart';
import 'package:instagram_layout_clean/widget/widget.dart';

class Regist extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  String imgString, user_name, pass_word;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flut',
      home: Scaffold(
        //isi scaffold
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("login Page"),
        ),
        body: Container(
          //isi body: Container
          decoration: gradient(withRadius: false),
          child: Form(
            key: formKey,
            child: Container(
              //isi child: Container
              decoration: gradient(withRadius: true),
              margin: EdgeInsets.fromLTRB(40, 35, 40, 50),
              child: columns(
                [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: columns(
                      [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: 'LexendDeca',
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                        openingImage(),
                        SizedBox(
                          width: 60,
                          height: 25,
                          child: FlatButton(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text(
                              'Add Image',
                              style: TextStyle(fontSize: 9),
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                    child: Column(
                      children: <Widget>[
                        columnTextFormField(username, "Username"),
                        columnTextFormField(password, "Password"),
                        buttonAuth(Colors.blue, "Login", () => goToFeedScreen(context)),
                        buttonAuth(Colors.black12, "Add Users", () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
