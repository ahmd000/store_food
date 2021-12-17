import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/helpers/helpers.dart';
import 'package:store_app/widgets/app_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>
    with Helpers {
  late TextEditingController _currentPasswordTextEditingController;
  late TextEditingController _newPasswordTextEditingController;
  late TextEditingController _newPasswordConfirmationTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _currentPasswordTextEditingController = TextEditingController();
    _newPasswordTextEditingController = TextEditingController();
    _newPasswordConfirmationTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _currentPasswordTextEditingController.dispose();
    _newPasswordTextEditingController.dispose();
    _newPasswordConfirmationTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff23203F),
          ),
        ),
        title: Text(
            // AppLocalizations.of(context)!.resetPassword,
            'Change Password',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        elevation: 15.sp,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          SizedBox(
            height: 50.h,
          ),
          Text(
            'Enter New Password',
            style: TextStyle(
              color: const Color(0xff23203F),
              fontWeight: FontWeight.bold,
              fontSize: 30.sp,
            ),
          ),
          Text(
            'Are you sure you want to change the password?',
            style: TextStyle(color: const Color(0xff716F87), fontSize: 18.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextField(
            textEditingController: _currentPasswordTextEditingController,
            textInputType: TextInputType.text,
            obscureText: true,
            hint: 'Current Password',
            prefixIcon: Icons.nfc,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextField(
            hint: 'New Password',
            textEditingController: _newPasswordTextEditingController,
            textInputType: TextInputType.text,
            obscureText: true,
            prefixIcon: Icons.nfc,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextField(
            hint: 'Password Confirmation',
            prefixIcon: Icons.nfc,
            textEditingController:
                _newPasswordConfirmationTextEditingController,
            textInputType: TextInputType.text,
            obscureText: true,
          ),
          SizedBox(
            height: 40.h,
          ),
          ElevatedButton(
            onPressed: () async => await performChangePassword(),
            style: ElevatedButton.styleFrom(

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              minimumSize: Size(0.w, 56.h),
            ),
            child: Text(
              'Change Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performChangePassword() async {
    if (checkData()) {
      await changePassword();
    }
  }

  bool checkData() {
    if (checkPassword()) {
      return true;
    }
    return false;
  }

  bool checkPassword() {
    if (_currentPasswordTextEditingController.text.isNotEmpty &&
        _newPasswordTextEditingController.text.isNotEmpty &&
        _newPasswordConfirmationTextEditingController.text.isNotEmpty) {
      if (_newPasswordTextEditingController.text ==
          _newPasswordConfirmationTextEditingController.text) {
        return true;
      }
      showSnackBar(
        context: context,
        message: 'Password confirmation error!',
        error: true,
      );
      return false;
    }
    showSnackBar(
      context: context,
      message: 'Enter New Password!',
      error: true,
    );
    return false;
  }

  Future<void> changePassword() async {
    //   bool status = await AuthApiController().resetPassword(
    //       context,
    //       mobile: widget.mobile,
    //       code: _code!,
    //       password: _newPasswordTextEditingController.text,
    //   );
    //   if (status) Navigator.pop(context);
  }
}
