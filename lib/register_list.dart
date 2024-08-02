import 'package:flutter/material.dart';

import '../ model/register_model.dart';
import '../local_db.dart';

class RegisterList extends StatefulWidget {
  const RegisterList({super.key});

  @override
  State<RegisterList> createState() => _RegisterListState();
}

class _RegisterListState extends State<RegisterList> {
  final LocalDb _localDb =  LocalDb.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _userList(),
    );
  }
  Widget _userList(){
    return FutureBuilder(
      future: _localDb.getRegister(),
      builder: (context, snapshot){
        return ListView.builder(
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index){
            Register register=snapshot.data![index];
            return ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        // register.
                        register.name,
                        //semanticsLabel: register.bdate,
                        // /register.email
                      ),
                    ],
                  ),
                ],
              ),);
          },


        );
      },
    );
  }
}

