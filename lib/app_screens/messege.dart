import 'package:flutter/material.dart' ;
class database_helper {
      void showMyDialog(
      {required context,
      required String title,
      required String content,
      var page}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 11, 35, 55)),
                    child: Text(
                      'Close',
                    ),
                    onPressed: () {
                      if (title == 'Failed') {
                        Navigator.of(context).pop();
                      } else {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => page,
                          ),
                        );
                      }
                    })
              ]);
        });
  }

}
 

 
