

import 'package:driver_app/tabPages/form/models/store_countries/store_countries_model.dart';
import 'package:flutter/material.dart';

class FormItem extends StatelessWidget {
  final StoreCountriesModel storeCountriesModel;

  const FormItem({Key? key,required this.storeCountriesModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text("count from store ${storeCountriesModel.count}"),
          ],

    )
    );
  }
}
