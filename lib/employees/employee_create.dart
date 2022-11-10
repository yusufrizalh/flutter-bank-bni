import 'package:flutter/material.dart';
import 'package:flutter_myapp/employees/forms/employee_form.dart';
import 'package:http/http.dart' as http;

class EmployeeCreate extends StatefulWidget {
  final String title;
  const EmployeeCreate({super.key, required this.title});

  @override
  State<EmployeeCreate> createState() => _EmployeeCreateState();
}

class _EmployeeCreateState extends State<EmployeeCreate> {
  // properties
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  static const globalColor = Color.fromRGBO(212, 18, 67, 1);

  Future createEmployee(BuildContext context) async {
    String url = "http://172.16.4.51/flutter-api/employees/createEmployee.php";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          "name": nameController.text,
          "salary": salaryController.text,
          "address": addressController.text,
        },
      );
      if (response.statusCode == 200) {
        debugPrint(response.body);
      } else {
        throw Exception("Error while creating new employee...");
      }
    } catch (errorMsg) {
      throw Exception(errorMsg.toString());
    }
  }

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
                // proses menyimpan data employee baru
                if (formKey.currentState!.validate()) {
                  createEmployee(context);
                  // memunculkan pesan berhasil
                  const snackBarMsg = SnackBar(
                    content: Text("New Employee is registered"),
                    backgroundColor: globalColor,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBarMsg);
                  // redirect ke halaman depan
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/", (route) => false);
                }
              },
              child: const Text("Create Employee"),
            ),
          ],
        ),
      ),
    );
  }
}
