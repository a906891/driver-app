

import 'package:driver_app/global/base_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../global/queries.dart';

class FormService extends BaseService with Queries{

  Future getAllcategories() async{
    var result = await client.query(QueryOptions(document: gql(categories)));
    if(result.hasException){
      print(result.exception?.graphqlErrors.toList());
      print(result.exception?.linkException.toString());
      throw Exception('Internal Error');
    }
    else{
      return result.data!['categories'];
    }

  }
}