
import 'package:flutter/material.dart';

abstract class BlocBase{
  void dispose();
}


class BlocProvider<T extends BlocBase> extends StatefulWidget{

  final T bloc;
  final Widget child;

  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }): super(key: key);

  @override
      _BlocProviderState<T> createState() {
    return _BlocProviderState<T>();
  }

  /// implementation with O(n) cost
  /// if performance is an issue prefer using BlocProvider with InheritedWidget
  /// Flutter framework memorizes all InheritedWidgets so using context.getElementForInheritedWidgetOfExactType()
  /// gives an 0(1) cost to access an InheritedWidget
  static T of<T extends BlocBase>(BuildContext context){
    BlocProvider<T> provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }


}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>>{
  @override
  void dispose(){
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return widget.child;
  }

}