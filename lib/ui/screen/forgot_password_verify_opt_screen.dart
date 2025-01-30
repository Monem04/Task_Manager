import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled/ui/screen/reset_password_screen.dart';
import 'package:untitled/ui/screen/sign_in_screen.dart';
import 'package:untitled/ui/screen/sign_up_screen.dart';
import 'package:untitled/ui/utils/app_colors.dart';
import 'package:untitled/ui/widgets/screen_backgrount.dart';

class ForgotPasswordVerifyOptScreen extends StatefulWidget {
  const ForgotPasswordVerifyOptScreen({super.key});

  static const String name = '/forgot-password/verify-otp';

  @override
  State<ForgotPasswordVerifyOptScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<ForgotPasswordVerifyOptScreen> {
  final TextEditingController _otpTEController = TextEditingController();
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
                  Text('PIN Verification', style: textTheme.titleLarge),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('A 6 digit of OTP has been sent your email address',
                  style: textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildPinCodeTextField(),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ResetPasswordScreen.name);
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

  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedColor: Colors.pinkAccent,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: _otpTEController,
      appContext: context,
    );
  }

  Widget _builsSignInSection() {
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
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamedAndRemoveUntil(
                    context, SignInScreen.name, (value) => false);
                // Add more actions here if needed
              },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
