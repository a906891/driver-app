import 'package:driver_app/tabPages/form/models/store_countries/store_countries_model.dart';
import 'package:driver_app/tabPages/form/service/form_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/store_countries/store_countries_model.dart';
part 'form_event.dart';
part 'form_state.dart';


class FormBloc extends Bloc<FormEvent,FormState1> {

  final FormService _service = FormService();

  FormBloc(): super(FormInitial()) {
    on<FormEvent>((event,emit) async {
      try{
        StoreCountriesModel storeCountriesModel = 
            await _service.getStoreCountries();
        emit(FormSuccess(storeCountriesModel: storeCountriesModel));
      } on Exception catch (e){
        emit(FormFailure(message: "Error"));
      }
    });
  }


  }

