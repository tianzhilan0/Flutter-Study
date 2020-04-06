import 'package:first/config/RequestApi.dart';
import 'package:first/model/InvestModel.dart';
import 'package:first/tools/webserve/LCMethod.dart';
import 'package:first/tools/webserve/LCWebRequstManager.dart';
import 'package:first/widgets/base/LCLoading.dart';
import 'package:first/widgets/invest/InvestCurrent.dart';
import 'package:first/widgets/invest/InvestHeader.dart';
import 'package:first/widgets/invest/InvestInformation.dart';
import 'package:first/widgets/invest/InvestMargin.dart';
import 'package:first/widgets/invest/InvestRegularly.dart';
import 'package:first/widgets/invest/InvestYouLike.dart';
import 'package:flutter/material.dart';

class LCInvestPage extends StatefulWidget {
  LCInvestPage({Key key}) : super(key: key);

  @override
  _LCInvestPageState createState() => _LCInvestPageState();
}

class _LCInvestPageState extends State<LCInvestPage> {
  // RefreshController _refresh = RefreshController(initialRefresh: false);
  InvestModel model = InvestModel();
  bool isRequest = false;

  @override
  void initState() {
    super.initState();

    print("init  LCInvestPage");
    isRequest = true;
    getData();
  }

  getData() async {
    await Future.delayed(Duration(seconds: 1));
    LCWebRequstManager().request<InvestModel>(
        LCMethod.GET, RequestApi.investlist, success: (result) {
      print("结果 == $result");
      setState(() {
        isRequest = false;
        model = result;
      });
      // _refresh.refreshCompleted();
    }, error: (emsg) {
      // _refresh.refreshCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("投资")),
        body: isRequest
            ? LCLoading()
            : ListView(
                children: <Widget>[
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
                ],
              ));
  }
}
