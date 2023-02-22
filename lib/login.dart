import 'package:flutter/material.dart';
import 'package:parkthe/home_page.dart';
import 'package:parkthe/landing_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final _regNumberController = TextEditingController();

  Future login() async {
    if (_regNumberController.text == '') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  username: "ABC 1234",
                )),
      );
    } else {
      openDialog();
    }
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Color(0xfff5f8ff),
            title: Text(
              'Wrong credentials',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.red[400]),
            ),
            content: const Text(
              'Wrong login details, please enter correct details to login.',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff828282)),
            ),
          ));

  @override
  void dispose() {
    _regNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff000000),
        body: SafeArea(
            child: Expanded(
          child: ListView(
            children: [
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 140,
                  ),
                  const SizedBox(
                    height: 60,
                    width: 60,
                    child: Image(
                        image: AssetImage('android/assets/parked-car.png')),
                  ),
                  //Greetings
                  const Text(
                    'ParkThe',
                    style: TextStyle(
                        color: Color(0xff51A71D),
                        fontWeight: FontWeight.w800,
                        fontSize: 18),
                  ),

                  //spacer
                  const SizedBox(height: 150),
                  const Text(
                    'Please enter your car registration number',
                    style: TextStyle(
                        color: Color(0xffE0E0E0),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //username textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff333333),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _regNumberController,
                          decoration: InputDecoration(
                            fillColor: Color(0xff828282),
                            border: InputBorder.none,
                            hintText: 'e.g ABC1234',
                          ),
                        ),
                      ),
                    ),
                  ),

                  //spacer
                  const SizedBox(
                    height: 100,
                  ),

                  //Login button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: login,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(0xff51A71D),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text(
                          'Login',
                          style: TextStyle(
                              color: Color(0xfff5f8ff),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        )));
  }
}
