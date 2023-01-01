import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class itemListClientWidget extends StatelessWidget{

  final provider;
  final client;

  itemListClientWidget({
    Key? key,
    required this.client,
    required this.provider,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return  Container(
      color: Colors.white,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            client["image"],
            height: 36.0,
            width: 36.0,
              fit: BoxFit.cover
          ),
        ),
        title: Text(client["name"], style: TextStyle(
            color: Colors.black
        ),),
        trailing: InkWell(
          onTap: (){
            provider.addClient(client);
          },
          child: Icon(Icons.star,
              color: provider.searchClient(client["id"]) == true ? Color(0xff99E86C) : Color(0xffACAEBE)),
        ),
      ),

    );
  }

}