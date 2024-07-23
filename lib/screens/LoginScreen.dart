import 'package:barfly_user/appConstants.dart';
import 'package:barfly_user/components/Buttons.dart';
import 'package:barfly_user/components/LoginSignupInputField.dart';
import 'package:barfly_user/return_obj.dart';
import 'package:barfly_user/services/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailOrContactNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  void _onSubmit() async {
    if (password.text.isEmpty || emailOrContactNumber.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter all the fields");
      return;
    }
    ReturnObj response =
        await Apiservice().login(emailOrContactNumber.text, password.text);

    if (response.status) {
      Fluttertoast.showToast(msg: "Login Successfull");
      Navigator.pushNamed(context, "/home-screen");
      return;
    } else {
      Fluttertoast.showToast(msg: response.message);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;

            return Stack(
              children: [
                Container(
                  height: screenHeight,
                  width: screenWidth,
                  decoration:
                      const BoxDecoration(color: AppColors.backgroundColor),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: screenHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // const SizedBox(height: 20.0),
                              const Text(
                                AppText.login,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 60.0,
                              ),
                              LoginSignUpInputField(
                                controller: emailOrContactNumber,
                                hintText: "Enter Email/Contact Number",
                                isPassword: false,
                              ),
                              LoginSignUpInputField(
                                controller: password,
                                hintText: "Enter your Password",
                                isPassword: true,
                              ),
                              const SizedBox(height: 40.0),
                              CustomButtonStroked(
                                text: "Submit",
                                onPressed: _onSubmit,
                                widthofButton: screenWidth / 2 - 20,
                                borderRadius: 30,
                                heightofButton: 50,
                                fontSize: 24,
                                verticalPadding: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
