class Validator{
  static String? name(String? value){
    if(value!.isEmpty){
      return "name can't be embty";
    }
    return null;
  }
  static String? phone(String? value){
    if(value!.isEmpty){
      return "phone number can't be embty";
    }
    return null;
  }
}