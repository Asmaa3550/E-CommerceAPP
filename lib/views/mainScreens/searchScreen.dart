import 'package:conditional/conditional.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/cubit.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/states.dart';
import 'package:shoppingapp/views/widgetsHepler/favoriteCard.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.chevron_left
          ),
        ),
        body: BlocConsumer<ShoppingCubit , ShoppingStates>(
          listener: (context , state){
            if (state is SearchProductSuccState){
              print('the search is finished');
            }
          } ,
          builder: (context , state){
            var searchCubit = ShoppingCubit.get(context);
            return  SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 5 , horizontal: 20.0),
                                hintText: 'Search for product ',
                                hintStyle: TextStyle(
                                    color: Theme.of(context).secondaryHeaderColor,
                                    fontFamily: 'Poppins_Regular',
                                    fontSize: 16),
                                focusedBorder: new OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).secondaryHeaderColor)),
                                border: new OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).secondaryHeaderColor)),
                                enabledBorder: new OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                    borderSide: BorderSide(
                                        color:
                                        Theme.of(context).secondaryHeaderColor))
                            ),
                            onChanged: (value){
                              setState(() {
                                searchText = value ;
                              });
                            },
                          ),
                        ),
                      ),
                      TextButton(
                           child: Text('Search' , style: TextStyle(
                             color : Theme.of(context).primaryColor,
                             fontSize: 20.0 ,
                           ),) ,
                           onPressed: () async {
                            if (searchText != null){
                             await searchCubit.searchProduct('en', searchText);
                            }
                           },),

                    ],
                  ),
                  if (state is SearchProductLoadingState)
                    Column(
                      children: [
                        SizedBox(height: 20.0),
                        LinearProgressIndicator(color: Theme.of(context).primaryColor,backgroundColor: Colors.white,)
                      ],
                    ),
                  if (state is SearchProductSuccState)
                      Container(
                        width :double.infinity,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: searchCubit.searchModel.data.data.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(left: 20.0 ,top :20 ,  right: 20.0 , bottom: 60.0),
                            itemBuilder: (context , index){
                              return favoriteCard( searchCubit.searchModel.data.data[index], context , false );
                            }),
                      ),
                ],
              ),
            ) ;
          },
        ),
      ),
    );
  }
}
