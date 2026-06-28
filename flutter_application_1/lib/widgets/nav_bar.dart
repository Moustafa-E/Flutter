import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/buttons.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavButton(text: "home", icon: Icons.home, route: '/home'),
          NavButton(text: "quotes", icon: Icons.speaker_group, route: '/quotes'),
          NavButton(text: "CashPage", icon: Icons.pets, route: '/cashPage'),
          NavButton(text: "FlexPlayground", icon: Icons.sports_baseball, route: '/flexPlayground'),
          NavButton(text: "Request", icon: Icons.query_builder, route: '/')
      ]),
    );
  }
}