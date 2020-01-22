

import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {

  Function onTap;

  Icon icon;

  Color color;


  CustomRoundedButton({@required this.onTap, @required this.icon, this.color});

  

  @override
  Widget build(BuildContext context) {
    return ClipOval(
                  child: Material(
                    color: color == null? Theme.of(context).backgroundColor : color,
                    child: InkWell(
                      splashColor: Colors.white, // inkwell color
                      child: SizedBox(
                          width: 66,
                          height: 66,
                          child: icon),
                      onTap: () {
                        onTap();
                      },
                    ),
                  ),
                );
  }
}