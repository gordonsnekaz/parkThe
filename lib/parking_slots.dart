import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkthe/components/available.dart';
import 'package:parkthe/components/parked.dart';
import 'package:parkthe/getAvailability.dart';

class ParkingSlotsPage extends StatefulWidget {
  const ParkingSlotsPage({Key? key}) : super(key: key);

  @override
  State<ParkingSlotsPage> createState() => _ParkingSlotsPageState();
}

class _ParkingSlotsPageState extends State<ParkingSlotsPage> {
  //documents ids
  List<String> docIDs = [];

  //getting ids
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection("parking1")
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SafeArea(
        child: Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => {
                      Navigator.pop(context),
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff828282),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Parking Area 1",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF)),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Parking area view",
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(
                color: Color(0xff828282),
              ),
              const SizedBox(
                height: 10,
              ),
              //row 1
              Column(
                children: [
                  const Text(
                    '''
      
      -------          ---------       --------      --------
                                                        
                                                                entrance
      ''',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        '''
      |
      |
      |


      |
      |
      |


      |
      |
      |


      |
      |
      entrance''',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      FutureBuilder(
                          future: getDocId(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Table(
                                defaultColumnWidth:
                                    const FixedColumnWidth(100.0),
                                children: [
                                  //Row1
                                  TableRow(children: [
                                    GetAvailability(
                                      documentId: docIDs[0],
                                      right: false,
                                    ),
                                    GetAvailability(
                                      documentId: docIDs[1],
                                      right: true,
                                    ),
                                  ]),
                                  TableRow(children: [
                                    GetAvailability(
                                      documentId: docIDs[2],
                                      right: false,
                                    ),
                                    GetAvailability(
                                      documentId: docIDs[3],
                                      right: true,
                                    ),
                                  ]),
                                  TableRow(children: [
                                    GetAvailability(
                                      documentId: docIDs[4],
                                      right: false,
                                    ),
                                    GetAvailability(
                                      documentId: docIDs[5],
                                      right: true,
                                    ),
                                  ]),
                                  TableRow(children: [
                                    GetAvailability(
                                      documentId: docIDs[6],
                                      right: false,
                                    ),
                                    GetAvailability(
                                      documentId: docIDs[7],
                                      right: true,
                                    ),
                                  ]),
                                ],
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.all(30.0),
                                child: Text(
                                  "Loading the available parkings",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }
                          }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
