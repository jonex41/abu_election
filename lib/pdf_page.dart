import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import '../constants.dart';
import '../model.dart';
import 'dart:collection';

Future getPdf(
  List<Model> govermentCouncilModel,
  List<Model> facultyLifeScienceModel,
  List<Model> searchTeamModel,
  List<Model> abuBusinessModel,
  List<Model> administrationModel,
  List<Model> agricultureModel,
  List<Model> educationModel,
  List<Model> engineeringModel,
  List<Model> environmentalDesignModel,
  List<Model> lawModel,
  List<Model> alliedHealthScienceModel,
  List<Model> clinicalScienceModel,
  List<Model> basicMedicalScienceModel,
  List<Model> pharmaceuticalScienceModel,
  List<Model> physicalScienceModel,
  List<Model> socialScienceModel,
  List<Model> vetenaryScienceModel,
  List<Model> certModel,
  List<Model> cilsModel,
  List<Model> naerlsModel,
  List<Model> instituteEducationModel,
  List<Model> napriModel,
  List<Model> artModel,
  List<Model> iarModel,
) async {
  pw.Document pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(16),
        build: (pw.Context context) {
          return <pw.Widget>[
            _myHeader(Constant.GoverningCouncil),
            _body(govermentCouncilModel),
            _myHeader(Constant.SearchTeam),
            _body(searchTeamModel),
            pw.Text(
              'Senate',
              style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold),
            ),
            _myHeader(Constant.ABUBusinessSchool),
            _body(abuBusinessModel),
            _myHeader(Constant.FacultyOfAdministration),
            _body(administrationModel),
            _myHeader(Constant.FacultyOfAgriculture),
            _body(agricultureModel),
            _myHeader(Constant.FacultyOfArts),
            _body(artModel),
            _myHeader(Constant.FacultyOfEducation),
            _body(educationModel),
            _myHeader(Constant.FacultyOfEngineering),
            _body(engineeringModel),
            _myHeader(Constant.FacultyEnvironmentalDesign),
            _body(environmentalDesignModel),
            _myHeader(Constant.FacultyLifeSciences),
            _body(facultyLifeScienceModel),
            _myHeader(Constant.FacultyOfLaw),
            _body(lawModel),
            _myHeader(Constant.FacultyAlliedHealthSciences),
            _body(alliedHealthScienceModel),
            _myHeader(Constant.FacultyClinicalSciences),
            _body(clinicalScienceModel),
            _myHeader(Constant.FacultyBasicMedicalSciences),
            _body(basicMedicalScienceModel),
            _myHeader(Constant.FacultyPharmaceuticalSciences),
            _body(pharmaceuticalScienceModel),
            _myHeader(Constant.FacultyPhysicalSciences),
            _body(physicalScienceModel),
            _myHeader(Constant.FacultySocialSciences),
            _body(socialScienceModel),
            _myHeader(Constant.FacultyVeterinaryMedicine),
            _body(vetenaryScienceModel),
            _myHeader(Constant.CERT),
            _body(certModel),
            _myHeader(Constant.CILS),
            _body(cilsModel),
            _myHeader(Constant.NAERLS),
            _body(naerlsModel),
            _myHeader(Constant.InstituteEducation),
            _body(instituteEducationModel),
            _myHeader(Constant.IAR),
            _body(iarModel),
            _myHeader(Constant.Napri),
            _body(napriModel),
          ];
        }),
  );

  final documentPath = await getExternalStorageDirectory();
  // String documentPath = documentDirectory.path;
  print(' this is the part $documentPath');
  // String path = '${documentPath!.path}/vote.pdf';
  final diraa = await getTemporaryDirectory();
  final path = "${diraa.absolute.path}/Original result.pdf";
  print(' this is the part $path');
  File receiptFile = File(path);
  receiptFile.writeAsBytesSync(await pdf.save());
  Share.shareFiles([path]);
}

pw.Widget _body(List<Model> govermentCouncilModel) {
  return pw.ListView.separated(
    separatorBuilder: (pw.Context context, int index) => pw.Divider(),
    itemCount: 1,
    itemBuilder: (context, index) {
      List<pw.Widget> list1 = [];
      for (var element in govermentCouncilModel) {
        list1.add(
          pw.SizedBox(
            height: 15,
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Text(element.list['name']),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(element.id, textAlign: pw.TextAlign.right),
                ),
              ],
            ),
          ),
        );
      }

      /*    go.forEach((key, value) {
                  
                }); */

      return pw.Column(
        mainAxisSize: pw.MainAxisSize.min,
        children: [...list1],
      );
    },
  );
}

pw.Widget _myHeader(String governingCouncil) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.SizedBox(
        height: 20,
        child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
          pw.Text(
            governingCouncil,
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
          ),
        ]),
      ),
      pw.SizedBox(
        height: 20,
        child: pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'Name',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(
              'Count(s)',
              style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
            ),
            /* pw.Text(
                          'Level',
                          style: pw.TextStyle(
                              fontSize: 14, fontWeight: pw.FontWeight.bold),
                        ), */
          ],
        ),
      ),
    ],
  );
}
