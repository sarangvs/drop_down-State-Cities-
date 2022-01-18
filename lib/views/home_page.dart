import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:first_project/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Home Screen"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                dataController.fetchData();
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () => dataController.getStates(),
              icon: const Icon(Icons.get_app)),
          IconButton(
              onPressed: () => dataController.getCities('kerala'),
              icon: const Icon(Icons.cancel))
        ],
      ),
      body: GetBuilder<DataController>(
        builder: (controller)=> Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButtonFormField(
                  value: dataController.dropDown,
                  icon: const Icon(Icons.arrow_downward),
                  // underline: Container(
                  //   height: 2,
                  //   color: Colors.red,
                  // ),
                  items: dataController.states
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dataController.dropDown = newValue!;
                      controller.update();
                      dataController.getCities(newValue);
                    });
                  }),
              DropdownButtonFormField(
                   value: dataController.dropDownCity,
                  icon: const Icon(Icons.arrow_downward),
                  // underline: Container(
                  //   height: 2,
                  //   color: Colors.red,
                  // ),
                  items: dataController.cities
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {

                    });
                  }),
              const SizedBox(
                height: 50,
              ),
              Container(
                color: Colors.red,
                height: 50,
                width: 400,
                child: const Center(
                  child: Text(
                    "Done",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }


}
