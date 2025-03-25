import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/chat_provider.dart';
import '../../../utils/routes/app_routes.dart';

class ChatListSection extends StatelessWidget {
  const ChatListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, provider, child) {
        return ListView.separated(
          itemCount: provider.chatContacts.length,
          separatorBuilder: (_, __) => Divider(thickness: 0),
          itemBuilder: (context, index) {
            final user = provider.chatContacts[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, AppRoutes.chatScreen,
                  arguments: user),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(user.image),
                ),
                title: Text(user.name,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Text(user.time, style: TextStyle(color: Colors.grey)),
              ),
            );
          },
        );
      },
    );
  }
}
