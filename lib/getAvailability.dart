import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkthe/components/available.dart';
import 'package:parkthe/components/parked.dart';

class GetAvailability extends StatelessWidget {
  final String documentId;
  final bool right;

  const GetAvailability({
    super.key,
    required this.documentId,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    CollectionReference parking =
        FirebaseFirestore.instance.collection('parking1');
    return FutureBuilder<DocumentSnapshot>(
      future: parking.doc(documentId).get(),
      builder: (((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return data['parkingAvailability'].toString() == "true"
              ? AvailableComponent(
                  right: right,
                )
              : ParkedComponent(
                  right: right,
                );
        }
        return const Text(
          "loading",
          style: TextStyle(
            color: Colors.red,
          ),
        );
      })),
    );
  }
}
