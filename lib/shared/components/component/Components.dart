
import 'package:flutter/material.dart';





Widget background_img({required String img}){
  return Center(child:  Image.asset(img,color: Colors.blue,));
}
//Defult TextFormField

Widget defultTextField({required TextEditingController  controller,
  required TextInputType type,
  Function? onChange,
  Function? onSubmit,
  Function ?onTap,
  bool isPassword=false,
  required Function validation,
   required  String  title,
  required IconData prefix,
  IconData ?suffix,
  Function? suffixPress,
  required  bool isClicked,
})=>TextFormField(
controller: controller,
keyboardType: type,
 onChanged: (s){onChange!(s);},
  onFieldSubmitted: (s){onSubmit!(s);},
  obscureText: isPassword,
  enabled: isClicked,
  onTap: (){
  onTap!();
  },
validator: (s){
  validation(s);
},

  decoration: InputDecoration(
    labelText: title,
    prefixIcon: Icon(prefix),
    suffix: suffix!=null?IconButton(onPressed: (){suffixPress!();}, icon: Icon(suffix)):null,
    border: OutlineInputBorder()

  ),


);


//





Widget CirclerProgressloadinh(){
  return Center(child: CircularProgressIndicator(
     strokeWidth: 5.0,color: Colors.blue,
  ));
}


void navigateTo(context,widget){
   Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}
void navigationAndFinish(context,widget){

  Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context)=>widget));
}

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget articleBuilder(list, context) {

  if (list.length > 0)
  return ListView.separated(
  physics: BouncingScrollPhysics(),
  itemBuilder: (context, index) => Container(),
  separatorBuilder: (context, index) => myDivider(),
  itemCount: 10,);
  else
   return Center(child: CircularProgressIndicator());

}