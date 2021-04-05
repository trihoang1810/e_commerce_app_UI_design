import 'package:flutter/material.dart';

class ProductCounter extends StatefulWidget {
  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int numbers = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 40,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              if (numbers >= 1) {
                setState(() {
                  numbers--;
                });
              }
            },
            child: Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Text(numbers.toString(),
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w400)),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              setState(() {
                numbers++;
              });
            },
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
