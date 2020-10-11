import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinecrimereportingsystem/app/Home/Models/Report.dart';
import 'package:onlinecrimereportingsystem/common_widgets/platform_alert_dialouge.dart';
import 'package:onlinecrimereportingsystem/common_widgets/platform_exception_alert_dialouge.dart';
import 'package:onlinecrimereportingsystem/services/database.dart';

class EditReportsPage extends StatefulWidget {
  const EditReportsPage({Key key, @required this.database, this.report})
      : super(key: key);
  final Database database;
  final Report report;

  static Future<void> show(BuildContext context,
      {Database database, Report report}) async {
    await Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
      builder: (context) => EditReportsPage(
        database: database,
        report: report,
      ),
      fullscreenDialog: true,
    ));
  }

  @override
  _EditReportsPageState createState() => _EditReportsPageState();
}

class _EditReportsPageState extends State<EditReportsPage> {
  final _formKey = GlobalKey<FormState>();

  // TODO: Variables to save the FormData:
  String _crimeType;
  String _details;
  String _location;
  String _province;
  String _district;
  String _tehsil;

  @override
  void initState() {
    super.initState();
    if (widget.report != null) {
      _crimeType = widget.report.crimeType;
      _details = widget.report.details;
      _location = widget.report.location;
      _province = widget.report.province;
      _district = widget.report.district;
      _tehsil = widget.report.tehsil;
    }
  }

  bool _validateFormAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateFormAndSaveForm()) {
      try {
        final id = widget.report?.id ?? documentIdFromCurrentDate();
        final report = Report(
          id: id,
          crimeType: _crimeType,
          details: _details,
          location: _location,
          province: _province,
          district: _district,
          tehsil: _tehsil,
        );
        await widget.database.setReport(report);
        Navigator.of(context).pop();
        PlatformAlertDialouge(
          title: 'Report Submitted',
          content: 'Report is submitted successfully ',
          defaultActionText: 'OK',
        ).show(context);
      } on PlatformException catch (e) {
        PlatformExceptionAlertDialouge(
          title: 'Operation Failed',
          exception: e,
        ).show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(widget.report == null ? 'New Report' : 'Report Details'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Sumbit',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: _submit,
          )
        ],
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'CRIME TYPE'),
        initialValue: _crimeType,
        onSaved: (value) => _crimeType = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'CRIME DETAILS'),
        initialValue: _details,
        // TODO: Validator is optional.. keep or delete;
        minLines: 2,
        maxLines: 4,
        expands: false,
        validator: (value) => value.isNotEmpty ? null : 'Provide a Cime Details',
        onSaved: (value) => _details = value,
      ),
      TextFormField(
        focusNode: FocusNode(),
        initialValue: _location,
        decoration: InputDecoration(
          labelText: 'COMPLAINT LOCATION',
          ),
        onSaved: (value) => _location = value,

      ),
      TextFormField(
        initialValue: _province,
      decoration: InputDecoration(
        labelText: 'PROVINCE',
      ),
        onSaved: (value) => _province = value,
      ),
      TextFormField(
        initialValue: _district,
        decoration: InputDecoration(
          labelText: 'DISTRICT'
        ),
        onSaved: (value) => _district = value,
      ),
      TextFormField(
        initialValue: _tehsil,
        decoration: InputDecoration(
          labelText: 'TEHSIL',
        ),
        onSaved: (value) => _tehsil = value,
      ),
    ];
  }
}
