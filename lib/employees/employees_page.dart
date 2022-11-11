import 'package:flutter/material.dart';
import 'package:flutter_myapp/employees/employee_create.dart';
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

  List<EmployeesModel> employeesList =
      []; // menampilkan semua data, diawal masih kosong
  List<EmployeesModel> searchEmployeesList =
      []; // menampilkan filtered data, diawal masih kosong

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
        searchEmployeesList = value;
        employeesList = searchEmployeesList;
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
        actions: [
          IconButton(
            onPressed: () {
              // membuka halaman EmployeeCreate
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    const EmployeeCreate(title: "Create New Employee"),
              ));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint("Create New Employee"),
        backgroundColor: globalColor,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // filter data employees
            Container(
              padding: const EdgeInsets.all(4),
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: "Search Data",
                  suffixIcon: Icon(
                    Icons.search,
                    color: globalColor,
                  ),
                ),
                onChanged: (keyword) {
                  // proses filtering data employees
                  setState(() {
                    employeesList = searchEmployeesList
                        .where(
                          (element) =>
                              (element.name!.toLowerCase().contains(
                                    keyword.toLowerCase(),
                                  )) ||
                              (element.address!.toLowerCase().contains(
                                    keyword.toLowerCase(),
                                  )),
                        )
                        .toList();
                  });
                },
              ),
            ),
            Expanded(
              // ada GridView.builder() dan ListView.builder()
              child: GridView.builder(
                padding: const EdgeInsets.all(4),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // membagi layar menjadi 3 kolom
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
              /*ListView.builder(
                padding: const EdgeInsets.all(6),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: employeesList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: globalColor, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ListTile(
                        onTap: () {
                          // membuka EmployeeDetail
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
                        leading: Image(
                          image: NetworkImage(employeesList[index].photo!),
                          fit: BoxFit.cover,
                          width: 70,
                          height: 70,
                        ),
                        title: Text(
                          "Name: ${employeesList[index].name}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Salary: ${employeesList[index].salary}\nAddress: ${employeesList[index].address}",
                        ),
                      ),
                    ),
                  );
                },
              ),*/
            ),
          ],
        ),
      ),
    );
  }
}
