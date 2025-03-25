import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/chat_provider.dart';
import 'widget/chat_Search_bar.dart';
import 'widget/chat_list_section.dart';
import 'widget/chat_story_section.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title:
              Text("Messages", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChatStorySection(),
              SizedBox(height: 16),
              ChatSearchBar(),
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(width: 10),
                  Text("Chat",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
              SizedBox(height: 16),
              Expanded(child: ChatListSection()),
            ],
          ),
        ),
      ),
    );
  }
}
