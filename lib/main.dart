import 'package:flutter/material.dart';
import 'package:productapp/store/store.dart';
import 'package:productapp/widgets/dashboard.widget.dart';
import 'package:signals/signals_flutter.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white
      ),
      home: ProductsPage(),
    );
  }
  
}


class ProductsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products",style: TextStyle(color: Theme.of(context).indicatorColor),
        ),
      backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          DashBoard(),
          Expanded(
            child: Watch(
                (context)=>ListView.builder(
                  itemCount: store.products.value.length,
                  itemBuilder: (context,index)=>ListTile(
                    onTap: (){
                      store.select(store.products.value[index]);
                    },
                    trailing: store.products.value[index].selected ?
                    Icon(Icons.check_circle):
                    Icon(Icons.check_box_outline_blank),
                    title: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${store.products.value[index].name}"),
                            Text("${store.products.value[index].price}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            
            ),
          )
        ],
      ),
     bottomNavigationBar: BottomNavigationBar(
       onTap: (value){
         if(value==1){
           store.addRandomProduct();
         }
       },
       items: [
         BottomNavigationBarItem(
           label: "Home",
             icon: Icon(Icons.home)
         ),
         BottomNavigationBarItem(
             label: "Store",
             icon: Icon(Icons.category)
         ),         BottomNavigationBarItem(
             label: "Settings",
             icon: Icon(Icons.settings)
         )
       ],
     ),
    );
  }
}
