import 'package:flutter/material.dart';
 
class StateContainer extends StatefulWidget {
  // meminta widget dan Model yang dibutuhkan
  final Widget child;
  final int index;
  // fi
 
  StateContainer({@required this.child, this.index});
 
  static StateContainerState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedStateContainer>()).data;
  }
 
  @override
  StateContainerState createState() => new StateContainerState();
}
 
class StateContainerState extends State<StateContainer> {
 int index;
   void updateUser({int new_index}) {
    if (index == null) {
      index = new_index;
      setState(() {
        index = new_index;
      });
    } else {
      setState(() {
        index = new_index ?? index;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}
 
class InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;
  InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);
 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}