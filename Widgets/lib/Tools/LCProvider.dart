
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LCProvider extends StatefulWidget {
  LCProvider({Key key}) : super(key: key);

  @override
  _LCProviderState createState() => _LCProviderState();
}

class _LCProviderState extends State<LCProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Provider")),
        body: Column(
          children:[
            RaisedButton(
              child: Text("对Provider 进行赋值"),
              onPressed: (){
                Provider.of<ProviderPostData>(context, listen:false).setValue('test', '我是test value!');
              },
            ),
            RaisedButton(
              child: Text("对Provider 清空"),
              onPressed: (){
                Provider.of<ProviderPostData>(context, listen:false).clear();
              },
            ),

            Text("provider: ${Provider.of<ProviderPostData>(context, listen:true).postData}")
          ]
        ),
    );
  }
}


class ProviderPostData with ChangeNotifier {
// 要设置的值
  Map<String, dynamic> _postData;

  // 初始化时赋值
  ProviderPostData(this._postData);

  // 设置值
  void setValue(key,value) {
    _postData[key] = value;
    notifyListeners();
  }

  // 清空值
  void clear(){
    _postData = {};
    notifyListeners();

  }

  // 获取值
  get postData => _postData;
}