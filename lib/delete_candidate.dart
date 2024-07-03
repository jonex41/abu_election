import 'package:abu_election/dropdown_text.dart';
import 'package:abu_election/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nb_utils/nb_utils.dart';

class DeleteScreen extends HookWidget {
  const DeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Candidates');
    final staffEditingController = useTextEditingController();
    final isLoading = useState(false);
    final url = useState('');
    final uploadurl = useState('');
    final selectedPost = useState('');
    final selectedPostHead = useState('');
    final map = useState<List<QueryDocumentSnapshot>>([]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete a candidate'),
        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.height,
              MyDropDownWidget(
                titile: "Select Post",
                onChange: (value) {
                  selectedPostHead.value = value;
                },
                children: const [
                  'Governing Council',
                  'Search Team',
                  'Senate',
                ],
                hintText: "Select your answer",
                isEnabled: true,
                showRequired: true,
                validator: (value) {
                  return null;
                },
              ),
              20.height,
              if (selectedPostHead.value == 'Senate')
                Column(
                  children: [
                    MyDropDownWidget(
                      titile: "Select Post",
                      onChange: (value) {
                        selectedPost.value = value;
                      },
                      children: const [
                        'ABU Business School',
                        'Faculty of Administration',
                        'Faculty of Agriculture',
                        'Faculty of Arts',
                        'Faculty of Education',
                        'Faculty of Engineering',
                        'Faculty of Environmental Design',
                        'Faculty of Life Sciences',
                        'Faculty of Law',
                        'Faculty of Allied Health Sciences',
                        'Faculty of Clinical Sciences',
                        'Faculty of Basic Medical Sciences',
                        'Faculty of Basic Clinical Sciences',
                        'Faculty of Pharmaceutical Sciences',
                        'Faculty of of Physical Sciences',
                        'Faculty of Social Sciences',
                        'Faculty of Veterinary Medicine',
                        'CERT',
                        'CILS',
                        'NAERLS',
                        'Institute of Education'
                      ],
                      hintText: "Select your answer",
                      isEnabled: true,
                      showRequired: true,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ],
                ),
              20.height,
              Material(
                elevation: 3,
                color: Colors.green[800],
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(20, 13, 20, 15),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    if (selectedPost.value.isEmptyOrNull &&
                        selectedPostHead.value.isEmptyOrNull) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please pick Contestant post')));
                      return;
                    }
                    // await widget.addMessage(_controller.text);
                    // showLoaderNew(context);
                    bool ggggg = false;
                    String seleeet = selectedPost.value.isEmptyOrNull
                        ? selectedPostHead.value
                        : selectedPost.value;
                    print(seleeet);
                    FirebaseFirestore.instance
                        .collection('Posts')
                        .doc('list')
                        .collection(seleeet)
                        .get()
                        .then((QuerySnapshot querySnapshot) {
                      var fakeList = <QueryDocumentSnapshot>[];
                      for (var doc in querySnapshot.docs) {
                        // print(doc["first_name"]);
                        fakeList.add(doc);
                      }
                      map.value.clear();
                      map.value = fakeList;
                    });
                    /*     .add({
                            'image': url.value,
                            'name': staffEditingController.text.trim(),
                          }).then((value) {
                            hideLoaderNew();
                            staffEditingController.text = '';
                            uploadurl.value = '';
                            url.value = '';
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Contestant successfully uploaded')));
                          }).catchError((
                            error,
                          ) {
                            hideLoaderNew();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Unable to upload Contestant')));
                          }); */
                  },
                  child: const Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              20.height,
              ...map.value.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e['name'],
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    title: const Text('Vote'),
                                    content: const Text(
                                        'Are you sure you want to delete  this contestant'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection('Posts')
                                                .doc('list')
                                                .collection(selectedPost
                                                        .value.isEmptyOrNull
                                                    ? selectedPostHead.value
                                                    : selectedPost.value)
                                                .doc(e.id)
                                                .delete();
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ok'))
                                    ],
                                  ));
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                );
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
