import 'package:lilac_task/utils/const/images.dart';

import '../../data/models/chat_models.dart';

class UserList {
  final List<ChatUser> storyUsers = [
    ChatUser(name: "Alice Johnson", image: Images.user1, time: "11:15 AM"),
    ChatUser(name: "Bob Smith", image: Images.user2, time: "11:00 AM"),
    ChatUser(name: "Charlie Brown", image: Images.user3, time: "10:45 AM"),
    ChatUser(name: "Diana Prince", image: Images.user4, time: "10:30 AM"),
    ChatUser(name: "Ethan Hunt", image: Images.user5, time: "10:15 AM"),
  ];

  final List<ChatUser> chatUsers = [
    ChatUser(name: "Kevin Hart", image: Images.user1, time: "10:05 AM"),
    ChatUser(name: "Laura Linney", image: Images.user2, time: "9:50 AM"),
    ChatUser(name: "Michael Scott", image: Images.user3, time: "9:35 AM"),
    ChatUser(name: "Nancy Drew", image: Images.user4, time: "9:20 AM"),
    ChatUser(name: "Oscar Wilde", image: Images.user5, time: "9:05 AM"),
  ];
}
