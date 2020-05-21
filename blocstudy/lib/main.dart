import 'package:blocstudy/CustomLocalizations.dart';
import 'package:blocstudy/blocs/application_bloc.dart';
import 'package:blocstudy/blocs/bloc_provider.dart';
import 'package:blocstudy/blocs/main_bloc.dart';
import 'package:blocstudy/common/SpHelper.dart';
import 'package:blocstudy/common/common.dart';
import 'package:blocstudy/common/global.dart';
import 'package:blocstudy/models/LanguageModel.dart';
import 'package:blocstudy/res/index.dart';
import 'package:blocstudy/utils/DirectoryUtil.dart';
import 'package:blocstudy/utils/sputil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Global.init(() {
    runApp(BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: BlocProvider(child: MyApp(), bloc: MainBloc()),
    ));
  });
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Locale _locale;
  Color _themeColor = Colours.app_main;

  @override
  void initState() {
    super.initState();
    setInitDir(initStorageDir: true);

    setLocalizedValues(localizedValues);
    init();

  }

  void init() {
    _init();
    _initListener();
    _loadLocale();
  }

  void _init() {
//    DioUtil.openDebug();
    // Options options = DioUtil.getDefOptions();
    // options.baseUrl = Constant.server_address;
    // String cookie = SpUtil.getString(BaseConstant.keyAppToken);
    // if (ObjectUtil.isNotEmpty(cookie)) {
    //   Map<String, dynamic> _headers = new Map();
    //   _headers["Cookie"] = cookie;
    //   options.headers = _headers;
    // }
    // HttpConfig config = new HttpConfig(options: options);
    // DioUtil().setConfig(config);
  }

    void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {
      _loadLocale();
    });
  }

    void _loadLocale() {
    setState(() {
      LanguageModel model =
          SpUtil.getObj(Constant.keyLanguage, (v) => LanguageModel.fromJson(v));
      if (model != null) {
        _locale = new Locale(model.languageCode, model.countryCode);
      } else {
        _locale = null;
      }

      String _colorKey = SpHelper.getThemeColor();
      if (themeColorMap[_colorKey] != null)
        _themeColor = themeColorMap[_colorKey];
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        // BaseConstant.routeMain: (ctx) => MainPage(),
      },
      home: new SplashPage(),
      theme: ThemeData.light().copyWith(
        primaryColor: _themeColor,
        accentColor: _themeColor,
        indicatorColor: Colors.white,
      ),
      locale: _locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        CustomLocalizations.delegate
      ],
      supportedLocales: CustomLocalizations.supportedLocales,
    );
  }
}
