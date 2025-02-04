import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/services/network_caller.dart';
import 'package:untitled/data/utils/urls.dart';
import 'package:untitled/ui/utils/app_colors.dart';
import 'package:untitled/ui/widgets/centered_circuler_progress_indicator.dart';
import 'package:untitled/ui/widgets/screen_backgrount.dart';
import 'package:untitled/ui/widgets/snak_bar_message.dart';

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
  bool _signUpInProgress = false;

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
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _firstNamelTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'First Name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your First name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNamelTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your Last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _mobilelTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Mobile',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your Mobile';
                      }
                      return null;
                    },
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
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  Visibility(
                    visible: _signUpInProgress == false,
                    replacement: const CenteredCirculerProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapSignUpButton,
                      child: Icon(Icons.arrow_circle_right_outlined),
                    ),
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

  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      _registerUser();
    }
  }

  Future<void> _registerUser() async {
    _signUpInProgress = true;
    setState(() {});

    Map<String, dynamic> requestParams = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNamelTEController.text.trim(),
      "lastName": _lastNamelTEController.text.trim(),
      "mobile": _mobilelTEController.text.trim(),
      "password": _passwordlTEController.text.trim(),
      "photo": ""
    };

    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Ursl.registrationUrl, body: requestParams);
    _signUpInProgress = false;
    setState(() {});
    if (response.isSuccess) {
      _clearTextFields();
      showSnakBarMessage(context,'New user registration successful');
    } else {
      showSnakBarMessage(context, response.errorMessage);
    }
  }

  void _clearTextFields() {
    _firstNamelTEController.clear();
    _lastNamelTEController.clear();
    _emailTEController.clear();
    _mobilelTEController.clear();
    _passwordlTEController.clear();
  }

  Widget _builsSignInSection() {
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
            recognizer: TapGestureRecognizer()
              ..onTap = () {
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
