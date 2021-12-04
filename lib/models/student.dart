
class Student {
 late int id;
 late String fullName;
 late String email;
 late String gender;
 late String phone ;
 late String? fcmToken;
 late String token;
 late String refreshToken;
 late bool isActive;

 late String passsword;

  Student();

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    isActive = json['is_active'];
  }
}