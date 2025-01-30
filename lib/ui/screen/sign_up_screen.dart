import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/utils/app_colors.dart';
import 'package:untitled/ui/widgets/screen_backgrount.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordlTEController = TextEditingController();
  final TextEditingController _firstNamelTEController = TextEditingController();
  final TextEditingController _lastNamelTEController = TextEditingController();
  final TextEditingController _mobilelTEController = TextEditingController();
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
                  Text('Join With Us', style: textTheme.titleLarge),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _firstNamelTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNamelTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _mobilelTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Mobile',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordlTEController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
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
        text: "Already have an account? ",
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
            },
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNamelTEController.dispose();
    _lastNamelTEController.dispose();
    _mobilelTEController.dispose();
    _passwordlTEController.dispose();
    super.dispose();
  }
}
