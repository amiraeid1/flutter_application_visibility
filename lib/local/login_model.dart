

class LogInModel {
  final String? phone, password;
  LogInModel({this.phone, this.password});

  factory LogInModel.fromJson( json) =>
      LogInModel(password: json['password'], phone: json['phone']);

  static Map<String, dynamic> toMap(
          {required String phone, required String password}) =>
      <String, dynamic>{'phone': phone, 'password': password};
}
