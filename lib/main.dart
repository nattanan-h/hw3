import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment #3 Hello User',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Assignment #3 Hello User'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? username;
  bool state = false;

  void _loginUser() async {
    //TODO
    setState(() {
      state = true;
    });
    username = await getUserInfo();
    setState(() {
      state = false;
    });

    // state = 1;
    // greetText();
    // print(state);
    // for (int i = 1; i <= 2;i++){
    //   if ( i == 2){
    //     state = 0;
    //     print(state);
    //     greetText();
    //   }
    // }
  }

  String greetText() {
    //TODO
    if (state) {
      return ('Logging in...');
    }
    else{
      if (username == null){
        return 'Login fails';
      }
      return 'Hello $username';
    }
    return ('Logging in...');
  }

  // Future<String> loading() {
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              greetText(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loginUser,
        tooltip: 'login',
        child: const Icon(Icons.login),
      ),
    );
  }
}

/*
Provided Async function getUserInfo
 */
int index = 0;
final usernameList = ['Peter','Jacob','Steve',null];
Future<String?> getUserInfo() async {
  index = index % usernameList.length;
  return Future.delayed(const Duration(seconds: 3),() => usernameList[index++]);
}
