import 'package:flutter/material.dart';

class GreatNewAccount extends StatefulWidget {
  GreatNewAccount({Key? key}) : super(key: key);

  @override
  State<GreatNewAccount> createState() => _GreatNewAccountState();
}

class _GreatNewAccountState extends State<GreatNewAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  var erorr = "";

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
              const SizedBox(height: 100),
              const Text(
                "Register",
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 28, right: 28),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff939393))),
                      hintText: "Name",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xff939393))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 28, right: 28),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xff939393))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 28, right: 28),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      hintText: "Mobile",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xff939393))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 28, right: 28, bottom: 30),
                child: TextField(
                  controller: passController,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "Greate Password",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xff939393))),
                ),
              ),
              Container(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffF46186)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(40)))),
                      onPressed: () {
                        check();
                      },
                      child: const Text("Register"))),
              Text(
                erorr,
                style: const TextStyle(color: Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 60),
                child: Row(
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void check() {
    if (nameController.text.isEmpty) {
      erorr = "user name is Empty";
    } else if (emailController.text.isEmpty) {
      erorr = "Email is Empty";
    } else if (phoneController.text.isEmpty) {
      erorr = "Phone Number is Empty";
    } else if (passController.text.isEmpty) {
      erorr = "Password is Empty";
    } else
      erorr = "";
    setState(() {});
  }
}
