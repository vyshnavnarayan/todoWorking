import 'package:flutter/material.dart';
import 'package:very_good_app/homescreen/repository/manage_task_repo.dart';

Container taskModal({required bool isUpdate, String? name, String? description, String? task_id}) {
  TextEditingController titleController = TextEditingController(text: name);
  TextEditingController descriptionController = TextEditingController(text: description);
  final _formKey = GlobalKey<FormState>();
  return Container(
    padding: EdgeInsets.all(20),
    height: 300,
    child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(isUpdate ? 'Update Task' : 'Add a task',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextFormField(
            controller: titleController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter task";
              }
            },
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Enter your task'),
          ),
          TextFormField(
            controller: descriptionController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter description";
              }
            },
            maxLines: 4,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Enter task description'),
          ),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (!isUpdate) {
                      ManageTaskRepo().createTask(
                          titleController.text, descriptionController.text);
                      titleController.clear();
                      descriptionController.clear();
                    }else{
                     ManageTaskRepo().updateTask(task_id!, titleController.text, descriptionController.text);
                    }
                  }
                },
                child: Text(
                  isUpdate? 'Update':
                  'Submit')),
          )
        ],
      ),
    ),
  );
}
