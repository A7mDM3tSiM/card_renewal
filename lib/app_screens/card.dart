import 'package:flutter/material.dart';

class card extends StatefulWidget {
  final int language;
  final String name;
  final String DOB;
  final String POB;
  final String blood;
  final String job;
  final String adress;
  final int phone;
  final int NID;

  card(this.language, this.name, this.DOB, this.POB, this.blood, this.job,
      this.adress, this.phone, this.NID);

  @override
  State<StatefulWidget> createState() =>
      cardState(language, name, DOB, POB, blood, job, adress, phone, NID);
}

class cardState extends State<card> {
  final int language;

  cardState(this.language, this.name, this.DOB, this.POB, this.blood, this.job,
      this.adress, this.phone, this.NID);
  final String name;
  final String DOB;
  final String POB;
  final String blood;
  final String job;
  final String adress;
  final int phone;
  final int NID;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 206, 214, 226),
        body: Center(
            child: Container(
                width: 200,
                height: 150,
                child: Card(
                    color: const Color.fromARGB(255, 206, 214, 226),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: const Color.fromARGB(255, 11, 35, 55),
                          width: 5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(children: [
                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 210),
                            child: Text(name),
                            // textDirection: TextDirection.ltr,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            ':الاسم',
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ]),
                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 110),
                            child: Text(
                              DOB,
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            ':تاريخ الميلاد',
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ]),
                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 210),
                            child: Text(
                              POB,
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            ':مكان الميلاد',
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ]),
                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 210),
                            child: Text(
                              "$NID",
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            ': الرقم الوطني',
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ]),
                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 210),
                            child: Text(
                              blood,
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            ': فصيلة الدم',
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ]),
                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 210),
                            child: Text(
                              job,
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            ":المهنه",
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ]),
                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 210),
                            child: Text(
                              adress,
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            ': العنوان',
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ]),
                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 210),
                            child: Text(
                              "$phone",
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            ': رقم الهاتف',
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ]),
                    ])))));
  }
}
