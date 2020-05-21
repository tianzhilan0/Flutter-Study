import 'package:flutter/material.dart';

class LCAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double contentHeight; //从外部指定高度
  final double appBarAlpha;
  final IconData leftIcon;
  final VoidCallback leftAction;
  final Color stateColor;
  LCAppBar(
      {Key key,
      this.contentHeight = 44,
      this.appBarAlpha,
      this.leftIcon,
      this.leftAction,
      this.stateColor})
      : super(key: key);

  @override
  _LCAppBarState createState() => _LCAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(contentHeight);
}

class _LCAppBarState extends State<LCAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          color: widget.stateColor,
        ),
        Container(
          height: 44,
          color: widget.stateColor.withOpacity(widget.appBarAlpha),
          child: Row(children: [
            InkWell(
                onTap: widget.leftAction,
                child: Container(
                    padding: EdgeInsets.only(left: 15, right: 7.5),
                    child: Icon(
                      Icons.camera,
                      color: widget.appBarAlpha > 0.9
                          ? Colors.black87
                          : Colors.white,
                    ))),
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.only(
                        left: 7.5, right: 7.5, top: 5, bottom: 5),
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: widget.appBarAlpha > 0.9
                              ? Colors.black54
                              : Colors.white,
                          width: 1.0),
                      borderRadius: BorderRadius.circular(17.5),
                    ),
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        width: 20,
                        height: 20,
                        child: Icon(
                          Icons.search,
                          color: widget.appBarAlpha > 0.9
                              ? Colors.black87
                              : Colors.white,
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: clickSearch,
                              child: Text(
                                "时时付",
                                style: TextStyle(
                                    color: widget.appBarAlpha > 0.9
                                        ? Colors.black54
                                        : Colors.white),
                              ))),
                      InkWell(
                          onTap: clickVoice,
                          child: Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            width: 20,
                            height: 20,
                            child: Icon(
                              Icons.keyboard_voice,
                              color: widget.appBarAlpha > 0.9
                                  ? Colors.black87
                                  : Colors.white,
                            ),
                          )),
                    ]))),
            InkWell(
                onTap: clickContactService,
                child: Container(
                    padding: EdgeInsets.only(left: 7.5, right: 7.5),
                    child: Icon(
                      Icons.headset_mic,
                      color: widget.appBarAlpha > 0.9
                          ? Colors.black87
                          : Colors.white,
                    ))),
            InkWell(
                onTap: clickMessage,
                child: Container(
                    padding: EdgeInsets.only(left: 7.5, right: 15),
                    child: Icon(
                      Icons.email,
                      color: widget.appBarAlpha > 0.9
                          ? Colors.black87
                          : Colors.white,
                    ))),
          ]),
        ),
      ],
    );


    
    return Container(
        height: kToolbarHeight + 44,
        width: double.maxFinite,
        color: Color.fromRGBO(255, 255, 255, widget.appBarAlpha),
        child: Container(
          height: 44,
          padding: EdgeInsets.only(top: kToolbarHeight),
          child: Row(children: [
            InkWell(
                onTap: widget.leftAction,
                child: Container(
                    padding: EdgeInsets.only(left: 15, right: 7.5),
                    child: Icon(
                      Icons.camera,
                      color: widget.appBarAlpha > 0.9
                          ? Colors.black87
                          : Colors.white,
                    ))),
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.only(
                        left: 7.5, right: 7.5, top: 5, bottom: 5),
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: widget.appBarAlpha > 0.9
                              ? Colors.black54
                              : Colors.white,
                          width: 1.0),
                      borderRadius: BorderRadius.circular(17.5),
                    ),
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        width: 20,
                        height: 20,
                        child: Icon(
                          Icons.search,
                          color: widget.appBarAlpha > 0.9
                              ? Colors.black87
                              : Colors.white,
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: clickSearch,
                              child: Text(
                                "时时付",
                                style: TextStyle(
                                    color: widget.appBarAlpha > 0.9
                                        ? Colors.black54
                                        : Colors.white),
                              ))),
                      InkWell(
                          onTap: clickVoice,
                          child: Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            width: 20,
                            height: 20,
                            child: Icon(
                              Icons.keyboard_voice,
                              color: widget.appBarAlpha > 0.9
                                  ? Colors.black87
                                  : Colors.white,
                            ),
                          )),
                    ]))),
            InkWell(
                onTap: clickContactService,
                child: Container(
                    padding: EdgeInsets.only(left: 7.5, right: 7.5),
                    child: Icon(
                      Icons.headset_mic,
                      color: widget.appBarAlpha > 0.9
                          ? Colors.black87
                          : Colors.white,
                    ))),
            InkWell(
                onTap: clickMessage,
                child: Container(
                    padding: EdgeInsets.only(left: 7.5, right: 15),
                    child: Icon(
                      Icons.email,
                      color: widget.appBarAlpha > 0.9
                          ? Colors.black87
                          : Colors.white,
                    ))),
          ]),
        ));
  }

  //消息
  void clickMessage() {
    print("消息");
  }

  //联系客服
  void clickContactService() {
    print("联系客服");
  }

  //语音
  void clickVoice() {
    print("语音");
  }

  //搜索
  void clickSearch() {
    print("搜索");
  }
}
