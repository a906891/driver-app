import 'package:driver_app/tabPages/form/data_list.dart';
import 'package:driver_app/tabPages/form/models/store_countries/store_countries_model.dart';
import 'package:driver_app/tabPages/form_tab_view.dart';
import 'package:flutter/material.dart';

class FormItem extends StatelessWidget {
  final StoreCountries storeCountries;


  FormItem({Key? key,required this.storeCountries}) : super(key: key);


  @override
  void initState() {
    // TODO: implement initState
    var a = storeCountries.country?.name;
    FormTabPage.countrynames?.add(a!);
    print("Added to list");
    print(FormTabPage.countrynames);
  }



  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        children: [

          Text("count from store ${storeCountries.country?.name}"),

          Text("count from store ${storeCountries.country?.dialCode}"),

          Text("count from store ${storeCountries.user?.firstName}"),

          const SizedBox(
            height: 15.0,
          ),
        ],

      ),
    );
  }
}


