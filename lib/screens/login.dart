import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Perpus",
                      style: semiBlackBoldTextStyle.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    TextSpan(
                      text: "Ku",
                      style: semiBlackBoldTextStyle.copyWith(
                        fontSize: 24,
                        color: blueColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Text(
                "Login",
                style: semiBlackBoldTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(
                  color: greyColor,
                ),
                decoration: InputDecoration(
                  fillColor: greyColor,
                  focusColor: greyColor,
                  suffixIcon: Icon(Icons.account_circle),
                  suffixIconColor: greyColor,
                  hintText: "Username",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 2,
                      color: blackColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 2,
                      color: blackColor,
                    ),
                  ),
                ),
                onChanged: (_) {},
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                style: TextStyle(
                  color: greyColor,
                ),
                decoration: InputDecoration(
                  fillColor: greyColor,
                  focusColor: greyColor,
                  suffixIcon: Icon(Icons.lock),
                  suffixIconColor: greyColor,
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 2,
                      color: blackColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 2,
                      color: blackColor,
                    ),
                  ),
                ),
                onChanged: (_) {},
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tidak punya akun? ",
                      style: regularBlackTextSTyle.copyWith(
                        color: greyColor,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 0,
                    ),
                    TextButton(onPressed: () {}, child: Text("Daftar disini"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}