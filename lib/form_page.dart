import 'dart:convert';

import 'package:demo/dynamic_form_data.dart';
import 'package:demo/form_model.dart';
import 'package:demo/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  DynamicFormData formData = DynamicFormData();
  List pageResult = [];
  int currentIndex = 0;

  getFormData() async {
    // try {
    final response = await rootBundle.loadString('assets/new.json');
    FormModel formModel = FormModel.fromJson(jsonDecode(response));
    if (formModel.result != null) {
      setState(() {
        formData.result = formModel.result ?? [];
        pageResult = formData.result[0];
      });
    }
    // } catch (e) {
    //   debugPrint("$e");
    // }
  }

  void submit(context) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    if (currentIndex != formData.result.length-1) {
      setState(() {
        currentIndex++;
        pageResult = formData.result[currentIndex];
      });
    }
  }

  @override
  void initState() {
    getFormData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic form"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(formData.result.length, (index) => Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        pageResult = formData.result[index];
                      });
                    },
                    child: Container(
                      height: 48,
                    width: 48,
                    child: Text("${index+1}",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(buildWidth(context)*0.2),
                      color: currentIndex==index ? Colors.blueAccent : Colors.grey,),
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(top: 16),
                    alignment: Alignment.center,),
                  ),
                  index<formData.result.length-1 ?
                  Container(height: 8,
                    margin: EdgeInsets.only(top: 16),
                    width: buildWidth(context)*0.1,
                    color: Colors.grey,) : Container()
                ],
              )),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Util().switchWidgets(context, pageResult[index]),
                  );
                },
                itemCount: pageResult.length,
                padding: EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: buildWidth(context),
        margin: EdgeInsets.all(16),
        child: ElevatedButton(
            onPressed: () => submit(context), child:
        Text(currentIndex == formData.result.length-1 ? "Submit" : "Next")),
      ),
    );
  }
}
