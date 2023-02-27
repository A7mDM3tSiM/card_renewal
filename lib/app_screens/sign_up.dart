import 'package:card_renewal/api/database_helper.dart';
import 'package:card_renewal/app_screens/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Sign_up extends StatefulWidget {
  const Sign_up(this.language, {super.key});
  final int language;
  @override
  State<StatefulWidget> createState() {
    return SignupState(language);
  }
}

class SignupState extends State<Sign_up> {
  final int language;
  DatabaseHelper _databaseHelper = DatabaseHelper();

  SignupState(this.language);
  final GlobalKey<FormState> _sign_upformkey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final nationalnumberController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 11, 35, 55),
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    'images/im.jpg.jpg',
                  )),
            ),
            elevation: 0,
            actions: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 135, 159, 196),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(
                      'images/im.jpg.jpg',
                    )),
              ),
            ]),
        //background color
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 229, 234, 237),
                Color.fromARGB(255, 188, 178, 178),
              ],
            )),
            child: Form(
              key: _sign_upformkey,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 9.0, left: 22.0, right: 22.0, bottom: 10.0),
                child: ListView(children: [
                  Align(
                    alignment:
                        language == 2 ? Alignment.topRight : Alignment.topLeft,
                    child: Text(
                      language == 1 ? 'Sign up:' : "إنشاء حساب",
                      style: const TextStyle(
                        fontSize: 50.0,
                        color: Color.fromARGB(255, 11, 35, 55),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 10.0, bottom: 10.0),
                    child: Align(
                      alignment: language == 2
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: Text(
                        language == 1
                            ? 'Personal information:'
                            : 'المعلومات الشخصيه',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 11, 35, 55),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: screenHeight / 10,
                      width: screenWidth,
                      child: TextFormField(
                        textDirection: language == 2
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        controller: nationalnumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: language == 1
                              ? "Enter your National number"
                              : 'ادخل الرقم الوطني',
                          hintTextDirection: language == 2
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          contentPadding: language == 2
                              ? EdgeInsets.fromLTRB(screenWidth / 1.8, 0, 0, 0)
                              : EdgeInsets.fromLTRB(0, 0, screenWidth / 3, 0),
                          labelStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 11, 35, 55)),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 11, 35, 55)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length <= 10) {
                            return 'national number must be 11 num or more ';
                          }
                          return null;
                        },
                      )),
                  SizedBox(
                      height: screenHeight / 10,
                      width: screenWidth,
                      child: TextFormField(
                          textDirection: language == 2
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: language == 1
                                ? "Enter your phone"
                                : 'ادخل رقم الهاتف',
                            hintTextDirection: language == 2
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            contentPadding: language == 2
                                ? EdgeInsets.fromLTRB(
                                    screenWidth / 1.7, 0, 0, 0)
                                : EdgeInsets.fromLTRB(0, 0, screenWidth / 2, 0),
                            labelStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 11, 35, 55)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 11, 35, 55)),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length >= 11) {
                              return 'please enter your correct phone number';
                            }
                            return null;
                          })),
                  SizedBox(
                      height: screenHeight / 9,
                      width: screenWidth,
                      child: TextFormField(
                          textDirection: language == 2
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: language == 1
                                ? "Enter your Email"
                                : "ادخل البريد الالكتروني",
                            hintTextDirection: language == 2
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            contentPadding: language == 2
                                ? EdgeInsets.fromLTRB(screenWidth / 2, 0, 0, 0)
                                : EdgeInsets.fromLTRB(0, 0, screenWidth / 2, 0),
                            labelStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 11, 35, 55)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 11, 35, 55)),
                            ),
                          ),
                          validator: (value) {
                            EmailValidator.validate(value!)
                                ? null
                                : 'please enter avalid email';
                          })),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 10.0, bottom: 10.0),
                    child: Align(
                        alignment: language == 2
                            ? Alignment.topRight
                            : Alignment.topLeft,
                        child: Text(
                          language == 1
                              ? 'Account information:'
                              : 'معلومات الحساب',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 11, 35, 55),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  SizedBox(
                      height: screenHeight / 9,
                      width: 300,
                      child: TextFormField(
                          textDirection: language == 2
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: language == 1
                                ? "Enter your User name"
                                : "ادخل اسم المستخدم",
                            hintTextDirection: language == 2
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            contentPadding: language == 2
                                ? EdgeInsets.fromLTRB(
                                    screenWidth / 1.9, 0, 0, 0)
                                : EdgeInsets.fromLTRB(
                                    0, 0, screenWidth / 2.5, 0),
                            labelStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 11, 35, 55)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 11, 35, 55)),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length <= 6) {
                              return 'user name lenght must be 7 letters or more';
                            }
                          })),
                  SizedBox(
                      height: screenHeight / 11,
                      width: 300,
                      child: TextFormField(
                          textDirection: language == 2
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: language == 1
                                ? "Enter password"
                                : "ادخل كلمة المرور",
                            hintTextDirection: language == 2
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            contentPadding: language == 2
                                ? EdgeInsets.fromLTRB(
                                    screenWidth / 1.7, 0, 0, 0)
                                : EdgeInsets.fromLTRB(0, 0, screenWidth / 2, 0),
                            labelStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 11, 35, 55)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 11, 35, 55)),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length <= 6) {
                              return 'password length must be 6 or more ';
                            }
                          })),
                  SizedBox(
                      height: screenHeight / 10,
                      width: screenWidth,
                      child: TextFormField(
                          textDirection: language == 2
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          controller: confirmController,
                          decoration: InputDecoration(
                            hintText: language == 1
                                ? "Confirm Password"
                                : "تأكيد كلمة المرور",
                            hintTextDirection: language == 2
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            contentPadding: language == 2
                                ? EdgeInsets.fromLTRB(
                                    screenWidth / 1.7, 0, 0, 0)
                                : EdgeInsets.fromLTRB(0, 0, screenWidth / 2, 0),
                            labelStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 11, 35, 55)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 11, 35, 55)),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                value != passwordController.text) {
                              return 'password is not correct try again';
                            }
                            return null;
                          })),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 11, 35, 55)),
                          //end coloring
                          //start bordering
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      child: Text(
                        language == 1 ? 'Sign up' : 'تم',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        await _databaseHelper.registerData(
                          nationalnumberController.text,
                          phoneController.text,
                          emailController.text,
                          usernameController.text,
                          passwordController.text,
                        );

                        if (_sign_upformkey.currentState!.validate()) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return log_in(language);
                          }));
                        }
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 20.0, right: 10.0, bottom: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return log_in(language);
                          }));
                        },
                        child: Text(
                          language == 1
                              ? 'Already have an account? Log in'
                              : 'لديك حساب؟تسجيل دخول',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 11, 35, 55),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ]),
              ),
            )));
  }
}
