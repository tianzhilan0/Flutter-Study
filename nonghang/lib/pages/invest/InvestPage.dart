import 'package:flutter/material.dart';
import 'package:nonghang/manager/LCApi.dart';
import 'package:nonghang/model/InvestModel.dart';
import 'package:nonghang/tool/LCLoading.dart';
import 'package:nonghang/tool/webserve/LCMethod.dart';
import 'package:nonghang/tool/webserve/LCWebRequstManager.dart';
import 'package:nonghang/widget/invest/InvestCurrent.dart';
import 'package:nonghang/widget/invest/InvestHeader.dart';
import 'package:nonghang/widget/invest/InvestInformation.dart';
import 'package:nonghang/widget/invest/InvestMargin.dart';
import 'package:nonghang/widget/invest/InvestRegularly.dart';
import 'package:nonghang/widget/invest/InvestYouLike.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InvestPage extends StatefulWidget {
  InvestPage({Key key}) : super(key: key);

  @override
  _InvestPageState createState() => _InvestPageState();
}

class _InvestPageState extends State<InvestPage>
    with AutomaticKeepAliveClientMixin {

  RefreshController _refresh = RefreshController(initialRefresh: false);
  InvestModel model = InvestModel();
  bool isRequest = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("=========> InvestPage initState <=========");

    isRequest = true;
    getData();
  }

  getData() async {
    await Future.delayed(Duration(seconds:1));
    LCWebRequstManager().request<InvestModel>(
        LCMethod.GET, LCApi.investlist, {}, success: (result) {
          print("结果 == $result");
      setState(() {
        isRequest = false;
        model = result;
      });
      _refresh.refreshCompleted();
    }, error: (emsg) {
      _refresh.refreshCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("投资"),
        ),
        backgroundColor: Color(0xEEEEEEEE),
        body: isRequest
            ? LCLoading()
            : SmartRefresher(
                controller: _refresh,
                enablePullDown: true,
                onRefresh: getData,
                child: ListView(children: [
                InvestHeader(
                  model: model,
                ),
                InvestMargin(imageUrl: model.firstMargin),
                InvestCurrent(model: model),
                SizedBox(height: 15),
                InvestRegularly(imageUrl: model.regularlyInvest),
                SizedBox(height: 15),
                InvestYouLike(model: model),
                InvestMargin(imageUrl: model.secondMargin),
                InvestInformation(model: model)
              ])),
      ),
    );
  }
}
