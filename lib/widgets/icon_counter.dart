import 'package:flutter/material.dart';

class IconCounter extends StatelessWidget {
  final int counter;
  final IconData iconData;
  IconCounter({Key key, this.counter, this.iconData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Icon(
          iconData,
        ),
        counter != 0
            ? new Positioned(
                right: 11,
                top: 11,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : new Container()
      ],
    );
  }
}
