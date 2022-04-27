import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormTabPage extends StatefulWidget {
  const FormTabPage({Key? key}) : super(key: key);

  @override
  State<FormTabPage> createState() => _FormTabPageState();
}

class _FormTabPageState extends State<FormTabPage> {

  TextEditingController nameEditableController = TextEditingController();
  TextEditingController phoneEditableController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Basic Information"),

            const SizedBox(height: 15.0,),

            const Text("Name",style: TextStyle(fontSize: 15.0,fontFamily: 'Montserrat-Black'),),

            const SizedBox(height: 15.0,),

            TextField(
              controller: nameEditableController,
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.black,fontSize: 16),
              decoration: InputDecoration(
                hintText: "Enter Business Name",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2,color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2,color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintStyle: const TextStyle(color: Colors.grey)
              ),
            ),

            const SizedBox(height: 15.0,),

            TextField(
              controller: phoneEditableController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Enter Phone No",
                enabledBorder: OutlineInputBorder(
                  borderSide:const BorderSide(width: 2,color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2,color: Colors.blue),
                  borderRadius: BorderRadius.circular(20)
                ),
                  hintStyle: const TextStyle(color: Colors.grey)
              ),
            )
          ],
        ),
      ),
    );;
  }
}
