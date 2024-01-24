import 'package:final_project/feature/pages/auth/view/login_view.dart';
import 'package:final_project/feature/pages/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  var box = await Hive.openBox('user');
  runApp(
    ProviderScope(
        child: MyApp(
      box: box,
    )),
  );
}

class MyApp extends StatelessWidget {
  final Box<dynamic>? box;

  const MyApp({this.box, super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: box!.get('mail') != null ? HomeView() : LoginView(),
    );
  }
}
