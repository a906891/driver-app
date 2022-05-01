part of 'form_bloc.dart';

abstract class FormState1{}

class FormInitial extends FormState1{}

class FormLoading extends FormState1{}

class FormSuccess extends FormState1{
  final StoreCountriesModel storeCountriesModel;
  final String? message;

  FormSuccess({this.message,required this.storeCountriesModel});

}

class FormFailure extends FormState1{
  final String message;

  FormFailure({required this.message});
}