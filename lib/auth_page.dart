import 'package:app_vote/code_verify_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

import 'config.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _twilioPhoneVerify = TwilioPhoneVerify(
      accountSid: Config.account_sid, // replace with Account SID
      authToken: Config.auth_token, // replace with Auth Token
      serviceSid: Config.service_sid // replace with Service SID
      );

  bool isVerified = false;
  bool hasSentOTP = false;
  bool hasError = false;
  String phoneNo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "B-Voter",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            if (hasError)
              const Text('Something went wrong, please try again later'),
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      setState(() {
                        phoneNo = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Enter Your PhoneNumber",
                      hintText: "+91",
                      fillColor: Colors.pink,
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 60),
              child: MaterialButton(
                onPressed: () async {
                  if (!hasSentOTP) {
                    final response =
                        await _twilioPhoneVerify.sendSmsCode('+91' + phoneNo);
                    print(response.errorMessage);
                    print(response.successful);
                    if (response.successful != null && response.successful!) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              CodeVerifyPage(phoneNo: phoneNo),
                        ),
                      );
                    } else {
                      setState(() {
                        hasError = true;
                      });
                    }
                  }
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
