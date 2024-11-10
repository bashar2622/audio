import 'package:flutter/material.dart';



Widget AppBarPart(BuildContext context,GlobalKey<ScaffoldState>key,Widget widget){
return  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Row(children: [
   widget,
    IconButton(icon: Icon(Icons.menu),onPressed: (){
      key.currentState!.openEndDrawer();
    },),
    
    ]
    ,mainAxisAlignment: MainAxisAlignment.spaceBetween,)
    ]
    
    );
}