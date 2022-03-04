import 'package:easypage/UI/homepage.dart';
import 'package:easypage/UI/services/theme_services.dart';
import 'package:easypage/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'UI/menu.dart';
import 'UI/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized ();
  await DBHelper.initDb();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp( const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeService ().theme,


      home: const MyNevBar()
    );
  }

}


