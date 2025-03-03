import 'package:flutter/material.dart';
import 'package:untitled/ui/screen/add_new_task_screen.dart';
import 'package:untitled/ui/screen/forgot_password_verify_email_screen.dart';
import 'package:untitled/ui/screen/forgot_password_verify_opt_screen.dart';
import 'package:untitled/ui/screen/main_bottom_nev_screen.dart';
import 'package:untitled/ui/screen/reset_password_screen.dart';
import 'package:untitled/ui/screen/sign_in_screen.dart';
import 'package:untitled/ui/screen/sign_up_screen.dart';
import 'package:untitled/ui/screen/splash_screen.dart';
import 'package:untitled/ui/screen/update_profile_screen.dart';
import 'package:untitled/ui/utils/app_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
          ),
          titleSmall: TextStyle(
            color: Colors.grey,
            fontSize: 14,
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
        }else if (settings.name == SignUpScreen.name){
          widget = const SignUpScreen();
        }else if (settings.name == ForgotPasswordVerifyEmailScreen.name){
          widget = const ForgotPasswordVerifyEmailScreen();
        }else if (settings.name == ForgotPasswordVerifyOptScreen.name){
          widget = const ForgotPasswordVerifyOptScreen();
        }else if (settings.name == ResetPasswordScreen.name){
          widget = const ResetPasswordScreen();
        }else if (settings.name == MainBottomNevScreen.name){
          widget = const MainBottomNevScreen();
        }else if (settings.name == AddNewTaskScreen.name){
          widget = const AddNewTaskScreen();
        }else if (settings.name == UpdateProfileScreen.name){
          widget = const UpdateProfileScreen();
        }
        return MaterialPageRoute(builder: (_) => widget);
      },
    );
  }
}
