// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class UploadBook extends StatefulWidget {
  const UploadBook({Key? key}) : super(key: key);

  @override
  State<UploadBook> createState() => _UploadBookState();
}

class _UploadBookState extends State<UploadBook> {
  List<String> bookTypes = ['Textbook', 'Storybook', 'Notebook'];
  String? selectedBookType = 'Textbook';
  final TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Upload a book record'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Choose book type',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 3,
                    children: const <Widget>[
                      filterChipWidget(chipName: 'Textbook'),
                      filterChipWidget(chipName: 'Notebook'),
                      filterChipWidget(chipName: 'Storybook'),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Syllabus',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 3,
                    children: const <Widget>[
                      filterChipWidget(chipName: 'NCERT'),
                      filterChipWidget(chipName: 'ICSE'),
                      filterChipWidget(chipName: 'STATE'),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Grade',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 3,
                    children: const <Widget>[
                      filterChipWidget(chipName: '1'),
                      filterChipWidget(chipName: '2'),
                      filterChipWidget(chipName: '3'),
                      filterChipWidget(chipName: '4'),
                      filterChipWidget(chipName: '5'),
                      filterChipWidget(chipName: '6'),
                      filterChipWidget(chipName: '7'),
                      filterChipWidget(chipName: '8'),
                      filterChipWidget(chipName: '9'),
                      filterChipWidget(chipName: '10'),
                      filterChipWidget(chipName: '11'),
                      filterChipWidget(chipName: '12'),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Subject',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 3,
                    children: const <Widget>[
                      filterChipWidget(chipName: 'Physics'),
                      filterChipWidget(chipName: 'Chemistry'),
                      filterChipWidget(chipName: 'Biology'),
                      filterChipWidget(chipName: 'Eco'),
                      filterChipWidget(chipName: 'Math'),
                      filterChipWidget(chipName: 'Applied math'),
                      filterChipWidget(chipName: 'Commerce'),
                      filterChipWidget(chipName: 'Computer Science'),
                      filterChipWidget(chipName: 'English'),
                      filterChipWidget(chipName: 'Physics Lab'),
                      filterChipWidget(chipName: 'Chemistry Lab'),
                      filterChipWidget(chipName: 'Biology Lab'),
                      filterChipWidget(chipName: 'Math Lab'),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Short description (eg: Book name, Author, etc)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    controller: descController,
                    minLines: 1,
                    maxLines: 5,
                    maxLength: 60,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class filterChipWidget extends StatefulWidget {
  final String chipName;

  const filterChipWidget({Key? key, required this.chipName}) : super(key: key);

  @override
  State<filterChipWidget> createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.chipName),
      labelStyle: const TextStyle(
        color: Color.fromARGB(255, 255, 140, 0),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      selected: _isSelected,
      backgroundColor: Colors.orange[100],
      selectedColor: Colors.black,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
    );
  }
}
