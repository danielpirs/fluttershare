import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';

final usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    //getUserByID();
    //createUser();
    //updateUser();
    super.initState();
  }

  createUser() {
    usersRef.document("adfasdf").setData({
      "username": "Jeff",
      "postsCount": 0,
      "isAdmin": false,
    });
  }

  updateUser() {
    usersRef.document("adfasdf").updateData({
      "username": "John",
      "postsCount": 0,
      "isAdmin": false,
    });
  }

  // getUserByID() async {
  //   final String id = "Xc87a8HiEVkKAbSUm4H9";
  //   final DocumentSnapshot doc = await usersRef.document(id).get();
  //   // print(doc.data);
  //   // print(doc.documentID);
  //   // print(doc.exists);
  // }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          final List<Text> children = snapshot.data.documents
              .map((doc) => Text(doc['username']))
              .toList();
          return Container(
            child: ListView(
              children: children,
            ),
          );
        },
      ),
    );
  }
}
