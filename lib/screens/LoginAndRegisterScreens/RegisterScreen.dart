import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/api/controllers/auth_api_controller.dart';
import 'package:store_app/helpers/helpers.dart';
import 'package:store_app/models/cityAddresses.dart';
import 'package:store_app/models/student.dart';
import 'package:store_app/widgets/app_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _confirmPasswordTextController;
  int? _cityValue;
  String _gender = "M";
  String? _emailErrorText;
  String? _nameErrorText;
  String? _phoneErrorText;
  String? _passwordErrorText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _nameTextController.dispose();
    _phoneTextController.dispose();
    _confirmPasswordTextController.dispose();
    super.dispose();
  }

  List<CityAddresses> _cities = <CityAddresses>[
    CityAddresses(id: 1, name: "Gaza"),
    CityAddresses(id: 2, name: "Deir Al-Balah"),
    CityAddresses(id: 3, name: "Khanyounis"),
    CityAddresses(id: 4, name: "Al Nosyrat"),
    CityAddresses(id: 5, name: "Al Borayj"),
    CityAddresses(id: 6, name: "Al Mghazi"),
    CityAddresses(id: 7, name: "Rafah"),
    CityAddresses(id: 8, name: "Al Zwayda"),
    CityAddresses(id: 9, name: "Jbalya"),
    CityAddresses(id: 10, name: "Beit Lahya"),
    CityAddresses(id: 11, name: "Biet Hanoon"),
  ];

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
                    textInputType: TextInputType.text,
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
                        DropdownButton(
                          value: _cityValue,
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
                                _cityValue = value;
                                print(value);
                              });
                            }
                          },
                          icon: Icon(
                            Icons.location_city_sharp,
                            color: Colors.amber,
                          ),
                          dropdownColor: Colors.white70,
                          menuMaxHeight: 300.h,
                          items: _cities.map((e) {
                            return DropdownMenuItem(
                              child: Container(
                                width: double.infinity,
                                alignment: AlignmentDirectional.centerStart,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.amber.shade300,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 20.w),
                                  child: Text(
                                    e.name,
                                    style: TextStyle(
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              value: e.id,
                            );
                          }).toList(),
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
                    //  onPressed: () => performRegister(),
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
                    onPressed: () {
                      Navigator.pushNamed(context, "/verify_screen");
                    },
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () => performRegister(),
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
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _nameTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> register() async {
    bool status = await AuthApiController().register(context, student: student);
    if (status) Navigator.pushNamed(context, "/verify_screen");
  }

  Student get student {
    Student student = Student();
    student.fullName = _nameTextController.text;
    student.email = _emailTextController.text;
    student.passsword = _passwordTextController.text;
    student.phone = _phoneTextController.text;
    return student;
  }
}
