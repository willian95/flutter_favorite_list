import 'package:favoritelist/provider/favoriteListProvider.dart';
import 'package:favoritelist/widgets/itemListClientWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static String id = 'login';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    
    List clientList = [
      {
        "id": 1,
        "name": "Aaron Richards",
        "image": "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
      },
      {
        "id": 2,
        "name": "Albert Alexander",
        "image": "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
      },
      {
        "id": 3,
        "name": "Bessie Russell",
        "image":"https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80"
      },
      {
        "id": 4,
        "name": "Bernard Fisher",
        "image": "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
      },
      {
        "id": 5,
        "name": "Bernard Williamson",
        "image": "https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=399&q=80"
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite List"),
      ),
      body: Center(
        child: Column(
          children: [
            
            if(context.watch<FavoriteListProvider>().favorites.length > 0)
              Text("Favorites", style: TextStyle(fontSize: 30)),

            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: context.watch<FavoriteListProvider>().favorites.length,
              itemBuilder: (BuildContext context, int index) {
                return itemListClientWidget(client: context.watch<FavoriteListProvider>().favorites[index], provider: context.read<FavoriteListProvider>());
              }
            ),

            if(context.watch<FavoriteListProvider>().favorites.length > 0)
              Divider(),
            
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: clientList.length,
              itemBuilder: (BuildContext context, int index) {
                
                return 
                  !context.read<FavoriteListProvider>().searchClient(clientList[index]["id"]) ?
                    itemListClientWidget(client: clientList[index], provider: context.read<FavoriteListProvider>())
                  : SizedBox();
              }
            ),
          ],
        )
      ),
    );
  }
}
