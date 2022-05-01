part of 'form_bloc.dart';

abstract class FormState{}

class FormInitial extends FormState{}

class FormLoading extends FormState{}

class FormSuccess extends FormState{
  final StoreCountriesModel storeCountriesModel;
  final String? message;

  FormSuccess({this.message,required this.storeCountriesModel});

}

class FormFailure extends FormState{
  final String message;

  FormFailure({required this.message});
}