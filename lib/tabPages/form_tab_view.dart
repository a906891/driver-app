import 'package:driver_app/tabPages/form/form_service.dart';
import 'package:driver_app/tabPages/form/models/store_countries/store_countries_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormTabPage extends StatefulWidget {
  const FormTabPage({Key? key}) : super(key: key);


  @override
  State<FormTabPage> createState() => _FormTabPageState();
}

class _FormTabPageState extends State<FormTabPage> {

  TextEditingController nameEditableController = TextEditingController();
  TextEditingController phoneEditableController = TextEditingController();
  TextEditingController secondphoneEditableController = TextEditingController();
  TextEditingController thirdphoneEditableController = TextEditingController();
  TextEditingController emailEditableController = TextEditingController();
  TextEditingController yearStartedEditableController = TextEditingController();
  TextEditingController descriptionEditableController = TextEditingController();
  TextEditingController videoEditableController = TextEditingController();
  TextEditingController remarkEditableController = TextEditingController();
  TextEditingController servicesEditableController = TextEditingController();
  TextEditingController facilitiesEditableController = TextEditingController();
  TextEditingController experienceEditableController = TextEditingController();

  double spaceBetweenTextAndField = 5.0;
  double spaceAbovepair = 15.0;

  FormService formService = FormService();
  StoreCountriesModel storeCountriesModel = StoreCountriesModel();

  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  void initState() {
    // TODO: implement initState
    formService.getStoreCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Basic Information",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),

            // Countires come here

            DropdownButton(
              // Initial Value
              value: dropdownvalue,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),

            DropdownButton(
              // Initial Value
              value: dropdownvalue,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),

            DropdownButton(
              // Initial Value
              value: dropdownvalue,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),


//Name
            SizedBox(height: spaceAbovepair,),

            const Text(" Name",style: TextStyle(fontSize: 18.0),),

            SizedBox(height: spaceBetweenTextAndField,),

            Container(
              height: 55.0,
              child: TextField(
                controller: nameEditableController,
                keyboardType: TextInputType.name,
                style: const TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                  hintText: "Enter Business Name",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2,color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2,color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),
//Phone No
            SizedBox(height: spaceAbovepair,),

            const Text(" Phone No",style: TextStyle(fontSize: 18.0),),

            SizedBox(height: spaceBetweenTextAndField,),

            Container(
              height: 55.0,
              child: TextField(
                controller: phoneEditableController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                  hintText: "Enter Phone No",
                  enabledBorder: OutlineInputBorder(
                    borderSide:const BorderSide(width: 2,color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2,color: Colors.blue),
                    borderRadius: BorderRadius.circular(10)
                  ),
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),
//Second Phone No
            SizedBox(height: spaceAbovepair,),

            const Text(" Second Phone No",style: TextStyle(fontSize: 18.0),),

             SizedBox(height: spaceBetweenTextAndField,),

            Container(
              height: 55.0,
              child: TextField(
                controller: secondphoneEditableController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Second Phone No",
                    enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(width: 2,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2,color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),
//Third Phone No
            SizedBox(height: spaceAbovepair,),

            const Text(" Third Phone No",style: TextStyle(fontSize: 18.0),),

             SizedBox(height: spaceBetweenTextAndField,),


            Container(
              height: 55.0,
              child: TextField(
                controller: thirdphoneEditableController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Enter Third Phone No",
                    enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(width: 2,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2,color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),
//Email
            SizedBox(height: spaceAbovepair,),

            const Text(" Email",style: TextStyle(fontSize: 18.0),),

             SizedBox(height: spaceBetweenTextAndField,),

            Container(
              height: 55.0,
              child: TextField(
                controller: emailEditableController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Enter Business Email",
                    enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(width: 2,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2,color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),


//Year Started
            SizedBox(height: spaceAbovepair,),

            const Text(" Year Started",style: TextStyle(fontSize: 18.0),),

             SizedBox(height: spaceBetweenTextAndField,),

            Container(
              height: 55.0,
              child: TextField(
                controller: yearStartedEditableController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Enter Business Started On The Year",
                    enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(width: 2,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2,color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),


//Description
            SizedBox(height: spaceAbovepair,),

            const Text(" Description",style: TextStyle(fontSize: 18.0),),

             SizedBox(height: spaceBetweenTextAndField,),

            Container(
              height: 55.0,
              child: TextField(
                controller: descriptionEditableController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Enter Business Description",
                    enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(width: 2,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2,color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),


//Video
            SizedBox(height: spaceAbovepair,),

            const Text(" Video",style: TextStyle(fontSize: 18.0),),

             SizedBox(height: spaceBetweenTextAndField,),

            Container(
              height: 55.0,
              child: TextField(
                controller: videoEditableController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Enter Video URL",
                    enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(width: 2,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2,color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),

//Remark
            SizedBox(height: spaceAbovepair,),

            const Text(" Remark",style: TextStyle(fontSize: 18.0),),

             SizedBox(height: spaceBetweenTextAndField,),

            Container(
              height: 55.0,
              child: TextField(
                controller: remarkEditableController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Write Remark",
                    enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(width: 2,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2,color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),

            SizedBox(height: spaceAbovepair,),

//House of Operation
            const Text("Hours Of Operation",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),

//Services
            SizedBox(height: spaceAbovepair,),

            const Text(" Services",style: TextStyle(fontSize: 18.0),),

             SizedBox(height: spaceBetweenTextAndField,),

            Container(
              height: 55.0,
              child: TextField(
                controller: servicesEditableController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Enter Services",
                    enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(width: 2,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2,color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),

//Facilities
            SizedBox(height: spaceAbovepair,),

            const Text(" Facilities",style: TextStyle(fontSize: 18.0),),

             SizedBox(height: spaceBetweenTextAndField,),

            Container(
              height: 55.0,
              child: TextField(
                controller: facilitiesEditableController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Enter Facilities",
                    enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(width: 2,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2,color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),

//Experience
            SizedBox(height: spaceAbovepair,),

            const Text(" Enter Experience",style: TextStyle(fontSize: 18.0),),

             SizedBox(height: spaceBetweenTextAndField,),

            Container(
              height: 55.0,
              child: TextField(
                controller: experienceEditableController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Write Remark",
                    enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(width: 2,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2,color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),

            const SizedBox(height: 20,),
            

          ],
        ),
      ),
    );;
  }
}
