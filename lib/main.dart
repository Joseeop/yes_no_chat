import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});




  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //el guíon bajo es porque no necesitamos el buildcontext, no necesitamos ese argumento
        //Creamos nuestro chat providers a nivel global de la app, todos los widgets hijos tienen acceso
        //Y puedo consultar la información del provider.
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme : AppTheme(selectedColor: 5).theme(),
        home:  const ChatScreen()),
    );
  }
}