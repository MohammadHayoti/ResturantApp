import 'package:flutter/material.dart';
import 'package:resturent_app/screens/forgot_password_screen.dart';
import 'package:resturent_app/screens/great_new_account.dart';
import 'package:resturent_app/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var erorrMsg = "";

  @override
  void initState() {
    // TODO: implement initState
    userNameController.text = "mohammed";
    passwordController.text = "1234";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              const Text(
                "Login",
                style: TextStyle(
                  color: Color(0xff747474),
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 102, left: 28, right: 28),
                child: TextField(
                  controller: userNameController,
                  cursorColor: Colors.red,
                  showCursor: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "Username",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff808080))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff808080)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 28, right: 28, bottom: 20),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: Colors.red,
                  showCursor: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      hintText: "Password",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff808080))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff808080)))),
                ),
              ),
              Container(
                height: 50,
                width: 350,
                child: RaisedButton(
                  color: const Color(0xffF46186),
                  child: const Text("login",
                      style: TextStyle(fontSize: 14, color: Color(0xffFFFFFF))),
                  onPressed: () {
                    setState(() {});
                    validationLoginField();
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                erorrMsg,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("Google",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 20,
                    width: 1,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Facebook",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 20,
                    width: 1,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Twitter",
                        style:
                            TextStyle(color: Color(0xff4CAAFC), fontSize: 14),
                      ))
                ],
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ));
                      },
                      child: const Text(
                        "Forgrot Password",
                        style: TextStyle(color: Color(0xff939393)),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GreatNewAccount(),
                            ));
                      },
                      child: const Text(
                        "Create new account",
                        style: TextStyle(color: Color(0xff939393)),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void validationLoginField() {
    if (userNameController.text.isEmpty) {
      erorrMsg = "user name is Empty";
    } else if (passwordController.text.isEmpty) {
      erorrMsg = "password is Empty";
    } else if (userNameController.text != "mohammed") {
      erorrMsg = "User Name Not Correct";
    } else if (passwordController.text != "1234") {
      erorrMsg = "Password Not Correct";
    } else {
      erorrMsg = "";
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
      setState(() {});
      // Here Validation

    }
  }
}
