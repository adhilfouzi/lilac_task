import 'package:lilac_task/utils/const/images.dart';

import '../../data/models/chat_models.dart';

class UserList {
  final List<ChatUser> storyUsers = [
    ChatUser(
        name: "Alice Johnson", image: Images.facebookIcon, time: "9:00 AM"),
    ChatUser(name: "Bob Smith", image: Images.facebookIcon, time: "9:15 AM"),
    ChatUser(
        name: "Charlie Brown", image: Images.facebookIcon, time: "9:30 AM"),
    ChatUser(name: "Diana Prince", image: Images.facebookIcon, time: "9:45 AM"),
    ChatUser(name: "Ethan Hunt", image: Images.facebookIcon, time: "10:00 AM"),
    ChatUser(
        name: "Fiona Gallagher", image: Images.facebookIcon, time: "10:15 AM"),
    ChatUser(
        name: "George Clooney", image: Images.facebookIcon, time: "10:30 AM"),
    ChatUser(
        name: "Hannah Montana", image: Images.facebookIcon, time: "10:45 AM"),
    ChatUser(
        name: "Ian Somerhalder", image: Images.facebookIcon, time: "11:00 AM"),
    ChatUser(
        name: "Julia Roberts", image: Images.facebookIcon, time: "11:15 AM"),
  ];

  final List<ChatUser> chatUsers = [
    ChatUser(name: "Alice Johnson", image: Images.googleIcon, time: "9:00 AM"),
    ChatUser(name: "Bob Smith", image: Images.googleIcon, time: "9:15 AM"),
    ChatUser(name: "Charlie Brown", image: Images.googleIcon, time: "9:30 AM"),
    ChatUser(name: "Diana Prince", image: Images.googleIcon, time: "9:45 AM"),
    ChatUser(name: "Ethan Hunt", image: Images.googleIcon, time: "10:00 AM"),
    ChatUser(
        name: "Fiona Gallagher", image: Images.googleIcon, time: "10:15 AM"),
    ChatUser(
        name: "George Clooney", image: Images.googleIcon, time: "10:30 AM"),
    ChatUser(
        name: "Hannah Montana", image: Images.googleIcon, time: "10:45 AM"),
    ChatUser(
        name: "Ian Somerhalder", image: Images.googleIcon, time: "11:00 AM"),
    ChatUser(name: "Julia Roberts", image: Images.googleIcon, time: "11:15 AM"),
  ];
}
