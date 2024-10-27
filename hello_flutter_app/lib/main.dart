import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white
          )
        ),

        darkTheme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white
          )
        ),

        color: Colors.blue,
        debugShowCheckedModeBanner: false,

        home: const HomeActivity()
    );
  }
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity>{
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Beginner"),
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 55,
        toolbarOpacity: 0.8,
        elevation: 10,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.menu))
        ],

      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 5.0, bottom: 50.0),

        child: FloatingActionButton(
          elevation: 10,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: (){
            showSnackBar("Item added.", context);
          },
          child: const Icon(Icons.add),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        elevation: 15,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.open_in_browser_outlined), label: "Browse"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
        onTap: _onItemTapped,

      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        showToastMessage("Dashboard");
        break;
      case 1:
        showToastMessage("Chat");
        break;
      case 2:
        showToastMessage("Browse");
        break;
      case 3:
        showToastMessage("Search");
        break;
    }
  }

  showToastMessage(message){
    return  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

  showSnackBar(message, context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }
}
