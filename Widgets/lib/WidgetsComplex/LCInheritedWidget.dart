import 'package:flutter/material.dart';

class InheritedItem {
  String reference;

  InheritedItem(this.reference);
}

class _MyInherited extends InheritedWidget {
  _MyInherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final MyInheritedWidgetState data;

  @override
  bool updateShouldNotify(_MyInherited oldWidget) {
    return true;
  }
}

class MyInheritedWidget extends StatefulWidget {
  MyInheritedWidget({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  MyInheritedWidgetState createState() => MyInheritedWidgetState();

  static MyInheritedWidgetState of(
      [BuildContext context, bool rebuild = true]) {
    return (rebuild
            ? context.inheritFromWidgetOfExactType(_MyInherited) as _MyInherited
            : context.ancestorWidgetOfExactType(_MyInherited) as _MyInherited)
        .data;
  }
}

class MyInheritedWidgetState extends State<MyInheritedWidget> {
  List<InheritedItem> _items = <InheritedItem>[];

  int get itemsCount => _items.length;

  //添加Item
  void addItem(String reference) {
    setState(() {
      _items.add(InheritedItem(reference));
    });
  }

  //移除Item
  void removeItem() {
    setState(() {
      if (_items.length > 0) {
        _items.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _MyInherited(
      data: this,
      child: widget.child,
    );
  }
}

class LCInheritedWidget extends StatefulWidget {
  @override
  _LCInheritedWidgetState createState() => _LCInheritedWidgetState();
}

class _LCInheritedWidgetState extends State<LCInheritedWidget> {
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Title'),
        ),
        body: Column(
          children: <Widget>[
            WidgetA(),
            WidgetD(),
            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  WidgetB(),
                  WidgetC(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state =
        MyInheritedWidget.of(context, false); // 防止WidgetA被rebuild
    return Container(
      child: RaisedButton(
        child: Text('Add Item'),
        onPressed: () {
          state.addItem('item');
        },
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return Text('${state.itemsCount}');
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('I am Widget C');
  }
}

class WidgetD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state =
        MyInheritedWidget.of(context, false); // 防止WidgetA被rebuild
    return Container(
      child: RaisedButton(
        child: Text('Remove Item'),
        onPressed: () {
          state.removeItem();
        },
      ),
    );
  }
}
