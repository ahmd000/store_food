import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/api/controllers/auth_api_controller.dart';
import 'package:store_app/api/controllers/city_api_controller.dart';
import 'package:store_app/get/cities_getx_controller.dart';
import 'package:store_app/get/language_getx_controller.dart';
import 'package:store_app/helpers/helpers.dart';
import 'package:store_app/models/city.dart';
import 'package:store_app/prefs/shared_pref_controller.dart';
import 'package:store_app/widgets/app_text_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen>
    with Helpers {
  late TextEditingController _passwordTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _confirmPasswordTextController;
  int? _selectedAddress;
  String? gender = "M";
  String? _nameErrorText;
  String? _phoneErrorText;
  String? _passwordErrorText;

  List<City> city = <City>[];
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
    GetxControllerCiteis controller = Get.put(GetxControllerCiteis());
    final indexCity = controller.city
        .indexWhere((element) => element.id == SharedPrefController().city_id);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Update Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
        children: [
          SizedBox(
            height: 100.h,
          ),
          AppTextField(
            textEditingController: _nameTextController,
            obscureText: false,
            prefixIcon: Icons.person,
            hint: 'Full Name',
            errorText: _nameErrorText,
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
                Container(
                  child: FutureBuilder<List<City>>(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          city = snapshot.data ?? [];
                          return DropdownButton(
                            items: city.map((e) {
                              return DropdownMenuItem(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(20),
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
                  groupValue: gender,
                  onChanged: (String? value) {
                    if (gender != null)
                      setState(() {
                        gender = value!;
                        print("Gender : $value");
                      });
                  },
                ),
                RadioListTile<String>(
                  title: Text("Female"),
                  value: "F",
                  groupValue: gender,
                  onChanged: (String? value) {
                    if (gender != null)
                      setState(() {
                        gender = value!;
                        print("Gender : $value");
                      });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 180.h),
          ElevatedButton(
              onPressed: () {
                performUpdateProfile();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                fixedSize: Size(0, 50),
                elevation: 15,
              ),
              child: Text(
                "Update",
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  Future performUpdateProfile() async {
    if (checkData()) {
      await updateProfile();
    }
  }

  bool checkData() {
    if (_nameTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context: context, message: "Check data required", error: true);

    return false;
  }

  Future updateProfile() async {
    bool status = await AuthApiController().updateProfile(context,
        city_id: _selectedAddress!,
        name: _nameTextController.text,

        gender: gender!);
    if (status) {
      SharedPrefController().setUserName(_nameTextController.text);
      SharedPrefController().setGender(gender!);
      SharedPrefController().setCityId(_selectedAddress!);
      Navigator.pop(context);
    }
  }
}
