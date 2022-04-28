

import 'package:driver_app/global/base_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../global/queries.dart';
import 'models/store_countries_model.dart';

class FormService extends BaseService with Queries{

  Future getStoreCountries() async{
    var result = await client.query(QueryOptions(document: gql(storeCountries)));
    if(result.hasException){
      print(result.exception?.graphqlErrors.toList());
      print(result.exception?.linkException.toString());
      throw Exception('Internal Error');
    }
    else{
      return StoreCountriesModel.fromJson(result.data!['storeCountries']);
    }

  }
}