import 'package:college_bot/constants.dart';
import 'package:college_bot/widgets/chatBubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../generative_model_view_model.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatMessages = ref.watch(chatProvider);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          toolbarHeight: 160,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: /*Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue, // Adjusted to match your theme
                border: Border.all(color: Colors.yellow, width: 4),
                image: DecorationImage(
                    image: AssetImage('images/chat_robot.png'),
                    fit: BoxFit.cover)),
          ),*/
          ListTile(
            leading: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: kbuttonGradient, // Adjusted to match your theme
                border: Border.all(color: Colors.yellow, width: 4),
                image: DecorationImage(
                    image: AssetImage('images/chat_robot.png'),
                    fit: BoxFit.cover)),
          ),
            title: Text('Nano',style: TextStyle(fontSize: 25,letterSpacing: 3,),),
            subtitle: Row(children: [
              Icon(Icons.circle,color: Colors.green.shade600,size: 12,),
              Text('Active Now!',style: TextStyle(fontSize: 12),)
            ],),
          ),
          centerTitle: true,
          actions: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 8, right: 8),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    final isUserMessage =
                        chatMessages[index].startsWith("You:");
                    return ChatBubble(
                      text: chatMessages[index],
                      sender:
                          isUserMessage ? MessageSender.user : MessageSender.ai,
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 12),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: 'Ask anything...',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send,color: kblueTextColor,),
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          ref
                              .read(chatProvider.notifier)
                              .sendMessage(_controller.text);
                          _controller.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
