import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner_example/page/detailpage1.dart';
import 'package:qr_code_scanner_example/page/detailpage2.dart';
import 'package:qr_code_scanner_example/page/errorpage.dart';
import 'package:qr_code_scanner_example/page/qr_scan_page.dart';
import 'package:qr_code_scanner_example/widget/button_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String title = 'QR Code Scanner';
  static final String screen2 = "/detailtab";
  static final String screen1 = "/errortab";
  static final String screen3 = "/detailtab1";
  @override
  Widget build(BuildContext context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: MainPage(title: title),
          routes: <String, WidgetBuilder>{
            "/detailtab": (BuildContext context) => new DetailPage(),
            "/errortab": (BuildContext context) => new ErrorPage(),
            "/detailtab1": (BuildContext context) => new DetailPage1(),
          });
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        const SizedBox(height: 32),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
            child: new Container(
                width: 150,
                height: 150,
                child: new Image(
                    image: AssetImage('assets/images/qrcode.png'),
                    width: 150,
                    height: 150))),
        ButtonWidget(
          text: 'Start QR scanning',
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => QRScanPage(),
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Developed by SISTRAIN®',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Container(
                      width: 35,
                      height: 35,
                      child: new Image.asset(
                          'assets/images/logo_sistrain_no_background.png',
                          fit: BoxFit.cover)))
            ],
          ),
        ),
      ]),
    ));
  }
}
