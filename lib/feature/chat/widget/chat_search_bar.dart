import 'package:flutter/material.dart';

import '../../../utils/const/images.dart';

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
