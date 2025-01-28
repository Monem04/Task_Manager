import 'package:flutter/material.dart';
import 'package:untitled/ui/screen/sign_in_screen.dart';
import 'package:untitled/ui/screen/splash_screen.dart';
import 'package:untitled/ui/utils/app_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(
        colorSchemeSeed: AppColos.themeColor,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          fillColor: Colors.white,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),

        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColos.themeColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              fixedSize: Size.fromWidth(double.maxFinite),
              padding: EdgeInsets.symmetric(
                  horizontal: 16, vertical: 10),
              foregroundColor: Colors.white,
              textStyle: TextStyle(
                fontSize: 16),),
        )
      ),
      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if (settings.name == SplashScreen.name){
          widget = const SplashScreen();
        }
        else if (settings.name == SignInScreen.name){
          widget = const SignInScreen();
        }
        return MaterialPageRoute(builder: (_) => widget);
      },
    );
  }
}
