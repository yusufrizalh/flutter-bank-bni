import 'package:flutter/material.dart';
import 'package:flutter_myapp/nested/models/nested_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;

class NestedData extends StatefulWidget {
  final String title;
  const NestedData({super.key, required this.title});

  @override
  State<NestedData> createState() => _NestedDataState();
}

class _NestedDataState extends State<NestedData> {
  String url = "http://172.16.4.51/flutter-api/data/data.json";

  List<NestedModel> employeesList =
      []; // menampilkan semua data, diawal masih kosong
  List<NestedModel> searchEmployeesList =
      []; // menampilkan filtered data, diawal masih kosong

  Future<List<NestedModel>> getEmployeesList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        List<NestedModel> employees = parsingJson(response.body);
        return employees;
      } else {
        throw Exception("Error while getting employees...");
      }
    } catch (errorMsg) {
      throw Exception(errorMsg.toString());
    }
  }

  List<NestedModel> parsingJson(String responseBody) {
    final parsedJson =
        converter.json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsedJson
        .map<NestedModel>((json) => NestedModel.fromJson(json))
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
                              (element.name![0].first!.toLowerCase().contains(
                                    keyword.toLowerCase(),
                                  )) ||
                              (element.name![0].last!.toLowerCase().contains(
                                    keyword.toLowerCase(),
                                  )) ||
                              (element.department![0].name!
                                  .toLowerCase()
                                  .contains(
                                    keyword.toLowerCase(),
                                  )) ||
                              (element.address![0].city!.toLowerCase().contains(
                                    keyword.toLowerCase(),
                                  )),
                        )
                        .toList();
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
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
                        },
                        leading: Image(
                          image: NetworkImage(employeesList[index].photo!),
                          fit: BoxFit.cover,
                          width: 70,
                          height: 70,
                        ),
                        title: Text(
                          "Name: ${employeesList[index].name![0].first} ${employeesList[index].name![0].last}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Salary: ${employeesList[index].salary}\nAddress: ${employeesList[index].address![0].city}\nDept: ${employeesList[index].department![0].name!}\nSupervisor: ${employeesList[index].department![0].supervisor![0].name!}\nManager: ${employeesList[index].department![0].supervisor![0].manager![0].name!}",
                        ),
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
