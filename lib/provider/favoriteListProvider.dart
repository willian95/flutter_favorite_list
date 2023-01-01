import 'package:flutter/cupertino.dart';

class FavoriteListProvider extends ChangeNotifier{

  List _favorites = [];

  List get favorites => _favorites;

  addClient(client){
    if(searchClient(client["id"])==false){
      _favorites.add(client);
    }else{
      deleteClient(client);
    }
    notifyListeners();
  }
  
  deleteClient(client){
    _favorites.removeWhere((item){
      return item["id"] == client["id"];
    });
  }

  searchClient(id){
    var result = _favorites.where((element) => element["id"] == id);
    return !result.isEmpty;
  }

}