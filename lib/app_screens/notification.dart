import 'package:card_renewal/app_screens/card.dart';
import 'package:flutter/material.dart';

class notf extends StatefulWidget {
  notf(this.language);
  // {super.key, required this.name, required this.DOB, required this.POB, required this.blood, required this.job, required this.adress, required this.phone, required this.NID});
  final int language;
//   final String name;
// final String DOB;
//  final String POB;
//        final String blood;
//        final String job;
//        final String adress;
//        final int phone;
//        final int NID;
  @override
  State<StatefulWidget> createState() {
    return notfState(language);
    //name,DOB,POB,blood,job,adress,phone,NID);
  }
}

class notfState extends State<notf> {
  final int language;
  //  card box =card();
  // name, DOB, POB, blood, job, adress, phone, NID)

  notfState(this.language);
  // this.name,this.DOB, this.POB, this.blood, this.job, this.adress, this.phone, this.NID);
  // final String name;
  //      final String DOB;
  //      final String POB;
  //      final String blood;
  //      final String job;
  //      final String adress;
  //      final int phone;
  //      final int NID;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 214, 226),
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
      body: Column(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Text(
                'Your card status is:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Text(
                'accept',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ]),
          Expanded(
            child: Container(
              height: screenHeight / 2,
              width: screenWidth / 5,
              // child: box,
            ),
          ),
        ],
      ),
    );
  }
}
