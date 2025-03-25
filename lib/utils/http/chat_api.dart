import '../../data/models/chat_models.dart';
import '../../data/models/message_model.dart';
import 'http_service.dart';

class ChatApi {
  static const String baseUrl = "https://test.myfliqapp.com/api/v1";

  Future<List<ChatUser>> getChatContacts() async {
    final url = '$baseUrl/chat/chat-messages/queries/contact-users';
    final response = await HttpService.getRequest(url);

    if (response.isNotEmpty) {
      return response['data']
          .map<ChatUser>((contact) => ChatUser(
                name: contact['name'] ?? '',
                image: contact['image'] ?? '',
                time: contact['time'] ?? '',
              ))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<MessageModel>> getChatBetweenUsers(
      String senderId, String receiverId) async {
    final url =
        '$baseUrl/chat/chat-messages/queries/chat-between-users/$senderId/$receiverId';
    final response = await HttpService.getRequest(url);

    if (response.isNotEmpty) {
      return List<MessageModel>.from(response['data'] ?? []);
    } else {
      return [];
    }
  }

  Future<List<MessageModel>> fetchPusherSettings() async {
    final url = '$baseUrl/chat/customers/pusher-settings';
    final response = await HttpService.getRequest(url);
    if (response.isNotEmpty) {
      return List<MessageModel>.from(response['data'] ?? []);
    } else {
      return [];
    }
  }
}
