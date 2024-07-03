import 'dart:io';

import 'package:abu_election/constants.dart';
import 'package:abu_election/dropdown_text.dart';
import 'package:abu_election/governingcouncil.dart';
import 'package:abu_election/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

class UploadScreen extends HookWidget {
  UploadScreen({Key? key}) : super(key: key);

  DocumentReference users =
      FirebaseFirestore.instance.collection('Candidates').doc('list');

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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: const Text('Upload Names'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    isLoading.value = true;
                    final user = FirebaseAuth.instance.currentUser;
                    FirebaseStorage storage = FirebaseStorage.instance;
                    final ImagePicker picker = ImagePicker();
                    // Pick an image
                    final XFile? pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);

                    File image;
                    if (pickedFile != null) {
                      image = File(pickedFile.path);
                    } else {
                      print('No image selected.');
                      return;
                    }

                    Reference reference = FirebaseStorage.instance.ref().child(
                        'profileImage/${DateTime.now().toIso8601String()}');
                    UploadTask uploadTask = reference.putFile(image);
                    TaskSnapshot snapshot = await uploadTask;
                    uploadurl.value = await snapshot.ref.getDownloadURL();
                    url.value = uploadurl.value;
                    setValue('uploadImage', uploadurl.value);
                    await Future.delayed(const Duration(seconds: 2), () {
                      isLoading.value = false;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.green[800],
                    radius: 100.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: url.value.isEmptyOrNull
                          ? const Icon(
                              Icons.add_a_photo,
                              size: 50,
                            )
                          : isLoading.value
                              ? const Center(
                                  child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                      )))
                              : SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Image.network(
                                    url.value,
                                  ),
                                ),
                    ),
                  ),
                ),
                20.height,
                MyDropDownWidget(
                  titile: "Select Post",
                  onChange: (value) {
                    selectedPostHead.value = value;
                  },
                  children: const [
                    Constant.GoverningCouncil,
                    Constant.SearchTeam,
                    Constant.Senate,
                  ],
                  hintText: "Select your answer",
                  isEnabled: true,
                  showRequired: true,
                  validator: (value) {
                    return null;
                  },
                ),
                20.height,
                if (selectedPostHead.value == Constant.Senate)
                  Column(
                    children: [
                      MyDropDownWidget(
                        titile: "Select Post",
                        onChange: (value) {
                          selectedPost.value = value;
                        },
                        children: const [
                          Constant.ABUBusinessSchool,
                          Constant.FacultyOfAdministration,
                          Constant.FacultyOfAgriculture,
                          Constant.FacultyOfArts,
                          Constant.FacultyOfEducation,
                          Constant.FacultyOfEngineering,
                          Constant.FacultyEnvironmentalDesign,
                          Constant.FacultyLifeSciences,
                          Constant.FacultyOfLaw,
                          Constant.FacultyAlliedHealthSciences,
                          Constant.FacultyClinicalSciences,
                          Constant.FacultyBasicMedicalSciences,
                          Constant.FacultyPharmaceuticalSciences,
                          Constant.FacultyPhysicalSciences,
                          Constant.FacultySocialSciences,
                          Constant.FacultyVeterinaryMedicine,
                          Constant.CERT,
                          Constant.CILS,
                          Constant.NAERLS,
                          Constant.IAR,
                          Constant.InstituteEducation
                        ],
                        hintText: "Select your answer",
                        isEnabled: true,
                        showRequired: true,
                        validator: (value) {
                          return null;
                        },
                      ),
                      20.height,
                    ],
                  ),
                TextFormField(
                  cursorColor: Colors.green[800],
                  autofocus: false,
                  controller: staffEditingController,
                  keyboardType: TextInputType.text,
                  //validator () {},
                  onSaved: (value) {
                    staffEditingController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.green[800],
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Staff Name",
                    hintStyle: TextStyle(color: Colors.green[800]),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                50.height,
                Material(
                  elevation: 3,
                  color: Colors.green[800],
                  borderRadius: BorderRadius.circular(30),
                  child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 13, 20, 15),
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      if (url.value.trim().isEmptyOrNull) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please pick Contestant image')));
                        return;
                      }

                      if (staffEditingController.text.trim().isEmptyOrNull) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please enter Contestant name')));
                        return;
                      }
                      if (selectedPost.value.isEmptyOrNull &&
                          selectedPostHead.value.isEmptyOrNull) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please pick Contestant post')));
                        return;
                      }
                      // await widget.addMessage(_controller.text);
                      showLoaderNew(context);
                      bool ggggg = false;
                      FirebaseFirestore.instance
                          .collection('Posts')
                          .doc('list')
                          .collection(selectedPost.value.isEmptyOrNull
                              ? selectedPostHead.value
                              : selectedPost.value)
                          .add({
                        'image': url.value,
                        'name': staffEditingController.text.trim(),
                      }).then((value) {
                        //on posting pick id to set initial vote to zero
                        DocumentReference ref;
                        if (selectedPostHead.value ==
                                Constant.GoverningCouncil ||
                            selectedPostHead.value == Constant.SearchTeam) {
                          ref = FirebaseFirestore.instance
                              .collection('Vote')
                              .doc(selectedPostHead.value)
                              .collection(selectedPostHead.value)
                              .doc(value.id);
                        } else {
                          ref = FirebaseFirestore.instance
                              .collection('Vote')
                              .doc(selectedPostHead.value)
                              .collection(selectedPost.value)
                              .doc(value.id);
                        }

                        ref.set({'vote': '0'}).then((value) {
                          hideLoaderNew();
                          staffEditingController.text = '';
                          uploadurl.value = '';
                          url.value = '';
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Contestant successfully uploaded')));
                        }).catchError((onError) {
                          hideLoaderNew();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Unable to upload Contestant')));
                        });
                      }).catchError((
                        error,
                      ) {
                        hideLoaderNew();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Unable to upload Contestant')));
                      });
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
              ],
            ),
          ),
        ));
  }
}
