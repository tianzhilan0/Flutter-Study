import 'package:flutter/material.dart';

class LCShowDatePicker extends StatefulWidget {
  LCShowDatePicker({Key key}) : super(key: key);

  @override
  _LCShowDatePickerState createState() => _LCShowDatePickerState();
}

class _LCShowDatePickerState extends State<LCShowDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text("ShowDatePicker"),
            ),
            body: Column(children: [
              RaisedButton(
                child: Text("ShowDatePicker"),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: new DateTime.now(),
                    firstDate: new DateTime.now()
                        .subtract(new Duration(days: 30)), // 减 30 天
                    lastDate: new DateTime.now()
                        .add(new Duration(days: 30)), // 加 30 天
                  ).then((DateTime val) {
                    print(val); // 2018-07-12 00:00:00.000
                  }).catchError((err) {
                    print(err);
                  });
                },
              ),
              RaisedButton(
                child: Text("showTimePicker"),
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: new TimeOfDay.now(),
                  ).then((val) {
                    print(val);
                  }).catchError((err) {
                    print(err);
                  });
                },
              )
            ])));
  }
}
