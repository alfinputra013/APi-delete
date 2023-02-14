import 'package:crud_api/models/buku_model.dart';
import 'package:crud_api/pages/books/details_book.dart';
import 'package:crud_api/pages/books/form_add.dart';
import 'package:crud_api/services/books_service.dart';
import 'package:flutter/material.dart';

class EditBook extends StatefulWidget {
  @override
  _editDataBook createState() => _editDataBook();
}

class _editDataBook extends State<EditBook> {
  final _addformKey = GlobalKey<FormState>();
  final BookService api = BookService();
  final _TitleController = TextEditingController();
  final _DescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data Books"),
        centerTitle: true,
      ),
      body: Form(
        key: _addformKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _TitleController,
                    decoration: new InputDecoration(
                      hintText: "Edit Title Here",
                      labelText: "Title",
                      icon: Icon(Icons.text_fields_sharp),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(8.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Title Is Required';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _DescriptionController,
                    decoration: new InputDecoration(
                      labelText: "Description",
                      hintText: "New Description Book",
                      icon: Icon(Icons.menu_book_outlined),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(8.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Descriptions Is Required';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  // color: Colors.blue,
                  onPressed: () {
                    print("submit ");
                    if (_addformKey.currentState!.validate()) {
                      _addformKey.currentState!.save();
                      api.editBook(Data(
                          title: _TitleController.text,
                          description: _DescriptionController.text));
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
