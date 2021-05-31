import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';

import 'customTextField.dart';

Widget profileItem (
    context ,
    String title ,
    @required Function okPressed ,
    @required Function onChange ,
    @required Function validator ,
    @required TextEditingController controller,
    @required String hintText ,
    @required IconData titleIcon,

    ){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal:15.0),
    child: Container(
      // height: 100,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: Icon(titleIcon ,),
              title: Text( title ,
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 18.0  ,
                  color: Color(0xFF445A65),
                ),),
            ),
          ),
          IconButton(
              onPressed: (){
                alert(context,
                  title: Container(
                      height: 30,
                      color: Theme.of(context).primaryColor
                  ) ,
                  textOK: Row(
                      children:[
                        FlatButton(
                          color : Theme.of(context).primaryColor,
                          child: Text('Update' ,
                            style : TextStyle(
                                color : Colors.white
                            ),
                          ),
                          onPressed: okPressed,),
                        SizedBox(width: 20),
                        FlatButton(
                            color: Colors.grey[400],
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text('Cancel' , style : TextStyle(
                                color : Colors.white
                            ))),
                      ]
                  ),
                  content:  TextInputField(
                      controller : controller,
                      prefixIcon: titleIcon,
                      hintText: hintText,
                      password: false,
                      onChange: onChange ,
                      validator : validator
                  ),
                );
              }, icon:Icon(
              Icons.edit
          ))
        ],
      ),
    ),
  );
}
