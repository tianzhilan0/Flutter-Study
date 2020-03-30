import 'package:flutter/material.dart';
import 'package:flutter_plugin_record/voice_widget.dart';
class LCWXRecord extends StatefulWidget {
  LCWXRecord({Key key}) : super(key: key);

  @override
  _LCWXRecordState createState() => _LCWXRecordState();
}

class _LCWXRecordState extends State<LCWXRecord> {
  String toastShow = "悬浮框";
  OverlayEntry overlayEntry;

  
  showView(BuildContext context) {
    if (overlayEntry == null) {
      overlayEntry = OverlayEntry(builder: (content) {
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.5 - 80,
          left: MediaQuery.of(context).size.width * 0.5 - 80,
          child: Material(
            child: Center(
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xff77797A),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
//                      padding: EdgeInsets.only(right: 20, left: 20, top: 0),
                        child: Text(
                          toastShow,
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
      Overlay.of(context).insert(overlayEntry);
    }
  }


  startRecord(){
    print("111开始录制");
  }

  stopRecord(String path,double audioTimeLength ){
    print("结束束录制");
    print("音频文件位置"+path);
    print("音频录制时长"+audioTimeLength.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("微信录音")),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height:200),
            VoiceWidget(startRecord: startRecord,stopRecord: stopRecord),
          ],
        ),
      ),
    );
  }
}