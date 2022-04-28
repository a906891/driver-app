
class StoreCountriesModel{
  int? count;
  int? page;
  int? pageSize;
  List<StoreCountries>? data;

  StoreCountriesModel({this.count,this.page,this.pageSize,this.data});

  StoreCountriesModel.fromJson(Map<String,dynamic> json){
    count = json['count'];
    page = json['page'];
    pageSize = json['pageSize'];
    if(json['data'] != null){
      data = <StoreCountries>[];
      json['data'].forEach((v){
        data!.add(StoreCountries.fromJson(v));
      });
    }
  }
}

class StoreCountries{
  String? id;
  bool? isDefault;
  bool? active;
  Country? country;
  User? user;

  StoreCountries({this.id,this.isDefault,this.active,this.country,this.user});

  StoreCountries.fromJson(Map<String,dynamic> json){
    id = json['id'];
    isDefault = json['isDefault'];
    active = json['active'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    user =
        json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class Country{
  String? id;
  String? name;
  String? value;
  String? dialCode;
  String? code;
  String? img;
  String? imgCdn;
  String? flag;
  String? lang;

  Country({this.id,this.name,this.value,
      this.dialCode,this.code,this.img,this.imgCdn,this.flag,this.lang});

  Country.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    value = json['value'];
    dialCode = json['dialCode'];
    img = json['img'];
    imgCdn = json['imgCdn'];
    flag = json['flag'];
    lang = json['lang'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['value'] = this.value;
    data['dialCode'] = this.dialCode;
    data['img'] = this.img;
    data['imgCdn'] = this.imgCdn;
    data['flag'] = this.flag;
    data['lang'] = this.lang;

    return data;
  }
}


class User{
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  User({this.id,this.firstName,this.lastName,this.email});

  User.fromJson(Map<String,dynamic> json){
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data = Map<String,dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    return data;
}
}