import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Report {
  Report(
      {@required this.id,
      @required this.crimeType,
      @required this.details,
      @required this.location,
      @required this.district,
      @required this.province,
      @required this.tehsil});
  final String id;
  final String crimeType;
  final String details;
  final String location;
  final String province;
  final String district;
  final String tehsil;

  //TODO: Factory Constructor
  factory Report.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String crimeType = data['CrimeType'];
    final String details = data['Details'];
    final String location = data['Location'];
    final String province = data['Province'];
    final String district = data['District'];
    final String tehsil = data['Tehsil'];

    return Report(
      id: documentId,
      crimeType: crimeType,
      details: details,
      location: location,
      province: province,
      district: district,
      tehsil: tehsil,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'CrimeType': crimeType,
      'Details': details,
      'Location': location,
      'Province': province,
      'District': district,
      'Tehsil': tehsil,

    };
  }
}
