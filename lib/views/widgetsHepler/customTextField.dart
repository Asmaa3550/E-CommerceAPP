import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TextInputField extends StatefulWidget {
  final IconData prefixIcon;
  final String hintText;
  bool password = false;
  @required
  final Function onChange;
  final Function validator;
  @required
  final TextEditingController controller;

  TextInputField(
      {this.prefixIcon,
        this.hintText,
        this.password,
        this.onChange,
        this.controller ,
        this.validator});
  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  FocusNode myFocusNode;
  bool hidePassword= false ;
  @override
  void initState() {
    myFocusNode = new FocusNode();
    myFocusNode.addListener(() => setFocus());
    super.initState();
  }
  void setFocus() {
    print(myFocusNode.hasFocus);
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller : widget.controller,
        obscureText: !hidePassword? widget.password : false,
        focusNode: myFocusNode,
        decoration: InputDecoration(
            suffixIcon: widget.password ? IconButton(
              onPressed: (){
                setState(() {
                  hidePassword = !hidePassword ;
                });
              },
              icon:hidePassword?Icon(Icons.remove_red_eye_outlined , color: Theme.of(context).primaryColor) :  Icon(Icons.remove_red_eye , color: Theme.of(context).primaryColor),
            ): null,
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: myFocusNode.hasFocus
                    ? Theme.of(context).secondaryHeaderColor
                    : Colors.grey,
                fontFamily: EasyLocalization.of(context).currentLocale ==
                    Locale('en', 'US')
                    ? 'Poppins_Regular'
                    : 'Tajawal-Regular',
                fontSize: 16),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(widget.prefixIcon,
                  size: 30,
                  color: myFocusNode.hasFocus
                      ? Theme.of(context).secondaryHeaderColor
                      : Colors.grey),
            ),
            focusedBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide:
                BorderSide(color: Theme.of(context).secondaryHeaderColor)),
            border: new OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey)) ,
          errorBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.red))
        ),
        onChanged: widget.onChange,
        validator: widget.validator,

      ),
    );
  }
}
