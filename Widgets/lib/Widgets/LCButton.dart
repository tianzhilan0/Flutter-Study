import 'package:flutter/material.dart';

class LCButton extends StatefulWidget {
  LCButton({Key key}) : super(key: key);

  @override
  _LCButtonState createState() => _LCButtonState();
}

class _LCButtonState extends State<LCButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Button")),
        body: ListView(children: [
          SizedBox(
            height: 20,
          ),
          RaisedButton(
              child: Text("RaisedButton", style: new TextStyle(fontSize: 30)),
              textColor: Colors.blue,
              color: Colors.orange,
              disabledColor: Colors.brown, //波纹颜色
              // highlightColor: Colors.yellow,// 高亮颜色
              splashColor: Colors.black,
              colorBrightness: Brightness.light,
              // elevation: 5,
              // highlightElevation: 2,
              disabledElevation: 2,
              padding: EdgeInsets.all(20), //内部间距
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)), //圆角
                  side: BorderSide(
                      color: Color(0xFFFFFFFF),
                      style: BorderStyle.solid,
                      width: 2) //边框
                  ),
              clipBehavior: Clip.antiAlias,
              onPressed: () {
                print("你点击了 RaisedButton");
              }),
          SizedBox(
            height: 20,
          ),
          FlatButton(
              color: Colors.yellow,
              textColor: Colors.blue,
              disabledColor: Colors.grey,
              highlightColor: Colors.red,
              splashColor: Colors.red,
              colorBrightness: Brightness.light,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(
                      color: Color(0xFFFFFFFF),
                      style: BorderStyle.solid,
                      width: 2)),
              clipBehavior: Clip.antiAlias,
              onPressed: () {
                print("你点击了 FlatButton");
              },
              child: Text(
                "FlatButton",
                style: new TextStyle(fontSize: 30),
              )),
          SizedBox(
            height: 20,
          ),
          OutlineButton(
            child: Text("OutlineButton", style: TextStyle(fontSize: 30)),
            onPressed: () {
              print("你点击了 OutlineButton");
            },
            textColor: Colors.blue,
            highlightColor: Colors.grey,
            splashColor: Colors.red,
            highlightElevation: 5,
            borderSide: BorderSide(
                color: Colors.amberAccent,
                width: 2.0,
                style: BorderStyle.solid),
            padding: EdgeInsets.all(20),
          ),
          SizedBox(height: 20),
          IconButton(
            icon: new Icon(Icons.add_a_photo),
            color: Colors.amber,
            highlightColor: Colors.red,
            splashColor: Colors.blue,
            iconSize: 28,
            onPressed: () {
              print("你点击了 IconButton");
            },
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "My_Fab",
            backgroundColor: Colors.blue,
            elevation: 4,
            child: Text("拍照",
                style: new TextStyle(color: Colors.white, fontSize: 20)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            onPressed: () {
              print("你点击了 FloatingActionButton");
            },
          ),
          // DropdownButton(
          //     icon: new Icon(Icons.add_a_photo),
          //     iconSize: 24,
          //     hint: Text('data'),
          //     elevation: 30,
          //     style: TextStyle(color: Colors.deepPurple),
          //     underline: Container(
          //       height: 2,
          //       color: Colors.deepPurpleAccent,
          //     ),
          //     onChanged: (String newValue) {
          //       setState(() {
                  
          //       });
          //     },

          // )
        ]),
      ),
    );
  }
}

// RaisedButton({
//     Key key,
//     @required VoidCallback onPressed,//点击按钮回调，
//     VoidCallback onLongPress,//长按回调
//     ValueChanged<bool> onHighlightChanged,//点击按钮高亮显示回调,按下返回true，抬起返回false
//     ButtonTextTheme textTheme,//设置按钮文字主题
//     Color textColor,//设置按钮文字颜色
//     Color disabledTextColor,//设置按钮处于disable时按钮颜色
//     Color color,//设置按钮背景色
//     Color disabledColor,//设置按钮处于disable时的背景色
//     Color focusColor,
//     Color hoverColor,
//     Color highlightColor,//设置按钮按下时的颜色
//     Color splashColor,//设置按钮抬起时的波纹效果颜色
//     Brightness colorBrightness,//dark时,按钮按下抬起时不会有波纹效果，light时会有波纹效果
//     double elevation,//设置按钮阴影大小，值越大阴影越大
//     double focusElevation,
//     double hoverElevation,
//     double highlightElevation,//设置按钮按下时的阴影大小
//     double disabledElevation,//设置按钮处于disable时的阴影大小
//     EdgeInsetsGeometry padding,//设置文字与按钮边框的边距
//     ShapeBorder shape,//设置按钮边框样式
//     Clip clipBehavior = Clip.none,//切割按钮方式
//     FocusNode focusNode,
//     bool autofocus = false,
//     MaterialTapTargetSize materialTapTargetSize,//在无其他约束条件下调整按钮大小
//     Duration animationDuration,//设置动画时长
//     Widget child,
//  })

// FlatButton({
//     Key key,
//     @required VoidCallback onPressed,//点击回调
//     VoidCallback onLongPress,//长按回调
//     ValueChanged<bool> onHighlightChanged,点击按钮高亮显示回调,按下返回true，抬起返回false
//     ButtonTextTheme textTheme,////设置按钮文字主题
//     Color textColor,//文字颜色
//     Color disabledTextColor,
//     Color color,
//     Color disabledColor,
//     Color focusColor,
//     Color hoverColor,
//     Color highlightColor,
//     Color splashColor,
//     Brightness colorBrightness,
//     EdgeInsetsGeometry padding,
//     ShapeBorder shape,
//     Clip clipBehavior = Clip.none,
//     FocusNode focusNode,
//     bool autofocus = false,
//     MaterialTapTargetSize materialTapTargetSize,
//     @required Widget child,
// })

// DropdownButton({
//     Key key,
//     @required this.items,//需要选择的一组数据
//     this.selectedItemBuilder,//被选择的Item
//     this.value,//被选择的内容
//     this.hint,//当按钮初始化时，没选择任何内容时候展示的默认值
//     this.disabledHint,//按钮diaable状态时的默认值
//     @required this.onChanged,//下拉框中的按钮被点击响应
//     this.elevation = 8,//打开菜单时，菜单的z坐标位置
//     this.style,//设置按钮文字类型
//     this.underline,//设置下划线
//     this.icon,//设置显示图标
//     this.iconDisabledColor,//设置disable状态下图标颜色
//     this.iconEnabledColor,//设置正常状态下图标颜色
//     this.iconSize = 24.0,//设置图标大小
//     this.isDense = false,//调整按钮高度，true时，按钮高度减少一半
//     this.isExpanded = false,//设置下拉是否拉伸
//     this.itemHeight = kMinInteractiveDimension,//设置每一行的高度
//     this.focusColor,
//     this.focusNode,
//     this.autofocus = false,
// })
