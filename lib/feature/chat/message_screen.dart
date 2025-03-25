import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/chat_provider.dart';
import '../../utils/const/images.dart';

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
              Text("Chat", style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(child: ChatListSection()),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatSearchBar extends StatelessWidget {
  const ChatSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Image.asset(Images.chatSearchIcon, cacheHeight: 25),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
    );
  }
}

class ChatListSection extends StatelessWidget {
  const ChatListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, provider, child) {
        return ListView.separated(
          itemCount: provider.chatContacts.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (context, index) {
            final user = provider.chatContacts[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(user.image),
              ),
              title: Text(user.name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(user.time, style: TextStyle(color: Colors.grey)),
            );
          },
        );
      },
    );
  }
}

class ChatStorySection extends StatelessWidget {
  const ChatStorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    final storyList = chatProvider.storyContacts;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(storyList[index].image),
                  ),
                  SizedBox(height: 4),
                  Text(
                    storyList[index].name,
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.fade,
                  )
                ],
              ),
              SizedBox(width: 10),
            ],
          );
        },
      ),
    );
  }
}
