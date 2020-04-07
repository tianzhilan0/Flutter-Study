import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class LCScanQRCode extends StatefulWidget {
  LCScanQRCode({Key key}) : super(key: key);

  @override
  _LCScanQRCodeState createState() => _LCScanQRCodeState();
}

class _LCScanQRCodeState extends State<LCScanQRCode> {
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
       body: Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new MaterialButton(
                      onPressed: scan, child: new Text("Scan")),
                  padding: const EdgeInsets.all(8.0),
                ),
                new Text(barcode),
              ],
            ),
          ),
    );
  }

    Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    }
  }

}