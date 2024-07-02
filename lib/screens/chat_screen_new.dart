import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreenNew extends StatefulWidget {
  final bool isUser;
  final bool isAstrologer;

  const ChatScreenNew({super.key, required this.isUser, required this.isAstrologer});

  @override
  _ChatScreenNewState createState() => _ChatScreenNewState();
}

class _ChatScreenNewState extends State<ChatScreenNew> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  late IO.Socket socket;
  String chatId = "65a524251eb201c1e709a79f";
  final String userIdentifier = "user";
  final String astrologerIdentifier = "astrologer";

  @override
  void initState() {
    super.initState();
    socket = IO.io('https://astromagic-dtigcqgjva-em.a.run.app',
        IO.OptionBuilder().setTransports(['websocket']).build());

    socket.onConnect((_) {
      print('Connected to socket');
      _joinChatRoom();

      socket.on('message', (data) {
        print('Recieved $data');
        if ((data['sender'] == 'user' && widget.isUser) ||
            (data['sender'] == 'astrologer' && widget.isAstrologer)) {
          print('same');
        } else {
          _handleReceivedMessage(data);
        }
      });
    });

    socket.onDisconnect((_) {
      print('Disconnected from socket');
    });
  }

  void _joinChatRoom() {
    print('JOINED CHAT ROOM');
    if (widget.isUser) {
      // If the user is joining, emit the user-join event
      socket.emit('user-join', {
        'chatId': chatId,
        'userId':
            '65897669ee977303664a105c', // Replace with the actual user's ID
      });
    } else if (widget.isAstrologer) {
      // If the astrologer is joining, emit the astrologer-join event
      socket.emit('astrologer-join', {
        'chatId': chatId,
        'astrologerId':
            '65896b3df9e185f7196d4637', // Replace with the actual astrologer's ID
      });
    }
  }

  void _handleReceivedMessage(data) {
    // bool messenger;

    setState(() {
      _messages.insert(0, {
        "message": data['message'],
        "isSender": false,
      });
    });
  }

  // When user sends, message recieved is from user,

  void _sendMessage(String text) {
    print('Message Sent');
    if (text.trim().isNotEmpty) {
      socket.emit('send-message', {
        'chatId': chatId,
        'message': text,
        'sender': widget.isUser ? userIdentifier : astrologerIdentifier,
      });

      setState(() {
        _messages.insert(0, {
          "message": text,
          "isSender": true,
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFEE542A), // deep, vivid orange
              Color(0xFFFE9E2D), // bright, yellow-orange
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final isUserMessage = _messages[index]["isSender"] == true;
                  return ChatBubble(
                    message: _messages[index]["message"]!,
                    isUserMessage: isUserMessage,
                  );
                },
              ),
            ),
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    const InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    _sendMessage(text);
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUserMessage;

  const ChatBubble({super.key, required this.message, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    final alignment =
        isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start;
    final bgColor = isUserMessage ? Colors.blue : Colors.white.withOpacity(0.9);
    final textColor = isUserMessage ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              message,
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
