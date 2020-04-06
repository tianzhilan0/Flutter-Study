import 'package:flutter/material.dart';

class LCAppBar extends StatelessWidget {
  final double appBarAlpha;
  final IconData leftIcon;
  final VoidCallback leftAction;
  // final String rightIcon;
  // final VoidCallback rightAction;
  // final String rightSecondIcon;
  // final VoidCallback rightSecondAction;
  // final VoidCallback searchAction;

  const LCAppBar({
    Key key,
    this.appBarAlpha,
    this.leftIcon,
    this.leftAction,
    // this.rightIcon,
    // this.rightAction,
    // this.rightSecondIcon,
    // this.rightSecondAction,
    // this.searchAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("$kToolbarHeight");
    return Container(
        height: kToolbarHeight + 44,
        width: double.maxFinite,
        color: Color.fromRGBO(255, 255, 255, appBarAlpha),
        child: Container(
          height: 44,
          padding: EdgeInsets.only(top: kToolbarHeight),
          child: Row(children: [
            InkWell(
                onTap: leftAction,
                child: Container(
                    padding: EdgeInsets.only(left: 15, right: 7.5),
                    child: Icon(
                      Icons.camera,
                      color: appBarAlpha > 0.9 ? Colors.black87 : Colors.white,
                    ))),
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.only(
                        left: 7.5, right: 7.5, top: 5, bottom: 5),
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              appBarAlpha > 0.9 ? Colors.black54 : Colors.white,
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
                          color:
                              appBarAlpha > 0.9 ? Colors.black87 : Colors.white,
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: clickSearch,
                            child: Text(
                            "时时付",
                            style: TextStyle(
                                color: appBarAlpha > 0.9
                                    ? Colors.black54
                                    : Colors.white),
                          )
                          )),
                      InkWell(
                          onTap: clickVoice,
                          child: Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            width: 20,
                            height: 20,
                            child: Icon(
                              Icons.keyboard_voice,
                              color: appBarAlpha > 0.9
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
                      color: appBarAlpha > 0.9 ? Colors.black87 : Colors.white,
                    ))),
            InkWell(
                onTap: clickMessage,
                child: Container(
                    padding: EdgeInsets.only(left: 7.5, right: 15),
                    child: Icon(
                      Icons.email,
                      color: appBarAlpha > 0.9 ? Colors.black87 : Colors.white,
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
