import 'package:flutter/material.dart';
import 'package:happychat/pages/home_page.dart';
import 'package:happychat/pages/loader_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hbaqpvzqebwqaotzxoam.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhiYXFwdnpxZWJ3cWFvdHp4b2FtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjYwODMzMzQsImV4cCI6MTk4MTY1OTMzNH0.lMtrYyll1pjypQjxmSG2YQwX5OSH6hK3vawFu8marjE',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.pink[100],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.green[200],
          )),
      home: const LoaderPage(),
    );
  }
}
