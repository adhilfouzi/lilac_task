import 'package:flutter/material.dart';
import '../data/models/chat_models.dart';
import '../data/models/message_model.dart';
import '../utils/const/user_list.dart';
import '../utils/http/chat_api.dart';

class ChatProvider with ChangeNotifier {
  ChatProvider() {
    fetchDemeData();
    // fetchChatContacts();
    // fetchPusherSettings();
  }
  List<ChatUser> _chatContacts = [];
  List<ChatUser> _storyContacts = [];
  List<MessageModel> _messages = [];

  List<ChatUser> get chatContacts => _chatContacts;
  List<ChatUser> get storyContacts => _storyContacts;
  List<MessageModel> get messages => _messages;

  void fetchDemeData() {
    _chatContacts = UserList().chatUsers;
    _storyContacts = UserList().storyUsers;
  }

  Future<void> fetchChatContacts() async {
    final response = await ChatApi().getChatContacts();

    if (response.isNotEmpty) {
      _chatContacts = response;
      notifyListeners();
    }
  }

  Future<void> fetchChatBetweenUsers(String senderId, String receiverId) async {
    final response = await ChatApi().getChatBetweenUsers(senderId, receiverId);

    if (response.isNotEmpty) {
      _messages = response;
      notifyListeners();
    }
  }

  Future<void> fetchPusherSettings() async {
    final response = await ChatApi().fetchPusherSettings();

    if (response.isNotEmpty) {
      // Handle the pusher settings response as needed
      notifyListeners();
    }
  }
}
