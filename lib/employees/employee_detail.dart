import 'package:flutter/material.dart';
import 'package:flutter_myapp/employees/employee_edit.dart';
import './models/employees_model.dart';

class EmployeeDetail extends StatefulWidget {
  final EmployeesModel employeesModel;
  const EmployeeDetail({super.key, required this.employeesModel});
  @override
  State<EmployeeDetail> createState() => _EmployeeDetailState();
}

class _EmployeeDetailState extends State<EmployeeDetail> {
  static const globalColor = Color.fromRGBO(212, 18, 67, 1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(width: 3, color: Colors.white),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(widget.employeesModel.photo!),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
              const Padding(padding: EdgeInsets.only(top: 16)),
              Text("Name: ${widget.employeesModel.name}"),
              const Padding(padding: EdgeInsets.only(top: 6)),
              Text("Salary: ${widget.employeesModel.salary}"),
              const Padding(padding: EdgeInsets.only(top: 6)),
              Text("Address: ${widget.employeesModel.address}"),
              const Padding(padding: EdgeInsets.only(top: 6)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: globalColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  // membuka form edit employee
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EmployeeEdit(
                      employeesModel: widget.employeesModel,
                      title: "Edit Employee",
                    ),
                  ));
                },
                child: const Text(
                  "Edit Employee",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
