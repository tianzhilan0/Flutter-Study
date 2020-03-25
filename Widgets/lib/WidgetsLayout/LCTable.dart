import 'package:flutter/material.dart';

class LCTable extends StatefulWidget {
  LCTable({Key key}) : super(key: key);

  @override
  _LCTableState createState() => _LCTableState();
}

class _LCTableState extends State<LCTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text("Table")),
      body: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(50.0),
          1: FixedColumnWidth(100.0),
          2: FixedColumnWidth(50.0),
          3: FixedColumnWidth(100.0),
        },
        border: TableBorder.all(
            color: Colors.red, width: 1.0, style: BorderStyle.solid),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: const <TableRow>[
          TableRow(
            children: <Widget>[
              Text('A1'),
              Text('B1'),
              Text('C1'),
              Text('D1'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('A2'),
              Text('B2'),
              Text('C2'),
              Text('D2'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('A3'),
              Text('B3'),
              Text('C3'),
              Text('D3'),
            ],
          ),
        ],
      ),
    ));
  }
}
