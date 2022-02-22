import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController forgotPasswordFeild = TextEditingController();
  @override
  void initState() {
    forgotPasswordFeild.addListener(() {
      setState(() {});
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff747474),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 100, left: 28, right: 28, bottom: 20),
                child: TextField(
                    controller: forgotPasswordFeild,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "Enter Email ID / Phone Number",
                        hintStyle: TextStyle(fontSize: 16),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFFFFFF))))),
              ),
              Container(
                height: 50,
                width: 350,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffF46186)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: const BorderSide(
                                        color: Color(0xffF46186))))),
                    onPressed: forgotPassword() ? () {} : null,
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffF46186)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: const BorderSide(
                                        color: Color(0xffF46186))))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Back to Login",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool forgotPassword() {
    if (forgotPasswordFeild.text.isEmpty) {
      setState(() {});

      return false;
    } else
      return true;
  }
}
