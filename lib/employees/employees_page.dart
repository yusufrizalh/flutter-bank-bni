import 'package:flutter/material.dart';
import 'package:flutter_myapp/employees/employee_detail.dart';
import './models/employees_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;

class EmployeesPage extends StatefulWidget {
  final String title;
  const EmployeesPage({super.key, required this.title});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  String url = "http://172.16.4.51/flutter-api/employees/getAllEmployees.php";

  List<EmployeesModel> employeesList = []; // diawal masih kosong

  Future<List<EmployeesModel>> getEmployeesList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        List<EmployeesModel> employees = parsingJson(response.body);
        return employees;
      } else {
        throw Exception("Error while getting employees...");
      }
    } catch (errorMsg) {
      throw Exception(errorMsg.toString());
    }
  }

  List<EmployeesModel> parsingJson(String responseBody) {
    final parsedJson =
        converter.json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsedJson
        .map<EmployeesModel>((json) => EmployeesModel.fromJson(json))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    getEmployeesList().then((value) {
      setState(() {
        employeesList = value;
      });
    });
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
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(4),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: employeesList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // melihat EmployeeDetail pada Modal
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            width: double.infinity,
                            height: 500,
                            color: globalColor,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: EmployeeDetail(
                                employeesModel: employeesList[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: globalColor,
                        image: DecorationImage(
                          image: NetworkImage(employeesList[index].photo!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        alignment: const AlignmentDirectional(0, 0),
                        children: [
                          Text(
                            employeesList[index].name!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: globalColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
