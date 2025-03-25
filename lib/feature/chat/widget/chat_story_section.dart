import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/chat_provider.dart';

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
