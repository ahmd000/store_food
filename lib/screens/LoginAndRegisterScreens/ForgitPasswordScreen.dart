import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:store_app/helpers/helpers.dart';
import 'package:store_app/widgets/app_text_field.dart';
import 'package:store_app/widgets/code_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> with Helpers {
  late TextEditingController _phoneTextController;

  String? _code;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Text(
            "Forgot \nPassword?",
            style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 112.h),
          AppTextField(
            hint: 'Enter Mobile Number',
            textEditingController: _phoneTextController,
            prefixIcon: Icons.phone,
            textInputType: TextInputType.number,
            // errorText: "Please provide your phone Number to reset your password",
            obscureText: false,
          ),
          SizedBox(height: 40.h),
          ElevatedButton(
            onPressed: () async => await performMobileNumber(),
            child: const Text('RESET PASSWORD'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(0, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Have an account? ',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Login here',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 18),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                            })
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performMobileNumber() async {
    if (checkData()) {
      await resetPassword();
    }
  }

  bool checkData() {
    if (checkPhoneNumber()) {
      return true;
    }
    return false;
  }

  bool checkPhoneNumber() {
    if (_phoneTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
        context: context, message: 'Mobile Number required!', error: true);
    return false;
  }

  Future<void> resetPassword() async {
    Navigator.pushNamed(context, "/reset_screen");

    // bool status = await AuthApiController().resetPassword(
    //   context,
    //   email: widget.email,
    //   code: _code!,
    //   password: _newPasswordTextController.text,
    // );
    // if (status) Navigator.pop(context);
  }
}
