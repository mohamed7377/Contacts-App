import 'package:contacts/Home_Screen/Widget/Contant_View.dart';
import 'package:contacts/Home_Screen/Widget/TextInput.dart';
import 'package:contacts/Home_Screen/validator/validator.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController text1Controller = TextEditingController();
  TextEditingController text2Controller = TextEditingController();
  late double height;
  late double width;
  List<Map<String, String>> contacts = [];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    height = h;
    width = w;
    return Scaffold(
      backgroundColor: const Color(0xff9B9B9B),
      appBar: AppBar(
        title: const Text("Contacts Screen"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(0.04 * width),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextInput(
                    width: width,
                    title: "Enter Your Name Here",
                    tController: text1Controller,
                    textIcon: Icons.edit,
                    textInput: TextInputType.name,
                    validator: Validator.name,
                ),
                SizedBox(
                  height: 0.03 * height,
                ),
                TextInput(
                    width: width,
                    title: "Enter Your Number Here",
                    tController: text2Controller,
                    textIcon: Icons.phone,
                    textInput: TextInputType.phone,
                    validator: Validator.phone
                ),
                SizedBox(height: 0.03 * height),
                Row(
                  children: [
                    // Add Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()){
                            addContact();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0.04 * width),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(0.1 * width))),
                        child: Text(
                          "Add",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 0.05 * width,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.03 * height),
                ContantView(
                  width: width,
                  height: height,
                  phone: contacts.length > 0 ? contacts[0]['phone'] ?? '' : '',
                  name: contacts.length > 0 ? contacts[0]['name'] ?? '' : '',
                  isVisable: contacts.length > 0,
                  btnClick: deleteContact,
                  index: 0,
                ),
                SizedBox(height: 0.03 * height),
                ContantView(
                  width: width,
                  height: height,
                  phone: contacts.length > 1 ? contacts[1]['phone'] ?? '' : '',
                  name: contacts.length > 1 ? contacts[1]['name'] ?? '' : '',
                  isVisable: contacts.length > 1,
                  btnClick: deleteContact,
                  index: 1,
                ),
                SizedBox(height: 0.03 * height),
                ContantView(
                  width: width,
                  height: height,
                  phone: contacts.length > 2 ? contacts[2]['phone'] ?? '' : '',
                  name: contacts.length > 2 ? contacts[2]['name'] ?? '' : '',
                  isVisable: contacts.length > 2,
                  btnClick: deleteContact,
                  index: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void addContact() {
    if (contacts.length < 3 &&
        text1Controller.text.isNotEmpty &&
        text2Controller.text.isNotEmpty) {
      setState(() {
        contacts.add({
          'name': text1Controller.text,
          'phone': text2Controller.text,
        });
        text1Controller.clear();
        text2Controller.clear();
      });
    }
  }

}
