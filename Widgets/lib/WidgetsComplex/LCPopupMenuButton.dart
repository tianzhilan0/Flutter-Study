import 'package:flutter/material.dart';

class LCPopupMenuButton extends StatefulWidget {
  LCPopupMenuButton({Key key}) : super(key: key);

  @override
  _LCPopupMenuButtonState createState() => _LCPopupMenuButtonState();
}

class _LCPopupMenuButtonState extends State<LCPopupMenuButton> {
  String _selectedValue;

  @override
  Widget build(BuildContext context) {
    Widget _popMenu() {
      return Container(
          child: PopupMenuButton<String>(
        itemBuilder: (context) => _getPopupMenu(context),
        onSelected: (String value) {
          print('onSelected  $value');
          _selectValueChange(value);
        },
        onCanceled: () {
          print('onCanceled');
        },
//      child: RaisedButton(onPressed: (){},child: Text('选择'),),
        icon: Icon(Icons.shopping_basket),
      ));
    }

    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text("PopupMenuButton"),
        actions: <Widget>[_popMenu()],
      ),
      body: Container(
        child: Text("_selectedValue == $_selectedValue"),
      ),
    ));
  }

  _selectValueChange(String value) {
    setState(() {
      _selectedValue = value;
    });
  }

  _getPopupMenu(BuildContext context) {
    return <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        value: '语文',
        child: Text('语文'),
        
      ),
      PopupMenuItem<String>(
        value: '数学',
        child: Text('数学'),
      ),
      PopupMenuItem<String>(
        value: '英语',
        child: Text('英语'),
      ),
      PopupMenuItem<String>(
        value: '生物',
        child: Text('生物'),
      ),
      PopupMenuItem<String>(
        value: '化学',
        child: Text('化学'),
      ),
    ];
  }
}
