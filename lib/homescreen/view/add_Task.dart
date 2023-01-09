 import 'package:flutter/material.dart';

Container taskModal() {
  final  _formKey = GlobalKey<FormState>();
    return Container(
      padding: EdgeInsets.all(20),
        height: 300,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Add a task',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please enter task";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter your task'
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Enter description";
                    }
                  },
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter task description'
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {
                    if(_formKey.currentState!.validate()){}
                    
                  }, child: Text('Submit')),
                )
              ],
            ),
          ),
        ),
      );
  }