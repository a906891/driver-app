import 'package:driver_app/tabPages/form/data_list.dart';
import 'package:driver_app/tabPages/form/models/store_countries/store_countries_model.dart';
import 'package:driver_app/tabPages/form_tab_view.dart';
import 'package:flutter/material.dart';

class FormItem extends StatelessWidget {
  final StoreCountries storeCountries;

  var selectedCountry;
  static var names = {};
  static var a = 0;

  FormItem({Key? key,required this.storeCountries}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // adding in map if it does not have same country
    if(!names.containsValue(storeCountries.country?.name))
      {
        names[a] = storeCountries.country?.name;
        a++;
        print("Added to list");

      }

    return Center(
      child: Column(
        children: [

          SizedBox(
            width: 400.0,
            child: DropdownButton(
              // Initial Value
              value: selectedCountry,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              // Array list of items
              items: names.values.map((var items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),

              onChanged: (var newValue) {
                  selectedCountry = newValue;
                  print(selectedCountry);
              },
            ),
          ),

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





