import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/localization_controller.dart';
import 'helper/get_di.dart';
import 'helper/route_helper.dart';
import 'theme/light_theme.dart';
import 'util/app_constants.dart';
import 'util/messages.dart';
import 'view/screens/dashboard/dashboard.dart';

void main() async{
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await init();
  runApp( MyApp(languages: languages,));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({Key? key, required this.languages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(

        builder: (localizeController) {
          return GetMaterialApp(
            /*  useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,*/
            theme: light,
            // initialRoute: RouteHelper.getSplashRoute(),
            getPages: RouteHelper.routes,
            debugShowCheckedModeBanner: false,
            title: 'Isle',
            locale: localizeController.locale,
            fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),
            translations: Messages(languages: languages),
            /*  theme: ThemeData(
            iconTheme: IconThemeData(color: Colors.green),
            primarySwatch: Colors.green,
          ),*/
            home: const Dashboard( pageIndex: 0,),
            // home: IconScrolling(),
            // home: MyApp2(),
          );
        }
    );
  }
}

