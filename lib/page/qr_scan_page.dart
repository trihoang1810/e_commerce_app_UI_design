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
                  compareScan(qrCode);
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
  }
}

void compareScan(String qrCode) {
  if (qrCode == 'mrtribachkhoa') {
    /* Widget build(BuildContext context) {
      new Container(
          child: ButtonWidget(
            text: 'Tiep tuc',
            onClicked: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => DetailPage()
                  )
              );
            },
          )
      );
    }*/
    print('Đây là if');
    PageNavigator();
  } else {
    print('Đây là else');
    ErrorPage();
    //final snackBar = SnackBar(content: Text('Khong dung du lieu'));
    // Scaffold.of(context).showSnackBar(snackBar);
  }
}

class PageNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Đây là page Navigator');
    return Container(
        child: RaisedButton(
      child: Text('Tiep tuc'),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => DetailPage()));
      },
    ));
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Đây là ErroPage');
    return Scaffold(
      body: Center(
          child: FlatButton(
        child: Text('Khong the hien du lieu'),
        onPressed: () {},
      )),
    );
  }
}

class DetailPage extends StatefulWidget {
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('anh Tri dep trai'),
      ),
      body: Center(
        child: Text('Page cua anh Tri dep trai'),
      ),
    );
  }
}
