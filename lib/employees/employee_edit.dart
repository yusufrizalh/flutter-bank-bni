import 'package:flutter/material.dart';
import 'package:flutter_myapp/employees/models/employees_model.dart';
import 'package:http/http.dart' as http;

import 'forms/employee_form.dart';

class EmployeeEdit extends StatefulWidget {
  final EmployeesModel employeesModel;
  final String title;
  const EmployeeEdit({
    super.key,
    required this.employeesModel,
    required this.title,
  });

  @override
  State<EmployeeEdit> createState() => _EmployeeEditState();
}

class _EmployeeEditState extends State<EmployeeEdit> {
  // properties
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.employeesModel.name);
    salaryController =
        TextEditingController(text: widget.employeesModel.salary);
    addressController =
        TextEditingController(text: widget.employeesModel.address);
  }

  Future updateEmployee(BuildContext context) async {
    String url = "http://172.16.4.51/flutter-api/employees/updateEmployee.php";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          "id": widget.employeesModel.id.toString(),
          "name": nameController.text,
          "salary": salaryController.text,
          "address": addressController.text,
        },
      );
      if (response.statusCode == 200) {
        debugPrint(response.body);
      } else {
        throw Exception("Error while updating employee...");
      }
    } catch (errorMsg) {
      throw Exception(errorMsg.toString());
    }
  }

  static const globalColor = Color.fromRGBO(212, 18, 67, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: globalColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmployeeForm(
              formKey: formKey,
              nameController: nameController,
              salaryController: salaryController,
              addressController: addressController,
            ),
            const Padding(padding: EdgeInsets.only(top: 32)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: globalColor,
                alignment: Alignment.center,
              ),
              onPressed: () {
                // proses mengubah data employee
                if (formKey.currentState!.validate()) {
                  updateEmployee(context);
                  // memunculkan pesan berhasil
                  const snackBarMsg = SnackBar(
                    content: Text("Employee is updated"),
                    backgroundColor: globalColor,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBarMsg);
                  // redirect ke halaman depan
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/", (route) => false);
                }
              },
              child: const Text("Update Employee"),
            ),
          ],
        ),
      ),
    );
  }
}
