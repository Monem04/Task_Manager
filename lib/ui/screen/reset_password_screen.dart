import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/screen/sign_in_screen.dart';
import 'package:untitled/ui/utils/app_colors.dart';
import 'package:untitled/ui/widgets/screen_backgrount.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static const String name = '/forgot-password/reset-password';

  @override
  State<ResetPasswordScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordTEController =
      TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
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
                  Text('Set Password', style: textTheme.titleLarge),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                      'Minimum length of password should be more then 8 letter',
                    style: textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _newPasswordTEController,
                    decoration: InputDecoration(hintText: 'New Password'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _confirmPasswordTEController,
                    decoration:
                        InputDecoration(hintText: 'Confirm new Password'),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Confirm'),
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
    _newPasswordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
