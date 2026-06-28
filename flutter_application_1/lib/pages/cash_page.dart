import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/nav_bar.dart';
import 'package:flutter_application_1/widgets/cash_row.dart';

class CashPage extends StatefulWidget {
  const CashPage({super.key});

  @override
  State<CashPage> createState() => _CashRowState();
}

class _CashRowState extends State<CashPage> {
  
  // Asynchronous Code
  void getData() async {
    // simulate network request
    String char1 = await Future.delayed(Duration(seconds: 2), () {
      // other async code that depends on this needs shouldn't run first if this takes too long, so we "await" this one first
      print('Cash');
      return 'Cash';
    });
    
    print('-'); // Future.delayed() is async, meaning it won't block further code while it's executing. 
    // if it was synchronous, you'd see Yoshi after Xs then -. Instead you see - immediately, then Yoshi.

    String char2 = await Future.delayed(Duration(seconds: 2), () {
      // You can await as many statements as you like in an async function. 
      print('Back');
      return 'Back';
    });

    print('$char1$char2'); 
    // had we not used await, this would print null for char1 & 2 because it would run before obtaining them.
    // Await doesn't cause a block in code outside of this function btw
  }
  @override
  void initState() {
    super.initState();
    // more about how this & build() work in CashRow()
    getData();
    // Notice that a home page lower in the routing stack does not get loaded twice. When you're in Home and you press Home, you get the widgets building and see the prints.
    // ... When you go back to the one already loaded, the loading doesn't happen twice because the page already exists in the stack. initState() has already ran for it. 
    print("I'm not waiting for getData()");
  }

  @override
  Widget build(BuildContext context) {
    print('building cash page');
    return Scaffold(
      appBar: AppBar(
        title: Text('Cash'),
        backgroundColor: Colors.blueGrey, 
      ),
      body: Column(
        children: [
          NavBar(),
          CashRow(),
        ],
      ),
    );
  }
}