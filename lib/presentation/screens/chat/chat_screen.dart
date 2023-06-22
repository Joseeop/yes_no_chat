import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/550x/51/84/ab/5184ab79191ce480d52e8e6aec146242.jpg'),
          ),
        ),
        title: const Text('Tommy '),
        centerTitle: true,
      ),
      body: _chatView(),
    );
  }
}

//Quien maneja el estado del widget es el provider
class _chatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Esto va a estar pendiente de lo que suceda en la instacia de la clase
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers)
                    ? const HerMessageBubble()
                    :  MyMessageBubble(message : message );
              },
            )),
            //Caja de texto
             MessageFieldBox(
              onValue:(value) => chatProvider.sendMessage(value) ,
             ),
        
        ],
        ),
      ),
    );
  }
}
