import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<ApiResponse> apiCallLogin(var email) async {
    print(email);

    var url = Uri.parse(
        'https://astromagic-dtigcqgjva-em.a.run.app/api/user/sendOTP');
    http.Response response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{"email": email}));

    print(response.statusCode);

    if (response.statusCode == 200) {
      print("login successfully");
    }

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode(response.body);
    return ApiResponse(status: response.statusCode, msg: data["message"]);
  }

  Future<ApiResponse> apiCallVerify(var email, var otp) async {
    print(email);

    var url = Uri.parse(
        'https://astromagic-dtigcqgjva-em.a.run.app/api/user/verifyOTP');
    http.Response response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{"otp": otp, "email": email}));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode(response.body);
    return ApiResponse(status: response.statusCode, msg: data["message"]);
  }
}

class ApiResponse {
  final String? msg;
  final int? status;

  ApiResponse({this.status, this.msg});
}
