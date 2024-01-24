// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChangePasswordRequestModel {
  String? oldPassword;
  String? newPassword;

  ChangePasswordRequestModel({
    this.oldPassword,
    this.newPassword,
  });

  ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) {
    oldPassword = json['old_password'];
    newPassword = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['old_password'] = oldPassword;
    data['new_password'] = newPassword;
    return data;
  }
}
