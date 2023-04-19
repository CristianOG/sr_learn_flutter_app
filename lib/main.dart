import 'package:flutter/material.dart';
import 'package:learn_app/src/notifications.dart';
import 'package:learn_app/ui/deck_list.dart';
import 'package:provider/provider.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Notifications.initNotifications();

  //Notifications.instance.showNotificationWithActions();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {

    Color color = const Color.fromARGB(255, 70, 166, 230);

    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Learning App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: color),
        ),
        home: const MainScreen(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DeckListView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop(); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Forced Learning :D',
        ),
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Navigation'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Decks'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.dashboard),
            //   title: const Text('Study'),
            //   selected: _selectedIndex == 1,
            //   onTap: () {
            //     _onItemTapped(1);
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.settings),
            //   title: const Text('Page Three'),
            //   selected: _selectedIndex == 2,
            //   onTap: () {
            //     _onItemTapped(2);
            //   },
            // ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],

    );
  }
}

//var appState = context.watch<MyAppState>();