import 'package:abu_election/constants.dart';
import 'package:abu_election/delete_candidate.dart';
import 'package:abu_election/edit_post.dart';
import 'package:abu_election/homepage.dart';
import 'package:abu_election/model.dart';
import 'package:abu_election/pdf_page.dart';
import 'package:abu_election/providers.dart';
import 'package:abu_election/staff_reg.dart';
import 'package:abu_election/upload_names.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:flutter_overlay_loader/flutter_overlay_loader.dart' as p;

class adminPage extends StatefulWidget {
  const adminPage({super.key});

  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  Map<String, dynamic> data = {};

  String? id;

  List<Model> govermentCouncilModel = [];
  List<Model> facultyLifeScienceModel = [];
  List<Model> searchTeamModel = [];
  List<Model> abuBusinessModel = [];
  List<Model> administrationModel = [];
  List<Model> agricultureModel = [];
  List<Model> educationModel = [];
  List<Model> engineeringModel = [];
  List<Model> environmentalDesignModel = [];
  List<Model> lawModel = [];
  List<Model> alliedHealthScienceModel = [];
  List<Model> clinicalScienceModel = [];
  List<Model> basicMedicalScienceModel = [];

  List<Model> pharmaceuticalScienceModel = [];
  List<Model> physicalScienceModel = [];
  List<Model> socialScienceModel = [];
  List<Model> vetenaryScienceModel = [];
  List<Model> certModel = [];
  List<Model> cilsModel = [];
  List<Model> naerlsModel = [];
  List<Model> instituteEducationModel = [];
  List<Model> napriModel = [];
  List<Model> iarModel = [];
  List<Model> artModel = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchData(Constant.GoverningCouncil, govermentCouncilModel);
    fetchData(Constant.SearchTeam, searchTeamModel);
    fetchData2(Constant.ABUBusinessSchool, abuBusinessModel);
    fetchData2(Constant.FacultyOfAdministration, administrationModel);
    fetchData2(Constant.FacultyOfAgriculture, agricultureModel);
    fetchData2(Constant.FacultyOfEducation, educationModel);
    fetchData2(Constant.FacultyOfEngineering, engineeringModel);
    fetchData2(Constant.FacultyLifeSciences, facultyLifeScienceModel);
    fetchData2(Constant.FacultyOfLaw, lawModel);
    fetchData2(Constant.FacultyAlliedHealthSciences, alliedHealthScienceModel);
    fetchData2(Constant.FacultyBasicClinicalSciences, clinicalScienceModel);
    fetchData2(Constant.FacultyBasicMedicalSciences, basicMedicalScienceModel);
    fetchData2(
        Constant.FacultyPharmaceuticalSciences, pharmaceuticalScienceModel);
    fetchData2(Constant.FacultyPhysicalSciences, physicalScienceModel);
    fetchData2(Constant.FacultySocialSciences, socialScienceModel);
    fetchData2(Constant.FacultyVeterinaryMedicine, vetenaryScienceModel);
    fetchData2(Constant.CERT, certModel);
    fetchData2(Constant.CILS, cilsModel);
    fetchData2(Constant.Napri, napriModel);
    fetchData2(Constant.NAERLS, naerlsModel);
    fetchData2(Constant.InstituteEducation, instituteEducationModel);
    fetchData2(Constant.IAR, iarModel);
    fetchData2(Constant.FacultyOfArts, artModel);

    super.initState();
  }

  void fetchData(String id, List<Model> list) {
    FirebaseFirestore.instance
        .collection('Vote')
        .doc(id)
        .collection(id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        //  for (DocumentSnapshot doc in docs) {
        FirebaseFirestore.instance
            .collection('Posts')
            .doc('list')
            .collection(Constant.GoverningCouncil)
            .doc(doc.id)
            .get()
            .then((value) {
          final model = Model(
              id: doc['vote'].toString(),
              list: value.data() as Map<String, dynamic>);
          list.add(model);
          list.sort((a, b) => b.id.compareTo(a.id));
          //  saveListPosition.add(1);
          setState(() {});
        });
      }
    });
  }

  void fetchData2(String id, List<Model> list) {
    FirebaseFirestore.instance
        .collection('Vote')
        .doc(Constant.Senate)
        .collection(id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        //  for (DocumentSnapshot doc in docs) {
        FirebaseFirestore.instance
            .collection('Posts')
            .doc('list')
            .collection(id)
            .doc(doc.id)
            .get()
            .then((value) {
          final model = Model(
              id: doc['vote'].toString(),
              list: value.data() as Map<String, dynamic>);
          list.add(model);
          list.sort((a, b) => b.id.compareTo(a.id));
          //  saveListPosition.add(1);
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        centerTitle: true,
        title: const Text('AdminPage'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share_outlined,
              color: Colors.white,
            ),
            onPressed: () async {
              // do something

              await getPdf(
                  govermentCouncilModel,
                  facultyLifeScienceModel,
                  searchTeamModel,
                  abuBusinessModel,
                  administrationModel,
                  agricultureModel,
                  educationModel,
                  engineeringModel,
                  environmentalDesignModel,
                  lawModel,
                  alliedHealthScienceModel,
                  clinicalScienceModel,
                  basicMedicalScienceModel,
                  pharmaceuticalScienceModel,
                  physicalScienceModel,
                  socialScienceModel,
                  vetenaryScienceModel,
                  certModel,
                  cilsModel,
                  naerlsModel,
                  instituteEducationModel,
                  napriModel,
                  artModel,
                  iarModel);
            },
          ),
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Upload"),
              ),
              PopupMenuItem<int>(
                value: 1,
                onTap: () {},
                child: const Text("Delete Candidates"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => UploadScreen()),
              );
            } else if (value == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DeleteScreen()));
            } else {
              p.Loader.hide();

              p.Loader.hide();
            }
          }),
        ],
      ),
      drawer: Drawer(
          child: Container(
        color: Colors.green[200],
        child: ListView(children: [
          DrawerHeader(
            child: Image.asset(
              "lib/images/abulogo.jpeg",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.green[800],
            ),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 20, color: Colors.green[900]),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const adminPage()));
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.green[800],
            ),
            title: Text(
              "Staffs Registration",
              style: TextStyle(fontSize: 20, color: Colors.green[900]),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StaffRegistrationScreen()));
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.green[800],
            ),
            title: Text(
              "Logout",
              style: TextStyle(fontSize: 20, color: Colors.red[600]),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
        ]),
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _middleMan(Constant.GoverningCouncil, govermentCouncilModel),
            _middleMan(Constant.SearchTeam, searchTeamModel),
            _middleMan(Constant.FacultyOfAdministration, administrationModel),
            _middleMan(Constant.FacultyOfAgriculture, agricultureModel),
               _middleMan(Constant.FacultyOfArts, artModel),
            _middleMan(Constant.FacultyOfEducation, educationModel),
            _middleMan(Constant.FacultyOfEngineering, engineeringModel),
            _middleMan(
                Constant.FacultyEnvironmentalDesign, environmentalDesignModel),
            _middleMan(Constant.FacultyLifeSciences, facultyLifeScienceModel),
            _middleMan(Constant.FacultyOfLaw, lawModel),
            _middleMan(
                Constant.FacultyAlliedHealthSciences, alliedHealthScienceModel),
            _middleMan(Constant.FacultyClinicalSciences, clinicalScienceModel),
            _middleMan(
                Constant.FacultyBasicMedicalSciences, basicMedicalScienceModel),
            _middleMan(Constant.FacultyPharmaceuticalSciences,
                pharmaceuticalScienceModel),
            _middleMan(Constant.FacultyPhysicalSciences, physicalScienceModel),
            _middleMan(Constant.FacultySocialSciences, socialScienceModel),
            _middleMan(
                Constant.FacultyVeterinaryMedicine, vetenaryScienceModel),
            _middleMan(Constant.CERT, certModel),
            _middleMan(Constant.CILS, cilsModel),
            _middleMan(Constant.NAERLS, naerlsModel),
            _middleMan(Constant.IAR, iarModel),
            _middleMan(Constant.InstituteEducation, instituteEducationModel),
         
          ],
        ),
      ),
    );
  }

  Widget _middleMan(String name, List<Model> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerWidget(name),
        ...list.map((e) {
          return _myRow(e);
        }).toList(),
      ],
    );
  }

  Widget _myRow(Model e) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${e.list['name']} :',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              Text(
                e.id,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _headerWidget(String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.height,
        Text(
          name,
          style: TextStyle(fontSize: 20, color: Colors.green[900]),
        ),
        10.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Name',
              style: TextStyle(fontSize: 20, color: Colors.green[800]),
            ),
            Text(
              'Vote',
              style: TextStyle(fontSize: 20, color: Colors.green[800]),
            ),
          ],
        ),
      ],
    );
  }
}
