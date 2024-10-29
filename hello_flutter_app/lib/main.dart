import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  int _currentBottomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Beginner",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 55,
        toolbarOpacity: 0.8,
        elevation: 10,
        // actions: [
        //   IconButton(onPressed: (){}, icon: const Icon(Icons.menu))
        // ],
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
        currentIndex: _currentBottomNavBarIndex,
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
        onTap: _onBottomNavBarItemTapped,

      ),

      drawer: Drawer(
        child: ListView(
          children: [
            GestureDetector(
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.lightBlue),
                  accountName: const Text("Redwan Sharafat Kabir"),
                  accountEmail: const Text("redwansharafat@gmail.com"),
                  currentAccountPicture: Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage("https://t4.ftcdn.net/jpg/06/15/99/55/360_F_615995510_D2Zu1yDqFacBfb71hAnPGwWXB3EhYS1H.jpg"),
                    ),
                  ),
                ),
              ),

              onTap: (){
                showToastMessage("Profile");
              },
            ),

            ListTile(
              leading: const Icon(Icons.person_outlined),
              title: const Text(
                "Profile",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  )
                ),
              onTap: (){
                showToastMessage("Profile");
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text(
                "App Settings",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              onTap: (){
                showToastMessage("App Settings");
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text(
              "Logout",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
              onTap: (){
                showToastMessage("Logout ?");
              },
            )
          ],
        ),
      ),

      body: const Center(
        child: Text("Hello World !"),
      ),

    );
  }

  void _onBottomNavBarItemTapped(int index) {
    setState(() {
      _currentBottomNavBarIndex = index;
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
