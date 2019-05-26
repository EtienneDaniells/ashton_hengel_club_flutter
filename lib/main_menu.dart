import 'package:ashton_hengel_club/global/colors.dart';
import 'package:ashton_hengel_club/state/home_screen.dart';
import 'package:ashton_hengel_club/widgets/capsule_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: CapsuleButton(
              "Login",
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (b) => HomePage(title: "Home",)));
              },
            ),
          ),
        ],
      ),
    );
  }
}
