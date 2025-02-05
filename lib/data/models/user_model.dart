class UserModel {
  String? email;
  String? firstname;
  String? lastname;
  String? mobile;
  String? photo;

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    mobile = json['mobile'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstname,
      'lastName': lastname,
      'mobile': mobile,
      'photo': photo,
    };
  }
}
