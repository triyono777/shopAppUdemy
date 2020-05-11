import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyB7-boybs7SCE9Q5qIoLB4vNaVbOt4D0rU';
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    debugPrint(jsonDecode(response.body));
  }

  Future<void> signup(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB7-boybs7SCE9Q5qIoLB4vNaVbOt4D0rU';
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }

  Future<void> login(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyB7-boybs7SCE9Q5qIoLB4vNaVbOt4D0rU';
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
  }
}
