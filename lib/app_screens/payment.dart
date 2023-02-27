import 'package:card_renewal/api/database_helper.dart';
import 'package:card_renewal/app_screens/messege.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class payment extends StatefulWidget {
  const payment(this.language, {super.key});
  final int language;
  @override
  State<StatefulWidget> createState() {
    return PaymentState(language);
  }
}

class PaymentState extends State<payment> {
  final int language;
  PaymentState(this.language);
  final GlobalKey<FormState> _paymentformkey = GlobalKey<FormState>();
  final processController = TextEditingController();
  var picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    database_helper data = database_helper();

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
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 229, 234, 237),
              Color.fromARGB(255, 188, 178, 178),
            ],
          )),
          child: Form(
            // child:Padding
            //  (padding:const EdgeInsets.only(top: 75,left: 20,right: 20,bottom:100),
            child: ListView(children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        width: screenWidth,
                        height: screenHeight / 2.4,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 156, 207, 241),
                            Color.fromARGB(255, 81, 101, 121),
                          ],
                        ))),
                  ),
                  Positioned(
                    top: screenHeight / 13,
                    left:
                        language == 1 ? screenWidth / 10.7 : screenWidth / 2.1,
                    child: Text(
                      language == 1 ? 'Renewal fees:' : 'رسوم تجديد البطاقه',
                      style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 11, 35, 55)),
                    ),
                  ),
                  Positioned(
                    top: screenHeight / 13,
                    left:
                        language == 1 ? screenWidth / 1.6 : screenWidth / 10.7,
                    child: const Text(
                      '7000SDG',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 83, 82, 82)),
                    ),
                  ),
                  Positioned(
                    top: screenWidth / 4,
                    left:
                        language == 1 ? screenWidth / 10.7 : screenWidth / 1.7,
                    child: Align(
                      child: Text(
                        language == 1 ? 'invoice number:' : 'معرف الفاتوره',
                        style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 35, 55)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenWidth / 4,
                    left:
                        language == 1 ? screenWidth / 1.6 : screenWidth / 10.7,
                    child: Align(
                      alignment: language == 2
                          ? Alignment.topRight
                          : Alignment.centerRight,
                      child: const Text(
                        '2323359',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 83, 82, 82)),
                      ),
                    ),
                  ),
                  Positioned(
                      top: screenHeight / 6,
                      left: screenWidth / 5,
                      right: screenWidth / 5,
                      child: Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 11, 35, 55)),
                              //end coloring
                              //start bordering
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ))),
                          child: const Icon(
                            Icons.upload,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            DatabaseHelper _databaseHelper = DatabaseHelper();
                            _databaseHelper.payment(1234);
                          },
                        ),
                      )),
                  Positioned(
                    top: screenHeight / 2.9,
                    left: screenWidth / 10.4,
                    right: screenWidth / 10.4,
                    child: Align(
                      alignment: language == 2
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          language == 1
                              ? 'Please upload the payment notice'
                              : 'الرجاء ارفاق صورة الاشعار',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 83, 82, 82)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: screenHeight / 8.5,
                  width: screenWidth / 2,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      textDirection:
                          language == 2 ? TextDirection.rtl : TextDirection.ltr,
                      controller: processController,
                      decoration: InputDecoration(
                        hintText: language == 1
                            ? " Enter process number"
                            : "ادخل رقم العمليه",
                        hintTextDirection: language == 2
                            ? TextDirection.rtl
                            : TextDirection.ltr,
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
                            value == null ||
                            value.length >= 10) {
                          return ' process number must be 11 num or more ';
                        }
                        return null;
                      },
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 11, 35, 55)),
                      //end coloring
                      //start bordering
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  child: Text(
                    language == 1 ? 'ok' : 'تم',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    data.showMyDialog(
                        context: context,
                        title: language == 1 ? 'Done' : 'تم ',
                        content: language == 1
                            ? 'You have successfully completed the first part of the renewal procedures.'
                                'You will be contacted to complete the procedures at the Public Services Complex'
                            : ' لقد اكملت الجزء الاول من اجراءات التجديد بنجاح سيتم التواصل معك لاكمال الاجراءات في مجمع خدمات الجمهور',
                        page: payment(language));
                  },
                ),
              ),
            ]),
          ),
        ));
  }
}
