part of 'models.dart';
class GlobalResponse {
  String? message;
  bool? status;

  GlobalResponse({this.message, this.status});

  GlobalResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
