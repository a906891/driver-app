import 'package:graphql_flutter/graphql_flutter.dart';

class BaseService{
  GraphQLClient? _client;

  BaseService(){
    inIt();
  }

  inIt(){
    final HttpLink httpLink = HttpLink("https://api.atozzones.com/graphql");

    _client = GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: InMemoryStore()));
    return this;

  }

  GraphQLClient get client=> _client! ;

}

