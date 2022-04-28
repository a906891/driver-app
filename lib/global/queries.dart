class Queries{

  final String storeCountries = '''
  query storeCountries(\$page: Int, \$search: String, \$limit: Int, \$sort: String, \$store: ID!) {
  storeCountries(
    page: \$page
    search: \$search
    limit: \$limit
    sort: \$sort
    store: \$store
  ) {
    count
    page
    pageSize
    data {
      id
      default
      active
      country {
        id
        name
        value
        dialCode
        code
        img
        imgCdn
        flag
        lang
      }
      user {
        id
        firstName
        lastName
        email
      }
    }
  }
}
  ''';

  final String cities = '''
  query cities(\$page: Int, \$search: String, \$limit: Int, \$sort: String) {
  cities(page: \$page, search: \$search, limit: \$limit, sort: \$sort) {
    count
    page
    pageSize
    data {
      id
      name
      slug
      country {
        id
        name
      }
      state {
        id
        name
      }
      location
      lat
      lng
    }
  }
}
  ''';



  final String states = '''
  query states(\$page: Int, \$search: String, \$limit: Int, \$sort: String, \$country: ID) {
  states(
    page: \$page
    search: \$search
    limit: \$limit
    sort: \$sort
    country: \$country
  ) {
    count
    page
    pageSize
    data {
      id
      name
      value
      code
      img
      imgCdn
      flag
      lang
      sort
      active
      createdAt
      updatedAt
    }
  }
}
  ''';


  final String categories='''
  query categories(\$page: Int, \$search: String, \$limit: Int, \$sort: String, \$megamenu: Boolean, \$featured: Boolean, \$active: Boolean, \$img: Boolean, \$shopbycategory: Boolean, \$store: ID) {
  categories(
    page: \$page
    search: \$search
    limit: \$limit
    sort: \$sort
    megamenu: \$megamenu
    featured: \$featured
    active: \$active
    img: \$img
    shopbycategory: \$shopbycategory
    store: \$store
  ) {
    count
    page
    pageSize
    data {
      id
      name
      namePath
      categoryId
      parent
      slug
      img
      imgCdn
      banner
      bannerCdn
      level
      link
      metaTitle
      metaDescription
      metaKeywords
      keywords
      position
      megamenu
      active
      featured
      featuredSort
      shopbycategory
      createdAt
      updatedAt
      store
    }
  }
}
''';

  final String amenities ='''
  query amenities(\$page: Int, \$search: String, \$limit: Int, \$sort: String, \$store: ID) {
  amenities(
    page: \$page
    search: \$search
    limit: \$limit
    sort: \$sort
    store: \$store
  ) {
    count
    page
    pageSize
    data {
      id
      name
      icon
      user {
        id
        firstName
        lastName
        email
        phone
      }
      store {
        id
        name
      }
    }
  }
}
''';



}