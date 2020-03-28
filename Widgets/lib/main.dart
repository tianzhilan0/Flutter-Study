
import 'package:flutter/material.dart';
import 'package:demo2/MyHomePage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

//基础类 Widget
import 'package:demo2/WidgetsBase/LCButton.dart';
import 'package:demo2/WidgetsBase/LCCheckBox.dart';
import 'package:demo2/WidgetsBase/LCImage.dart';
import 'package:demo2/WidgetsBase/LCOffstage.dart';
import 'package:demo2/WidgetsBase/LCSwitch.dart';
import 'package:demo2/WidgetsBase/LCText.dart';
import 'package:demo2/WidgetsBase/LCprogress.dart';
import 'package:demo2/WidgetsBase/LCtextField.dart';
import 'package:demo2/WidgetsBase/LCChip.dart';
import 'package:demo2/WidgetsBase/LCChoiceChip.dart';
import 'package:demo2/WidgetsBase/LCGestureDetector.dart';
import 'package:demo2/WidgetsBase/LCDivider.dart';

//容器类 Widget
import 'package:demo2/WidgetsBox/LCConstrainedBox.dart';
import 'package:demo2/WidgetsBox/LCContainer.dart';
import 'package:demo2/WidgetsBox/LCDecoratedBox.dart';
import 'package:demo2/WidgetsBox/LCFittedBox.dart';
import 'package:demo2/WidgetsBox/LCInkWell.dart';
import 'package:demo2/WidgetsBox/LCLimitedBox.dart';
import 'package:demo2/WidgetsBox/LCOverflowBox.dart';
import 'package:demo2/WidgetsBox/LCPadding.dart';
import 'package:demo2/WidgetsBox/LCRotatedBox.dart';
import 'package:demo2/WidgetsBox/LCSizedOverflowBox.dart';
import 'package:demo2/WidgetsBox/LCTransform.dart';
import 'package:demo2/WidgetsBox/LCFractionallySizedBox.dart';
import 'package:demo2/WidgetsBox/LCSizeBox.dart';

//布局类 Widget
import 'package:demo2/WidgetsLayout/LCColumn.dart';
import 'package:demo2/WidgetsLayout/LCFlex.dart';
import 'package:demo2/WidgetsLayout/LCRow.dart';
import 'package:demo2/WidgetsLayout/LCStack.dart';
import 'package:demo2/WidgetsLayout/LCWrap.dart';
import 'package:demo2/WidgetsLayout/LCExpanded.dart';
import 'package:demo2/WidgetsLayout/LCAlign.dart';
import 'package:demo2/WidgetsLayout/LCAspectRatio.dart';
import 'package:demo2/WidgetsLayout/LCBaseline.dart';
import 'package:demo2/WidgetsLayout/LCGridView.dart';
import 'package:demo2/WidgetsLayout/LCListView.dart';
import 'package:demo2/WidgetsLayout/LCCard.dart';
import 'package:demo2/WidgetsLayout/LCFlow.dart';
import 'package:demo2/WidgetsLayout/LCTable.dart';
import 'package:demo2/WidgetsLayout/LCCheckboxListTile.dart';
import 'package:demo2/WidgetsLayout/LCListTitle.dart';
import 'package:demo2/WidgetsLayout/LCRadioListTile.dart';
import 'package:demo2/WidgetsLayout/LCSwitchListTile.dart';
import 'package:demo2/WidgetsLayout/LCCustomScrollView.dart';
import 'package:demo2/WidgetsLayout/LCSingleChildScrollView.dart';
import 'package:demo2/WidgetsLayout/LCNestedScrollView.dart';

//复杂类 Widget
import 'package:demo2/WidgetsComplex/LCPopupMenuButton.dart';
import 'package:demo2/WidgetsComplex/LCAlertDialog.dart';
import 'package:demo2/WidgetsComplex/LCShowDatePicker.dart';
import 'package:demo2/WidgetsComplex/LCSnackBar.dart';
import 'package:demo2/WidgetsComplex/LCStream.dart';
import 'package:demo2/WidgetsComplex/LCInheritedWidget.dart';
import 'package:demo2/WidgetsComplex/LCDrawer.dart';

//第三方工具
import 'package:demo2/Tools/LCHttpRequest.dart';
import 'package:demo2/Tools/LCJson.dart';
import 'package:demo2/Tools/LCSharedPreferences.dart';
import 'package:demo2/Tools/LCToast.dart';
import 'package:demo2/Tools/LCProvider.dart';
import 'package:demo2/Tools/LCRxDart.dart';
import 'package:demo2/Tools/LCRefresh.dart';
import 'package:demo2/Tools/LCLoading.dart';
import 'package:demo2/Tools/LCWebView.dart';
import 'package:demo2/Tools/LCImagePicker.dart';
import 'package:demo2/Tools/LCSystemCamera.dart';
import 'package:demo2/Tools/LCCamera.dart';

//扩展
import 'package:demo2/Extends/LCLogin.dart';
import 'package:demo2/Extends/LCSwiper.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true;
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: MultiProvider(

        /// 注意MultiProvider的用法！
        providers: [
          ChangeNotifierProvider(create: (_) => ProviderPostData({})),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          localizationsDelegates: [
            GlobalEasyRefreshLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('zh', 'CN'),
          ],
          home: MyHomePage(),
          routes: <String, WidgetBuilder>{
            //基础类 Widget
            '/text': (_) => LCText(),
            '/textField': (_) => LCTextField(),
            '/button': (_) => LCButton(),
            '/image': (_) => LCImage(),
            '/checkbox': (_) => LCCheckBox(),
            '/choiceChip': (_) => LCChoiceChip(),
            '/switch': (_) => LCSwitch(),
            '/progress': (_) => LCProgress(),
            '/offstage': (_) => LCOffstage(),
            '/gestureDetector': (_) => LCGestureDetector(),
            '/chip': (_) => LCChip(),
            '/divider': (_) => LCDivider(),

            //容器类 Widget
            '/padding': (_) => LCPadding(),
            '/container': (_) => LCContainer(),
            '/inkWell': (_) => LCInkWell(),
            '/transform': (_) => LCTransform(),
            '/constrainedbox': (_) => LCConstrainedBox(),
            '/decoratedbox': (_) => LCDecoratedBox(),
            '/rotatedbox': (_) => LCRotatedBox(),
            '/fittedbox': (_) => LCFittedBox(),
            '/limitedBox': (_) => LCLimitedBox(),
            '/overflowBox': (_) => LCOverflowBox(),
            '/sizedBox': (_) => LCSizeBox(),
            '/sizedOverflowBox': (_) => LCSizedOverflowBox(),
            '/fractionallySizedBox': (_) => LCFractionallySizedBox(),

            //布局类 Widget
            '/row': (_) => LCRow(),
            '/column': (_) => LCColumn(),
            '/flex': (_) => LCFlex(),
            '/wrap': (_) => LCWrap(),
            '/stack': (_) => LCStack(),
            '/expanded': (_) => LCExpanded(),
            '/align': (_) => LCAlign(),
            '/aspectratio': (_) => LCAspectRatio(),
            '/baseline': (_) => LCBaseline(),
            '/listView': (_) => LCListView(),
            '/gridView': (_) => LCGridView(),
            '/card': (_) => LCCard(),
            '/flow': (_) => LCFlow(),
            '/table': (_) => LCTable(),
            '/listTitle': (_) => LCListTitle(),
            '/checkboxListTile': (_) => LCCheckboxListTile(),
            '/radioListTile': (_) => LCRadioListTile(),
            '/switchListTile': (_) => LCSwitchListTile(),
            '/singleChildScrollView': (_) => LCSingleChildScrollView(),
            '/customScrollView': (_) => LCCustomScrollView(),
            '/nestedScrollView': (_) => LCNestedScrollView(),

            //复杂类 Widget
            '/popupMenuButton': (_) => LCPopupMenuButton(),
            '/alertDialog': (_) => LCAlertDialog(),
            '/showDatePicker': (_) => LCShowDatePicker(),
            '/snackBar': (_) => LCSnackBar(),
            '/steam': (_) => LCStream(),
            '/inheritedWidget': (_) => LCInheritedWidget(),
            '/drawer': (_) => LCDrawer(),

            //tools
            '/http': (_) => LCHttpRequest(),
            '/json': (_) => LCJson(),
            '/toast': (_) => LCToast(),
            '/shared_preferences': (_) => LCSharedPreferences(),

            //第三方
            '/json': (_) => LCJson(),
            '/toast': (_) => LCToast(),
            '/shared_preferences': (_) => LCSharedPreferences(),
            '/provider': (_) => LCProvider(),
            '/rxDart': (_) => LCRxDart(),
            '/swiper': (_) => LCSwiper(),
            '/refresh': (_) => LCRefresh(),
            '/loading': (_) => LCLoading(),
            '/webView': (_) => LCWebView(),
            '/imagePicker': (_) => LCImagePicker(),
            '/systemCamera': (_) => LCSystemCamera(),
            '/camera': (_) => LCCamera(),

            //扩展
            '/login': (_) => LCLogin(),
            // '/shared_preferences': (_) => LCSharedPreferences(),
            // '/shared_preferences': (_) => LCSharedPreferences(),
            // '/shared_preferences': (_) => LCSharedPreferences(),
            // '/shared_preferences': (_) => LCSharedPreferences(),
          },
        )));
  }
}
