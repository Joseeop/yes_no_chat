import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

//Puede notificar cuando hay cambios, y cuando hay cambios redibujamos ciertas cosas
//Provider nos permite tener los changednotifier de manera global
class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Has vuelto del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
//Actualizate si algo cambió
    notifyListeners();
  }
}
