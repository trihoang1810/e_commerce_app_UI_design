import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Đây là ErroPage');
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Text(
        'Không thể hiện dữ liệu',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
      )),
    );
  }
}
