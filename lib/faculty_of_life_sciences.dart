import 'package:abu_election/constants.dart';
import 'package:abu_election/loader.dart';
import 'package:abu_election/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class faculty_of_LifeSciencesPage extends StatefulWidget {
  const faculty_of_LifeSciencesPage({super.key});

  @override
  State<faculty_of_LifeSciencesPage> createState() =>
      _faculty_of_LifeSciencesPageState();
}

class _faculty_of_LifeSciencesPageState
    extends State<faculty_of_LifeSciencesPage> {
  
  String groupValue = "UnVote";

  String groupValue2 = "UnVote";

  String groupValue3 = "UnVote";

  List<Model> models = [];

  List<int> saveListPosition = [];

  List<String> listVoteID = [];

  int maxNum = 9;
  int indexVote = 0;
  bool isfirstTime = true;
  String name1 = Constant.Senate;
  String name = Constant.FacultyLifeSciences;
  String nameVote = 'Faculty of Life SciencesVote';

  @override
  void initState() {
    // TODO: implement initState
    FirebaseFirestore.instance
        .collection('Posts')
        .doc('list')
        .collection(name)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        //  for (DocumentSnapshot doc in docs) {
        final model =
            Model(id: doc.id, list: doc.data() as Map<String, dynamic>);
        models.add(model);
        //  saveListPosition.add(1);
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('Vote')
        .doc(name1)
        .collection(name);
    CollectionReference ref2 = FirebaseFirestore.instance
        .collection('Vote')
        .doc(name1)
        .collection(nameVote);

    return Scaffold(
      backgroundColor: Colors.green[900],
      appBar: AppBar(
        title: Text(name),
        elevation: 0,
        backgroundColor: Colors.green[600],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 90,
                        ),
                        child: Center(
                          child: Text(
                            "Contestants",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent[100]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 10),
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: Image.asset("lib/images/abulogo.jpeg"),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ...models.map((model) {
                        // print(index);
                        return Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 35),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(model.list['image']),
                                        radius: 35,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 35),
                                      child: Text(
                                        model.list['name'],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.greenAccent[100],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      Radio(
                                          value: false,
                                          groupValue: model.isVote,
                                          onChanged: (value) {
                                            /*  models.remove(model);
                                            model.isVote = false;
                                            models.add(model); */
                                            listVoteID.remove(model.id);
                                            if (model.isVote) {
                                              indexVote -= 1;
                                              print(indexVote);
                                            }
                                            setState(() {});
                                            model.isVote = false;
                                            setState(() {});

                                            print('here 9');
                                          }),
                                      Text(
                                        "UnVote",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.greenAccent[100],
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Radio(
                                          value: true,
                                          groupValue: model.isVote,
                                          onChanged: (value) {
                                            if (indexVote < maxNum) {
                                              listVoteID.add(model.id);
                                              indexVote += 1;
                                              model.isVote = true;
                                              setState(() {});
                                              print(indexVote);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Maximum number of contestant reach ')));
                                            }

                                            /*   model.isVote = true;
                                                  setState(() {});
                                                  print('here 56'); */

                                            //  print(selectedValue);
                                          }),
                                      Text(
                                        "Vote",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.greenAccent[100],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      }).toList()
                    ],
                  ),

                  /*  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Posts')
                        .doc('list')
                        .collection('Faculty of Life Sciences')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('There is no vote yet'));
                      }

                      /*  if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Text("Loading..."));
              } */
                      /*Map<String, dynamic> data = snapshot.data!.docs as Map<String, dynamic>;
            print(data);*/
                      if (snapshot.hasData) {
                        //snapshot -> AsyncSnapshot of DocumentSnapshot
                        //snapshot.data -> DocumentSnapshot
                        //snapshot.data.data -> Map of fields that you need :)

                        // Map<String, dynamic> documentFields = snapshot.data.docs;

                        //  final model = Model(snapshot.data!.docs(''),snapshot.data!.docs('') as Map<String, dynamic>);
                        List<DocumentSnapshot> docs = snapshot.data!.docs;
                        models.clear();
                        for (DocumentSnapshot doc in docs) {
                          final model = Model(
                              id: doc.id,
                              list: doc.data() as Map<String, dynamic>);
                          models.add(model);
                          saveListPosition.add(1);
                        }
                        if (docs.isEmpty) {
                          return const Center(
                              child: Text('There is no vote yet'));
                        }

                          }
                      return const Center(child: Text('There is no vote yet'));
                    },
                  ),
                  */
                  MaterialButton(
                    onPressed: () {
                      //first check if the userId is voted
                      String id = getStringAsync('staffId');
                      showLoaderNew(context);

                      ref2
                          .doc(id)
                          .get()
                          .then((DocumentSnapshot documentSnapshot) {
                        if (!documentSnapshot.exists) {
                          // for(String modelId in listVoteID ){
                          //add user id to vote

                          ref2.doc(id).set({'id': '1'}).then((value) {
                            for (String modelId in listVoteID) {
                              //get candidate current vote

                              ref
                                  .doc(modelId)
                                  .get()
                                  .then((DocumentSnapshot documentSnapshot) {
                                if (documentSnapshot.exists) {
                                  //get the current vote number and add to it
                                  print(
                                      'Document data: ${documentSnapshot.data()}');
                                  var data = documentSnapshot.data()
                                      as Map<String, dynamic>;
                                  String numVote = data['vote'];
                                  int vote = numVote.toInt() + 1;
                                  //add it now

                                  ref
                                      .doc(modelId)
                                      .set({'vote':  vote.toString()}).then((value) {
                                    hideLoaderNew();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Vote has been added')));
                                  }).catchError((error) {
                                    hideLoaderNew();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Unable to add user vote')));
                                  });

                                  //another
                                } else {
                                  //candidate does not exit before, add newly

                                  ref
                                      .doc(modelId)
                                      .set({'vote': '1'}).then((value) {
                                    hideLoaderNew();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Vote has been added')));
                                  }).catchError((error) {
                                    hideLoaderNew();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Unable to add user vote')));
                                  });
                                }
                              });
                            }
                          }).catchError((error) {
                            hideLoaderNew();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Unable to add user vote')));
                          });
                        } else {
                          hideLoaderNew();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Please you cant vote two times')));
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      height: 60,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.greenAccent[100],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget showWidget(BuildContext context) {
    // for (Model model in models)
    return Container();
  }
}
