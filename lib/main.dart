import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:vertex_fb_auth_template/views/login_screen_view.dart';
import 'controllers/auth_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox(themeBox);
  runApp(MyApp());
}

const themeBox = 'hiveThemeBox';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(themeBox).listenable(),
      builder: (context, value, child) {
        var darkMode = Hive.box(themeBox).get('darkMode', defaultValue: true);

        return GetMaterialApp(
          title: 'Firebase Auth Template',
          debugShowCheckedModeBanner: false,
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoaderOverlay(child: LoginPage()),
        );
      },
    );
  }
}
