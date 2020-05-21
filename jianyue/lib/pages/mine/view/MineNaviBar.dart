import 'package:flutter/material.dart';

class MineNaviBar extends StatefulWidget implements PreferredSizeWidget {
  final double contentHeight; //从外部指定高度
  final double appBarAlpha;
  final IconData leftIcon;
  final VoidCallback leftAction;
  final VoidCallback rightAction;
  final Color stateColor;

  MineNaviBar(
      {Key key,
      this.contentHeight = 48,
      this.appBarAlpha,
      this.leftIcon,
      this.leftAction,
      this.stateColor,
      this.rightAction
      })
      : super(key: key);

  @override
  _MineNaviBarState createState() => _MineNaviBarState();

  @override
  Size get preferredSize => Size.fromHeight(contentHeight);
}

class _MineNaviBarState extends State<MineNaviBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          color: widget.stateColor.withOpacity(widget.appBarAlpha),
        ),
        Container(
          height: widget.contentHeight,
          color: widget.stateColor.withOpacity(widget.appBarAlpha),
          child: Stack(children: [
            Container(
              width: double.maxFinite,
              child: Text(
                '在这蓝色天空下',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black.withOpacity(widget.appBarAlpha)),
              ),
              alignment: Alignment.center,
            ),
            Positioned(
                child: FlatButton(
              onPressed: widget.leftAction,
              child: Icon(Icons.scanner),
            )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Divider(
                  height: 1,
                  color: widget.appBarAlpha > 0.5 ? Colors.black45: Colors.transparent,
                )),
                Positioned(
                right: 0,
                bottom: 0,
                child: FlatButton(
              onPressed: widget.rightAction,
              child: Icon(Icons.close),
            )),
          ]),
        ),
      ],
    );
  }
}
