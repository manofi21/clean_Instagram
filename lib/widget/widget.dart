import 'package:flutter/material.dart';

Decoration circularWhite() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25.0),
  );
}

Widget columns(List<Widget> allListWidget) {
  return Column(
    children: allListWidget,
  );
}

Decoration whiteTopRadius() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
    ),
  );
}

Decoration boxShadowBorderRadius() {
  return BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0, -2),
        blurRadius: 6.0,
      ),
    ],
    color: Colors.white,
  );
}

Widget rows(List<Widget> allListWidget) {
  return Row(children: allListWidget);
}

Widget rowsSpaceBetween(List<Widget> allListWidgets) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: allListWidgets);
}

EdgeInsets verticalW(double v) {
  return EdgeInsets.symmetric(vertical: v);
}

Decoration shapeCircleShadows() {
  return BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(0, 2),
        blurRadius: 6.0,
      ),
    ],
  );
}

CircleAvatar circleProfile(String images, Size size) {
  return CircleAvatar(
    child: ClipOval(
      child: Image(
        height: size.height,
        width: size.width,
        image: AssetImage(images),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Text stringBold(String string) {
  return Text(
    string,
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
}

Text viewLikeCommant(int commandcount) {
  return Text(
    commandcount.toString(),
    style: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
    ),
  );
}

Container tileImageList(String imagePost) {
 return Container(
                        margin: EdgeInsets.all(10.0),
                        width: double.infinity,
                        height: 400.0,
                        decoration:
   BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(0, 5),
        blurRadius: 8.0,
      ),
    ],
    image: DecorationImage(
      image: AssetImage(imagePost),
      fit: BoxFit.fill,
    ),
  ));
}

EdgeInsets horizonW(double h) {
  return EdgeInsets.symmetric(horizontal: h);
}

Text instagramText() {
  return Text(
    'Instagram',
    style: TextStyle(
      fontFamily: 'Billabong',
      fontSize: 32.0,
    ),
  );
}

BottomNavigationBarItem centerButtomsNav() {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF23B66F),
        onPressed: () => print('Upload photo'),
        child: Icon(
          Icons.add,
          size: 35.0,
          color: Colors.white,
        ),
      ),
    ),
    title: Text(''),
  );
}

BottomNavigationBarItem sideButtomNav(IconData icons) {
  return BottomNavigationBarItem(
    icon: Icon(
      icons,
      size: 30.0,
      color: Colors.black,
    ),
    title: Text(''),
  );
}

FlatButton postYourCommand() {
  return FlatButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    color: Color(0xFF23B66F),
    onPressed: () => print('Post comment'),
    child: Icon(
      Icons.send,
      size: 25.0,
      color: Colors.white,
    ),
  );
}
