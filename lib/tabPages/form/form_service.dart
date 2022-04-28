
import 'package:driver_app/global/base_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../global/queries.dart';
import 'models/store_countries/store_countries_model.dart';

class FormService extends BaseService with Queries{

  String? defaultStoreId = "62347567367d4bd1e090c208";

  Future getStoreCountries() async{
    print("function started");
    var result = await client.query(QueryOptions(document: gql(storeCountries),
    variables: {'store':'$defaultStoreId'}));

    if(result.hasException){
      print(result.exception?.graphqlErrors.toList());
      print(result.exception?.linkException.toString());
      throw Exception('Internal Error');
    }
    else{
      print(result.data!["storeCountries"]["data"]);
      return StoreCountriesModel.fromJson(result.data!['storeCountries']);
    }

  }
}