import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:improve_memory/models/database.dart';
import 'package:improve_memory/providers/app_data_provider.dart';

class AddPalaceScreen extends ConsumerStatefulWidget {
  const AddPalaceScreen({super.key});

  @override
  ConsumerState<AddPalaceScreen> createState() => _AddPalaceScreenState();
}

class _AddPalaceScreenState extends ConsumerState<AddPalaceScreen> {
  final _formKey = GlobalKey<FormState>();
  List<File> images = [];
  String title = '';
  String description = '';
  String filePath = '';
  void saveToDatabase() async {
    _formKey.currentState?.save();
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      final navigator = Navigator.of(context);
      SQLDatabase sqlDatabase = SQLDatabase();
      final response =
          await sqlDatabase.addPlace(title, filePath, description, images);
      if (response != 0) {
        navigator.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add a memory palace'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                onSaved: (val) {
                  title = val?.trim() ?? '';
                },
                decoration: InputDecoration(hintText: 'title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'you should type a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                onSaved: (val) {
                  description = val?.trim() ?? '';
                },
                decoration: InputDecoration(hintText: 'description'),
              ),
              TextFormField(
                onSaved: (val) {
                  filePath = val?.trim() ?? '';
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'you should type a file path';
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: 'file path'),
              ),
              SizedBox(
                height: 15,
              ),
              OutlinedButton.icon(
                onPressed: () async {
                  final filePicker =
                      await FilePicker.platform.pickFiles(allowMultiple: true);
                  if (filePicker != null) {
                    setState(() {
                      images = filePicker.xFiles
                          .map((val) => File(val.path))
                          .toList();
                    });
                  }
                },
                label: Text('upload images'),
                icon: Icon(Icons.image),
              ),
              Column(
                children: images.map((val) => Text(val.path)).toList(),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => saveToDatabase(),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.amber),
                      child: Text('add memory palace'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
