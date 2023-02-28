import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/* for any auth function 
first
final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
then after body 
headers: {'Authorization': 'token $value'}

sample of post 
final response = await http.post(myUrl, body: {"username": "$username", "password": "$password"});
sample of get 
http.Response response =await http.get(myUrl);
any get should
return json.decode(response.body);
*/
class DatabaseHelper {
  var status;
  var loginEmailStatus, loginEmailStatus1, loginUsernameStatus;
  var token;
//1 login
  loginData(String username, String password) async {
    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'get_user_info/',
    );
    final response = await http
        .post(myUrl, body: {"username": "$username", "password": "$password"});
    status = response.body.contains('Incorrect username or password');
    var data = json.decode(response.body);
    if (status) {
    } else {
      _save(data[0]);
    }
  }
  //2 register

  registerData(
    String national_number,
    String phone,
    String email,
    String username,
    String password,
  ) async {
    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'register/',
    );
    final response = await http.post(myUrl, body: {
      "national_number": "$national_number",
      "phone": "$phone",
      "email": email,
      "username": "$username",
      "password": "$password",
    });
    status = response.body.contains('error');
    loginEmailStatus1 =
        response.body.contains('A user with that Email already exists.');
    loginEmailStatus = response.body.contains('Enter a valid email address');
    loginUsernameStatus =
        response.body.contains('A user with that username already exists');

    var data = response.body;

    if (status) {
      print(data);
    } else {
      print(data);
      _save(data);
    }
  }

  //3 card info
  addcard(
      String FirstName,
      String SecondName,
      String ThirdName,
      String FourtName,
      String Birthdate,
      String Placeof_Birth,
      String Blood_Type,
      String center,
      String Job,
      String Address,
      int Phone,
      int Old_id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'card_info/',
    );
    final response = await http.post(myUrl, headers: {
      'Authorization': 'token $value'
    }, body: {
      "FirstName": "$FirstName",
      "SecondName": "$SecondName",
      "ThirdName": "$ThirdName",
      "FourthName": "name",
      "Birthdate": "1999-10-07",
      "Placeof_Birth": "$Placeof_Birth",
      "Blood_Type": "$Blood_Type",
      "center": "$center",
      "Job": "$Job",
      "Address": "$Address",
      "Phone": "$Phone",
      "Old_id": "$Old_id"
    });

    print('Response status : ${response.statusCode}');
    print('Response body : ${response.body}');

    status = response.toString().contains('error');
  }

  //4 payment
  /////????????????????????????????????????????????????????????
  payment(int process_number) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    final picker = ImagePicker();

    var file = await picker.pickImage(
      source: ImageSource.gallery,
    );

    var mFile = MultipartFile.fromBytes(
      "payment_Notification",
      File(file?.path ?? "").readAsBytesSync(),
      filename: file?.name.split("/").last,
    );

    // Uri myUrl = Uri(
    //   scheme: 'http',
    //   host: 'maisala7.pythonanywhere.com',
    //   path: 'Payment_confirmation/',
    // );

    // final response = await http.post(
    //   myUrl,
    //   headers: {'Authorization': 'token $value'},
    //   body: {
    //     "process_number": "123456",
    //     "payment_Notification": file,
    //   },
    // );

    var request = MultipartRequest(
      'POST',
      Uri.parse("http://maisala7.pythonanywhere.com/Payment_confirmation"),
    );

    request.headers.addAll({"Authorization": "token $token"});
    request.fields.addAll({"process_number": "12345"});
    request.files.add(mFile);

    var response = await request.send();

    status = response.toString().contains('error');
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }
}
