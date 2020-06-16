import 'package:flutter/material.dart';
import 'package:last_instagram/method/dbHelper.dart';
import 'package:last_instagram/method/method.dart';
import 'package:last_instagram/model/image_str.dart';
import 'package:last_instagram/widget/navigator.dart';
import 'package:last_instagram/widget/widget.dart';

import '../state_container.dart';

class Regist extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  DBHelper db = DBHelper();
  GetASet getSet = GetASet();
  String imgString, user_name, pass_word;
  @override
  Widget build(BuildContext context) {
    // final container = StateContainer.of(context);
    validateAndSave(int index) {
      final container = StateContainer.of(context);
      container.updateUser(new_index: index);
    }

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
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                    child: Column(
                      children: <Widget>[
                        columnTextFormField(username, "Username"),
                        columnTextFormField(password, "Password"),
                        buttonAuth(Colors.blue, "Login", () {
                          loginUser(username.text, password.text).then((value) {
                            goToFeedScreen(context);
                            validateAndSave(value);
                          });
                        }),
                        // goToFeedScreen(context)),
                        buttonAuth(Colors.black12, "Add Users",
                            () => register(getSet, username.text, password.text)
                            ),
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

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:last_instagram/method/dbHelper.dart';
// import 'package:last_instagram/method/method.dart';
// import 'package:last_instagram/model/Users.dart';
// import 'package:last_instagram/model/image_str.dart';
// import 'package:last_instagram/widget/navigator.dart';

// import '../state_container.dart';
// // import 'package:sql_images/photo.dart';

// class Regist extends StatelessWidget {
//   TextEditingController username = TextEditingController();
//   TextEditingController password = TextEditingController();
//   DBHelper dbHelper = DBHelper();
//   GetASet getSet = GetASet();
//   final formKey = new GlobalKey<FormState>();
//   String imgString;
//   @override
//   Widget build(BuildContext context) {
//     validateAndSave(int users) {
//       final container = StateContainer.of(context);
//       if (formKey.currentState.validate()) {
//         formKey.currentState.save();
//         container.updateUser(new_index: users);
//       } else {
//         print("Validation Error");
//       }
//     }

//     return MaterialApp(
//       title: 'Flut',
//       home: Scaffold(
//         //isi scaffold
//         resizeToAvoidBottomPadding: false,
//         appBar: AppBar(
//           title: Text("login Page"),
//         ),
//         body: Container(
//           //isi body: Container
//           decoration: BoxDecoration(
//             //jumlah stop berbanding lurus dengan jumlah warna
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomCenter,
//               //jumlah stop berbanding lurus dengan jumlah warna
//               stops: [0.3, 0.6, 0.9],
//               colors: [
//                 Color.fromRGBO(12, 235, 235, 1),
//                 Color.fromRGBO(32, 227, 178, 1),
//                 Color.fromRGBO(41, 255, 198, 1),
//               ],
//             ),
//           ),
//           child: Form(
//             key: formKey,
//             child: Container(
//               //isi child: Container
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(12)),
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomCenter,
//                     //jumlah stop berbanding lurus dengan jumlah warna
//                     stops: [0.3, 0.6, 0.9],
//                     colors: [
//                       Color.fromRGBO(12, 235, 235, 1),
//                       Color.fromRGBO(32, 227, 178, 1),
//                       Color.fromRGBO(41, 255, 198, 1),
//                     ],
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                         blurRadius: 18.0,
//                         color: Colors.transparent.withOpacity(.5),
//                         spreadRadius: 12.5),
//                   ]),
//               margin: EdgeInsets.fromLTRB(40, 35, 40, 50),
//               child: Column(
//                 //isi child: Column
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(top: 15),
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           "Login",
//                           style: TextStyle(
//                               fontFamily: 'LexendDeca',
//                               fontSize: 19,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Container(
//                           width: 70,
//                           height: 70,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage('assets/imgprofile.jpg'),
//                                   fit: BoxFit.fill),
//                               shape: BoxShape.circle),
//                         ),
//                         SizedBox(
//                           width: 60,
//                           height: 25,
//                           child: FlatButton(
//                             padding: EdgeInsets.zero,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30.0)),
//                             color: Colors.blue,
//                             textColor: Colors.white,
//                             child: Text(
//                               'Add Image',
//                               style: TextStyle(fontSize: 9),
//                             ),
//                             onPressed: () => pickImage(getSet),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
//                     child: Column(
//                       children: <Widget>[
//                         Text("Email"),
//                         Container(
//                             margin: EdgeInsets.only(top: 10, bottom: 8),
//                             child: TextFormField(
//                               controller: username,
//                               decoration: InputDecoration(
//                                   hintText: "Email",
//                                   prefixIcon: Icon(Icons.message),
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(28))),
//                             )),
//                         Text("Password"),
//                         Container(
//                             margin: EdgeInsets.only(top: 10, bottom: 8),
//                             child: TextFormField(
//                               controller: password,
//                               decoration: InputDecoration(
//                                   hintText: "Password",
//                                   prefixIcon: Icon(Icons.lock),
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(28))),
//                             )),
//                         FlatButton(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0)),
//                           color: Colors.blue,
//                           textColor: Colors.white,
//                           child: Text('Sign In'),
//                           onPressed: () async {
//                             var kontak = await dbHelper
//                                 .loginUser(username.text, password.text)
//                                 .then((_) {
//                               validateAndSave(_.id);
//                               print(_.id);
//                               goToFeedScreen(context);
//                             });
//                           },
//                         ),
//                         FlatButton(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0)),
//                           color: Colors.black12,
//                           textColor: Colors.white,
//                           child: Text('Forgot password'),
//                           onPressed: () async {
//                             register(getSet, username.text, password.text);
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
