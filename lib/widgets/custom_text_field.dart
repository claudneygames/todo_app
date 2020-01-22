import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  final TextEditingController textEditingController;

  SimpleTextField({
    Key key,
    @required this.textEditingController
,
  }) : super(key: key);

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Container(
          child: new Center(
              child: new TextFormField(
            controller: textEditingController,
            decoration: new InputDecoration.collapsed(
              hintText: 'Enter task details...',
              fillColor: Colors.white,
              
            ),
            maxLines: 8,
            validator: (val) {
              if (val.length == 0) {
                return "Cannot be empty";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.text,
            style: Theme.of(context).primaryTextTheme.body1.apply(fontSizeFactor: 3),
          )),
        ));
  }
}
