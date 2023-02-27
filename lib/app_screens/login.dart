import 'package:card_renewal/api/database_helper.dart';
import 'package:card_renewal/app_screens/enter_data.dart';
import 'package:card_renewal/app_screens/messege.dart';
import 'package:card_renewal/app_screens/sign_up.dart';
import 'package:flutter/material.dart';

class log_in extends StatefulWidget {
  const log_in(this.language, {super.key});
  final int language;
  @override
  State<StatefulWidget> createState() => log_inState(language);
}

class log_inState extends State<log_in> {
  final int language;
  DatabaseHelper _databaseHelper = DatabaseHelper();
  log_inState(this.language);
  final GlobalKey<FormState> _log_informkey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final wordController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
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
              key: _log_informkey,
              child: ListView(children: [
                Align(
                  alignment:
                      language == 2 ? Alignment.topRight : Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      language == 1 ? 'Log in:' : "تسجيل الدخول",
                      style: const TextStyle(
                        fontSize: 50.0,
                        color: Color.fromARGB(255, 11, 35, 55),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 55.0, left: 10.0, right: 22.0, bottom: 10.0),
                    child: SizedBox(
                        height: screenHeight / 15,
                        width: screenWidth / 2,
                        child: TextFormField(
                          textDirection: language == 2
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          controller: userController,
                          decoration: InputDecoration(
                            hintText:
                                language == 1 ? "Username" : "اسم المستخدم",
                            hintTextDirection: language == 2
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            contentPadding: language == 2
                                ? EdgeInsets.fromLTRB(
                                    screenWidth / 2.9, 0, 0, 0)
                                : EdgeInsets.fromLTRB(0, 0, screenWidth / 3, 0),
                            suffixIcon: const Icon(Icons.person,
                                color: Color.fromARGB(255, 11, 35, 55)),
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
                            if (value!.isEmpty) {
                              return 'please enter correct username';
                            }
                            return null;
                          },
                        ))),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 55.0, left: 10.0, right: 22.0, bottom: 10.0),
                    child: SizedBox(
                        height: screenHeight / 15,
                        width: screenWidth,
                        child: TextFormField(
                          textDirection: language == 2
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          controller: wordController,
                          decoration: InputDecoration(
                            hintText:
                                language == 1 ? "password" : 'كلمة المرور',
                            hintTextDirection: language == 2
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            contentPadding: language == 2
                                ? EdgeInsets.fromLTRB(
                                    screenWidth / 2.5, 0, 0, 0)
                                : EdgeInsets.fromLTRB(0, 0, screenWidth / 3, 0),
                            suffixIcon: const Icon(Icons.lock,
                                color: Color.fromARGB(255, 11, 35, 55)),
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
                            if (value!.isEmpty) {
                              return 'pease inter correct password';
                            }
                            return null;
                          },
                        ))),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 11, 35, 55)),
                            //end coloring
                            //start bordering
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        child: Text(
                          language == 1 ? 'login' : 'تسجيل الدخول',
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          await _databaseHelper.loginData(
                              userController.text.trim(), wordController.text);
                          if (_log_informkey.currentState!.validate()) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Enter_data(language);
                            }));
                          }
                        },
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Sign_up(language);
                      }));
                    },
                    child: Center(
                      child: Text(
                        language == 1 ? 'Creat new account' : 'إنشاء حساب جديد',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 11, 35, 55),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Center(
                  child: Text(
                    language == 1 ? 'Forget Password?' : 'هل نسيت كلمة المرور؟',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 11, 35, 55),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ])),
        ));
  }
}
