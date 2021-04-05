// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_scanner_example/widget/button_widget.dart';

import '../main.dart';

class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = 'Unknown';
  //int a = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Scan Result',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '$qrCode',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 72),
              ButtonWidget(
                text: 'Start QR scan',
                onClicked: () {
                  scanQRCode();
                  //compareScan(this.qrCode);
                },
              ),
            ],
          ),
        ),
      );

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
    if (qrCode == 'napboncau') {
      //print('Đây là if');
      Navigator.pushNamed(context, "/detailtab");
    } else if (qrCode == 'boxaboncau') {
      Navigator.pushNamed(context, "/detailtab1");
    } else {
      if (qrCode == 'Unknown') {
        return;
      } else {
        //print('Đây là else');
        Navigator.pushNamed(context, "/errortab");
      }
    }
    //a = 0;
    //a++;
  }

  /*void compareScan(String qrCode) {
    //if (a != 0) {
    if (qrCode == 'https://qrco.de/bc1lGS') {
      print('Đây là if');
      Navigator.pushNamed(context, "/detailtab");
    } else {
      if (qrCode == 'Unknown') {
        return;
      } else {
        print('Đây là else');
        Navigator.pushNamed(context, "/errortab");
      }
    }
    //a = 0;
  }*/
}
//}
