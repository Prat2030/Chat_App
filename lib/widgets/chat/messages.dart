import 'package:chat_app/widgets/chat/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    // return FutureBuilder(
    //   future: FirebaseAuth.instance.currentUser(),
    //   builder: (ctx, futureSnapshot) {
    //     if (futureSnapshot.connectionState == ConnectionState.waiting)
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final chatDocs = streamSnapshot.data.documents;
          return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (ctx, index) => MessageBubble(
              message: chatDocs[index]['text'],
              isMe: chatDocs[index]['userId'] == user.uid,
              userName: chatDocs[index]['username'],
              userImage: chatDocs[index]['userImage'],
              key: ValueKey(chatDocs[index].documentID),
            ),
          );
        });
    //   },
    // );
  }
}
