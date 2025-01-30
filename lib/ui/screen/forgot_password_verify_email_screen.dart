import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/screen/forgot_password_verify_opt_screen.dart';
import 'package:untitled/ui/screen/sign_up_screen.dart';
import 'package:untitled/ui/utils/app_colors.dart';
import 'package:untitled/ui/widgets/screen_backgrount.dart';

class ForgotPasswordVerifyEmailScreen extends StatefulWidget {
  const ForgotPasswordVerifyEmailScreen({super.key});

  static const String name = '/forgot-password/verify-email';

  @override
  State<ForgotPasswordVerifyEmailScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<ForgotPasswordVerifyEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackgrount(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text('Your Email Address', style: textTheme.titleLarge),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('A 6 digit of OTP will be sent your email address',
                    style: textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),

                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, ForgotPasswordVerifyOptScreen.name);
                    },
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: _builsSignInSection(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _builsSignInSection(){
    return RichText(
      text: TextSpan(
        text: "Have an account? ",
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: 'Sign in',
            style: TextStyle(
              color: AppColos.themeColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.pop(context);
              // Add more actions here if needed
            },
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
