// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class EmployeeForm extends StatefulWidget {
  // properties
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController;
  final TextEditingController salaryController;
  final TextEditingController addressController;

  EmployeeForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.salaryController,
    required this.addressController,
  });

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: widget.nameController,
              decoration: const InputDecoration(
                labelText: "Please enter employee name",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              controller: widget.salaryController,
              decoration: const InputDecoration(
                labelText: "Please enter employee salary",
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              controller: widget.addressController,
              decoration: const InputDecoration(
                labelText: "Please enter employee address",
                prefixIcon: Icon(Icons.location_city),
              ),
              maxLines: 3,
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
          ],
        ),
      ),
    );
  }
}
