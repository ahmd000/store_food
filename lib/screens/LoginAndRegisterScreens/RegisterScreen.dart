import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/api/controllers/auth_api_controller.dart';
import 'package:store_app/api/controllers/city_api_controller.dart';
import 'package:store_app/helpers/helpers.dart';
import 'package:store_app/models/Users.dart';
import 'package:store_app/models/city.dart';
import 'package:store_app/prefs/shared_pref_controller.dart';
import 'package:store_app/screens/LoginAndRegisterScreens/VerfictionScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/widgets/app_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  late TextEditingController _passwordTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _confirmPasswordTextController;
  int? _selectedAddress;
  String? _gender = "M";
  String? _nameErrorText;
  String? _phoneErrorText;
  String? _passwordErrorText;

  List<City> _city = <City>[];
  Future<List<City>>? _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();

    _future = CityApiController().getCity();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordTextController.dispose();
    _nameTextController.dispose();
    _phoneTextController.dispose();
    _confirmPasswordTextController.dispose();
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Register \nNew account',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32.sp,
                    ),
                  ),
                  SizedBox(height: 75.h),
                  AppTextField(
                    textEditingController: _nameTextController,
                    obscureText: false,
                    prefixIcon: Icons.person,
                    hint: 'Full Name',
                    errorText: _nameErrorText,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 24.h),
                  AppTextField(
                    textEditingController: _phoneTextController,
                    prefixIcon: Icons.phone,
                    hint: 'Phone Number',
                    errorText: _phoneErrorText,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "City",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Container(
                          child: FutureBuilder<List<City>>(
                              future: _future,
                              builder: (context, snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.data!.isNotEmpty) {
                                  _city = snapshot.data ?? [];
                                  return DropdownButton(
                                    items: _city.map((e) {
                                      return DropdownMenuItem(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: backgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Text(
                                              e.cityName,
                                              style: TextStyle(fontSize: 20.sp),
                                            ),
                                          ),
                                        ),
                                        value: e.id,
                                      );
                                    }).toList(),
                                    value: _selectedAddress,
                                    hint: Text(
                                      "select your ciy",
                                      style: TextStyle(color: Colors.amber),
                                    ),
                                    isExpanded: true,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                    ),
                                    elevation: 20,
                                    onChanged: (int? value) {
                                      if (value != null) {
                                        setState(() {
                                          _selectedAddress = value;
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      Icons.location_city_sharp,
                                      color: Colors.amber,
                                    ),
                                    dropdownColor: Colors.white70,
                                    menuMaxHeight: 300.h,
                                  );
                                } else {
                                  return Center(
                                    child: Text(
                                      "wait to load cities...",
                                      style: TextStyle(color: Colors.amber),
                                    ),
                                  );
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        RadioListTile<String>(
                          title: Text("Male"),
                          value: "M",
                          groupValue: _gender,
                          onChanged: (String? value) {
                            if (_gender != null)
                              setState(() {
                                _gender = value!;
                                print("Gender : $value");
                              });
                          },
                        ),
                        RadioListTile<String>(
                          title: Text("Female"),
                          value: "F",
                          groupValue: _gender,
                          onChanged: (String? value) {
                            if (_gender != null)
                              setState(() {
                                _gender = value!;
                                print("Gender : $value");
                              });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  AppTextField(
                    textEditingController: _passwordTextController,
                    prefixIcon: Icons.lock,
                    hint: 'Password',
                    textInputType: TextInputType.text,
                    obscureText: true,
                    errorText: _passwordErrorText,
                  ),
                  SizedBox(height: 24.h),
                  AppTextField(
                    textEditingController: _confirmPasswordTextController,
                    prefixIcon: Icons.lock,
                    hint: 'Confirm Password',
                    textInputType: TextInputType.text,
                    obscureText: true,
                    errorText: _passwordErrorText,
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => performRegister(),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(facebookLoginIcon),
                          width: 20.w,
                          height: 20.h,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          "Sign up with Facebook",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      minimumSize: Size(double.infinity, 50),
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
                              text: 'Already have an account?',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Sign In',
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 18),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pop(context);
                                      })
                              ]),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performRegister() async {
    if (checkData()) {
      await register();
    }
  }

  bool checkData() {
    if (_passwordTextController.text == _confirmPasswordTextController.text) {
      if (_nameTextController.text.isNotEmpty &&
          _phoneTextController.text.isNotEmpty &&
          _selectedAddress != 0 &&
          _gender != null &&
          _passwordTextController.text.isNotEmpty &&
          _confirmPasswordTextController.text.isNotEmpty) {
        return true;
      }
      showSnackBar(
        context: context,
        message: 'Enter required data!',
        error: true,
      );
      return false;
    }

    showSnackBar(
      context: context,
      message: 'Password does not match!',
      error: true,
    );
    return false;
  }

  Future<void> register() async {
    bool status = await AuthApiController().register(context, user: user);

    if (status) {
      Navigator.pushReplacement(

        context,
        MaterialPageRoute(

          builder: (context) =>
              VerfictionScreen(mobile: _phoneTextController.text),
        ),

      );
    }
  }

  Users get user {
    Users user = Users();
    user.name = _nameTextController.text;
    user.password = _passwordTextController.text;
    user.mobile = _phoneTextController.text;
    user.cityId = _selectedAddress!;
    user.gender = _gender!;

    return user;
  }
}
