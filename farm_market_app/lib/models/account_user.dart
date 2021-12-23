// // To parse this JSON data, do
// //
// //     final userModel = userModelFromJson(jsonString);
//
// import 'dart:convert';
//
// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
//
// String userModelToJson(UserModel data) => json.encode(data.toJson());
//
// class UserModel {
//   UserModel({
//     this.account,
//     this.token,
//   });
//
//   Account? account;
//   String? token;
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//     account: Account.fromJson(json["account"]),
//     token: json["token"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "account": account!.toJson(),
//     "token": token,
//   };
// }
//
// class Account {
//   Account({
//     this.accountId,
//     this.phoneNumber,
//     this.userName,
//     this.password,
//     this.confirmPassword,
//     this.keySecurity,
//     this.address,
//     this.fullName,
//     this.email,
//     this.avatar,
//     this.numberOfPost,
//     this.moneyOfOver,
//     this.createDate,
//     this.isDelete,
//     this.rolesId,
//     this.roles,
//     this.historyMoneys,
//     this.loves,
//     this.reviews,
//   });
//
//   int? accountId;
//   String? phoneNumber;
//   String? userName;
//   String? password;
//   String? confirmPassword;
//   String? keySecurity;
//   String? address;
//   String? fullName;
//   String? email;
//   String? avatar;
//   int? numberOfPost;
//   int? moneyOfOver;
//   DateTime? createDate;
//   bool? isDelete;
//   int? rolesId;
//   String? roles;
//   List<dynamic>? historyMoneys;
//   List<dynamic>? loves;
//   List<dynamic>? reviews;
//
//   factory Account.fromJson(Map<String, dynamic> json) => Account(
//     accountId: json["accountId"],
//     phoneNumber: json["phoneNumber"],
//     userName: json["userName"],
//     password: json["password"],
//     confirmPassword: json["confirmPassword"],
//     keySecurity: json["keySecurity"],
//     address: json["address"],
//     fullName: json["fullName"],
//     email: json["email"],
//     avatar: json["avatar"],
//     numberOfPost: json["numberOfPost"],
//     moneyOfOver: json["moneyOfOver"],
//     createDate: DateTime.parse(json["createDate"]),
//     isDelete: json["isDelete"],
//     rolesId: json["rolesId"],
//     roles: json["roles"],
//     historyMoneys: List<dynamic>.from(json["historyMoneys"].map((x) => x)),
//     loves: List<dynamic>.from(json["loves"].map((x) => x)),
//     reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "accountId": accountId,
//     "phoneNumber": phoneNumber,
//     "userName": userName,
//     "password": password,
//     "confirmPassword": confirmPassword,
//     "keySecurity": keySecurity,
//     "address": address,
//     "fullName": fullName,
//     "email": email,
//     "avatar": avatar,
//     "numberOfPost": numberOfPost,
//     "moneyOfOver": moneyOfOver,
//     "createDate": createDate!.toIso8601String(),
//     "isDelete": isDelete,
//     "rolesId": rolesId,
//     "roles": roles,
//     "historyMoneys": List<dynamic>.from(historyMoneys!.map((x) => x)),
//     "loves": List<dynamic>.from(loves!.map((x) => x)),
//     "reviews": List<dynamic>.from(reviews!.map((x) => x)),
//   };
// }
