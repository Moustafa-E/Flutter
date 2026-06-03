import 'package:flutter/material.dart';

class FlexPlayground extends StatelessWidget {
  const FlexPlayground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Treat this container like a playground for learning flexbox in flutter.
      margin: EdgeInsets.all(2),
      height: 500,
      width: 500,
      decoration: BoxDecoration(
        border: BoxBorder.all(
          width: 1, 
          color: (Colors.grey[800])!,
          /* 
          - If you check the BoxBorder properties, color: is defined using "Color", *not* "Color?". 
          - The property cannot be null. ()! allows the value to be null if you're sure it won't be. 
          - Can also use Colors.grey.shade400 which seems to build it in. Should probs stick to that. 
          */
        )
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // seems like Exanded() is overriding this by taking up all available space. 
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Expanded(
            /*
            - Flex value is the fraction of space the widget will use up. 
            - 1+2+3=6. Available space inside Row() is divided into 6 portions. Number of portions given to each widget is their flex value. 1 uses 1/6 Row(), 2: 2/6 Row(): 3: 3/6 Row()
            - Useful for scaling images in limited space. Just replace a Text() child with Image.asset('space.png')
            */
            flex: 1,

            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 2),
              color: Colors.red,
              child: Text('1'),                
            ),
          ),
          Expanded(
            flex: 2,  

            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 2),
              color: Colors.green,
              child: Text('2'),
            ),
          ),
          Expanded(
            flex: 3, 

            child: Container(
              // Container decorations should all be specified here for more control. color: property is shorthand.
              decoration: BoxDecoration(
                color: Colors.blue, 
                border: BoxBorder.all(
                  width: 1,
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
              ),
              
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 2, right: 2),
              child: Text('3'),
            ),
          ),
        ],
      ),
    );
  }
}