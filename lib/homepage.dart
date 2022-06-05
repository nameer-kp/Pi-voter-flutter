import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Center(
                child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                        labelText: "Enter Your PhoneNumber",
                        hintText: "+91",
                        fillColor: Colors.pink,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(30)))),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 60),
            child: MaterialButton(
              onPressed: () {
                print("Submit Done");
              },
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
