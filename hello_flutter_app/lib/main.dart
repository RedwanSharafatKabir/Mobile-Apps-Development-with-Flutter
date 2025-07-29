
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_flutter_app/Strings.dart';

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
          "Flutter Widgets",
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
        padding: const EdgeInsets.only(right: 5.0, bottom: 30.0),

        child: FloatingActionButton(
          elevation: 10,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: (){
            _saveItem(context);
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))
          ),
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

      drawer: SafeArea(
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
          ),
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
                        // backgroundImage: NetworkImage(Strings.imageUrl),
                        backgroundImage: AssetImage('assets/images/asc.jpg'),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  showSnackBar("Profile", context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_outlined),
                title: const Text(
                  "Profile",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  showSnackBar("Profile", context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text(
                  "App Settings",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  showSnackBar("App Settings", context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),

      body: Container(
        color: Colors.white70,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 100, width: 100,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(Strings.imageUrl),
                  ),
                ),
                SizedBox(height: 100, width: 100,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(Strings.imageUrl),
                  ),
                ),
                SizedBox(height: 100, width: 100,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(Strings.imageUrl),
                  ),
                )
              ],
            ),
            const Padding(padding:  EdgeInsets.fromLTRB(10, 0, 10, 10), child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: "First Name"))
            ),
            const Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Last Name"))
            ),
            const Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Phone Number"))
            ),
            Padding(padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                child: ElevatedButton(onPressed: (){
                  showSnackBar("Item added", context);
                }, style: rectangleButtonStyle, child: const Text("Submit"))
            )
          ],
        ),
      ),

    );
  }

  _saveItem(context){
    
  }

  _showLogoutDialog(context){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                title: const Text("Logout !"),
                content: const Text("Are you sure to logout from app?"),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                        child: OutlinedButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: const Text("No")
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                              SystemNavigator.pop();
                            },
                            style: roundedButtonStyle,
                            child: const Text("Yes")
                        ),
                      ),
                    ],
                  )
                ],
              )
          );
        }
    );
  }

  final ButtonStyle roundedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(200))
    )
  );

  final ButtonStyle rectangleButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50),
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))
    )
  );

  void _onBottomNavBarItemTapped(int index) {
    setState(() {
      _currentBottomNavBarIndex = index;
    });

    switch (index) {
      case 0:
        showSnackBar("Home", context);
        break;
      case 1:
        showSnackBar("Categories", context);
        break;
      case 2:
        showSnackBar("Cam Search", context);
        break;
      case 3:
        showSnackBar("Cart", context);
        break;
      case 4:
        showSnackBar("Profile", context);
        break;
    }
  }

  showSnackBar(message, context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }
}
