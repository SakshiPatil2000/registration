import 'package:flutter/material.dart';
import 'package:registration/register_list.dart';


import 'local_db.dart';
class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final LocalDb _localDb =  LocalDb.instance;
  String? _name=null;
  String? _bdate=null;
  String? _email=null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 71, right: 21, left: 21),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60,),
            const Text(
              'Welcome User',
              style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 8,),
            const Text(
              'Please enter your details',
              style: TextStyle(fontSize: 21,color: Colors.grey),
            ),
            const SizedBox(height: 60,),
            const Text('Name',style: TextStyle(
              fontSize:26,
              color: Colors.black,

            ),
            ),
            TextField(
              onChanged: (value){
                setState(() {
                  _name= value;
                });
              },
              //controller: nameController,
              decoration:const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )
                ),
                hintText: 'Enter your name',
                hintStyle: TextStyle(color: Colors.grey),


              ),
            ),
            const SizedBox(height: 20,),
            const Text('Birth Date',style: TextStyle(
              fontSize:26,
              color: Colors.black,

            ),
            ),
            TextField(
              onChanged: (value){
                setState(() {
                  _bdate= value;
                });
              },

              decoration:const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )
                ),
                hintText: ' DD - MM - YYYY ',
                hintStyle: TextStyle(color: Colors.grey),

              ),
            ),
            const SizedBox(height: 20,),
            const Text('Email Id',style: TextStyle(
              fontSize:26,
              color: Colors.black,

            ),
            ),
            TextField(
              onChanged: (value){
                setState(() {
                  _email= value;
                });
              },
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )
                ),
                hintText: 'Enter your email id',
                hintStyle: TextStyle(color: Colors.grey),


              ),
            ),

            const SizedBox(height: 45,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: (){
                 // if(_name == null && _bdate== null && _email ==null) return;
                  _localDb.addTask(_name!, _bdate!, _email!);
                  setState(() {
                    _name= null;
                    _bdate=null;
                    _email=null;
                  });
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const RegisterList(),)
                  );
                },

                child:const Text(
                  'SUBMIT',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )


          ],


        ),

      ),



    );
  }
}
