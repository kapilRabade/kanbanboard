class ApiResponse {
  bool? status;
  bool? success;
  String? type;
  String? message;
  String? error;
  dynamic response;
  int? otp;
  String? token;

  ApiResponse(this.status, this.message, this.error, this.response, this.type,
      {this.success});

  ApiResponse.fromJson(Map<String, dynamic> json) {

    success = json['status'];
    message = json['msg'] != null ? json['msg'].toString() : null;
    token = json['token'];

  //  response = json['data'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['success'] = this.success;
    map['message'] = this.message;
    map['token'] = this.token;

   // map['response'] = this.response;
    map['type'] = this.type;
    return response;
  }
}
