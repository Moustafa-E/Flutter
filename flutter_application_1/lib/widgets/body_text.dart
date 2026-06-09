import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  const BodyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Home Page',
      style: TextStyle( // follows CSS convention for styling text. Specify style, then within that style specify things like color.
        fontSize: 20.0,
        fontWeight: FontWeight.bold, 
        /* ^ A bit weird here. FontWeight treated as a "class" that isn't quite a widget. Kinda like Colors.red. Perhaps widgets will "contain" something, whereas raw classes will "change" something.
        -- I tried with brackets, and it looks like these "raw classes" are called generative enum constructors. They just generate a constant.
        */
        color: Colors.grey[300],
        fontFamily: 'FiraCode',
        /* Grab a font from google, extract the zip and put the font file in some directory you can refer to. 
        Go to pubspec.yaml, add the font family & asset, then run "flutter pub get" 
        Quit and start the app again. Hot restart didn't work. */
      ),
      textAlign: TextAlign.center,
    );
  }
}