import 'package:flutter/material.dart';

void main() {
  /*
  var futureObj = Future.delayed(
      Duration(seconds: 2), () => throw 'Hello World from future');
  // Try Block
  futureObj.then((value) => print(value))
  
  // Also write catch first then try doesn't matter..

  // Catch Block
  .catchError((e) {
    print(e);
  });
  print('Hello World');
  */

//  myLateWork();
  runApp(const MyApp());
}

/*myLateWork() {
  asyncTask();
  print('Hello World');
}

asyncTask() async {
  var futureObj = Future.delayed(
      Duration(seconds: 2), () => 'Hello World from future');
  try {
    var responseFromFuture = await futureObj;
    print(responseFromFuture);
  } catch (e) {
    print('Error $e');
  }
}
*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        Map<String, Widget> pages = {
          '/home': Home(),
          '/about': About(),
        };
        var pageToShow = pages[settings.name] ?? Home();
        if (settings.arguments != null) {
          if (settings.arguments is Map<String, String> &&
              settings.name == '/about') {
            pageToShow = About(
              title: (settings.arguments as Map<String, String>)['title']!,
            );
          }
        }
        return MaterialPageRoute(
            builder: (childContext) => pageToShow, settings: settings);
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/about',
                arguments: {'title': "About's title from Home"});
           /* Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => About(
                          title: 'Home s data agya',
                        )));
                        */
          },
          child: const Text(
            'Hello World',
            style: TextStyle(fontSize: 35),
          ),
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  final String title;
  const About({Key? key, this.title = 'About'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(title),
      ),
      body: const Center(
        child: Text(
          'About Hello World',
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
