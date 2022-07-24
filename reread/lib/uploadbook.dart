// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reread/homepage.dart';
import 'package:reread/requestbook.dart';

class UploadBook extends StatefulWidget {
  const UploadBook({Key? key}) : super(key: key);

  @override
  State<UploadBook> createState() => _UploadBookState();
}

List booktype = [];
List board = [];
List grade = [];
List subject = [];
String imagePath = '';

String imageurl = '';

class _UploadBookState extends State<UploadBook> {
  final _formKey = GlobalKey<FormState>();
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        imagePath = image.path;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    print(imagePath);
    print(image);
    // Reference ref = FirebaseStorage.instance
    //     .ref()
    //     .child('path')
    //     .child('to')
    //     .child('filename.txt');
    // await ref.putFile(image!);
  }

  final TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Upload record'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
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
                        filterChipWidget(
                          chipName: 'Textbook',
                          chipType: 'booktype',
                        ),
                        filterChipWidget(
                          chipName: 'Notebook',
                          chipType: 'booktype',
                        ),
                        filterChipWidget(
                          chipName: 'Storybook',
                          chipType: 'booktype',
                        ),
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
                        filterChipWidget(
                          chipName: 'NCERT',
                          chipType: 'board',
                        ),
                        filterChipWidget(
                          chipName: 'ICSE',
                          chipType: 'board',
                        ),
                        filterChipWidget(
                          chipName: 'STATE',
                          chipType: 'board',
                        ),
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
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 3,
                      children: const <Widget>[
                        filterChipWidget(
                          chipName: '1',
                          chipType: 'grades',
                        ),
                        filterChipWidget(
                          chipName: '2',
                          chipType: 'grades',
                        ),
                        filterChipWidget(
                          chipName: '3',
                          chipType: 'grades',
                        ),
                        filterChipWidget(
                          chipName: '4',
                          chipType: 'grades',
                        ),
                        filterChipWidget(
                          chipName: '5',
                          chipType: 'grades',
                        ),
                        filterChipWidget(
                          chipName: '6',
                          chipType: 'grades',
                        ),
                        filterChipWidget(
                          chipName: '7',
                          chipType: 'grades',
                        ),
                        filterChipWidget(
                          chipName: '8',
                          chipType: 'grades',
                        ),
                        filterChipWidget(
                          chipName: '9',
                          chipType: 'grades',
                        ),
                        filterChipWidget(
                          chipName: '10',
                          chipType: 'grades',
                        ),
                        filterChipWidget(
                          chipName: '11',
                          chipType: 'grades',
                        ),
                        filterChipWidget(
                          chipName: '12',
                          chipType: 'grades',
                        ),
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
                        filterChipWidget(
                          chipName: 'Physics',
                          chipType: 'subject',
                        ),
                        filterChipWidget(
                          chipName: 'Chemistry',
                          chipType: 'subject',
                        ),
                        filterChipWidget(
                          chipName: 'Biology',
                          chipType: 'subject',
                        ),
                        filterChipWidget(
                          chipName: 'Eco',
                          chipType: 'subject',
                        ),
                        filterChipWidget(
                          chipName: 'Math',
                          chipType: 'subject',
                        ),
                        filterChipWidget(
                          chipName: 'Applied math',
                          chipType: 'subject',
                        ),
                        filterChipWidget(
                          chipName: 'Commerce',
                          chipType: 'subject',
                        ),
                        filterChipWidget(
                          chipName: 'Computer Science',
                          chipType: 'subject',
                        ),
                        filterChipWidget(
                          chipName: 'English',
                          chipType: 'subject',
                        ),
                        filterChipWidget(
                          chipName: 'Physics Lab',
                          chipType: 'subject',
                        ),
                        filterChipWidget(
                          chipName: 'Chemistry Lab',
                          chipType: 'subject',
                        ),
                        filterChipWidget(
                          chipName: 'Biology Lab',
                          chipType: 'subject',
                        ),
                        filterChipWidget(
                          chipName: 'Math Lab',
                          chipType: 'subject',
                        ),
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Short description',
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
                      maxLength: 90,
                      decoration: InputDecoration(
                          hintText: 'Eg: Book name, Author',
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onChanged: (value) {
                        // do something
                      },
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Select Image',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                image != null
                    ? Image.file(
                        image!,
                        height: 150,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                            textColor: Color.fromARGB(255, 0, 13, 255),
                            onPressed: () {
                              pickImage(ImageSource.gallery);
                            },
                            color: Colors.blue[100],
                            child: Row(
                              children: const [
                                Text('Gallery   '),
                                Icon(Icons.photo),
                              ],
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                        ),
                        FlatButton(
                            textColor: Color.fromARGB(255, 0, 60, 255),
                            onPressed: () {
                              pickImage(ImageSource.camera);
                            },
                            color: Colors.blue[100],
                            child: Row(
                              children: const [
                                Text('Camera   '),
                                Icon(Icons.camera_alt),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: FlatButton(
                        textColor: Color.fromARGB(255, 0, 60, 255),
                        onPressed: () {
                          if (!(booktype.isEmpty ||
                              grade.isEmpty ||
                              board.isEmpty ||
                              subject.isEmpty ||
                              imagePath.isEmpty)) {
                            uploadBook();
                            storage.uploadFile(image!.path, imagePath);
                            setState(() {
                              booktype = [];
                              board = [];
                              grade = [];
                              subject = [];
                              imagePath = '';
                            });
                          }
                        },
                        color: Colors.blue[100],
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Submit   '),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future uploadBook() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    final docUser = FirebaseFirestore.instance
        .collection('uploadedBooks')
        .doc(DateTime.now().toString());
    final json = {
      'booktypes': booktype,
      'boards': board,
      'grades': grade,
      'subjects': subject,
      'description': descController.text,
      'imageurl': imageurl
    };
    await docUser.set(json).then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (context) => UploadCompletePage())));
  }
}

class UploadCompletePage extends StatelessWidget {
  const UploadCompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   height: 140,
              //   child: const Image(
              //       image: AssetImage('lib/assets/imagePath/logo.png')),
              // ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Upload Complete',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Waiting for a request...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.blueAccent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
  final String chipType;

  const filterChipWidget(
      {Key? key, required this.chipName, required this.chipType})
      : super(key: key);

  @override
  State<filterChipWidget> createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(
        color: _isSelected ? Colors.white : Color.fromARGB(255, 0, 60, 255),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      selected: _isSelected,
      backgroundColor: Colors.blue[100],
      selectedColor: Colors.black,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
          _isSelected == true
              ? {
                  if (widget.chipType == 'booktype')
                    {booktype.add(widget.chipName)},
                  if (widget.chipType == 'board') {board.add(widget.chipName)},
                  if (widget.chipType == 'subject')
                    {subject.add(widget.chipName)},
                  if (widget.chipType == 'grades') {grade.add(widget.chipName)},
                }
              : {
                  if (widget.chipType == 'booktype')
                    {booktype.remove(widget.chipName)},
                  if (widget.chipType == 'board')
                    {board.remove(widget.chipName)},
                  if (widget.chipType == 'subject')
                    {subject.remove(widget.chipName)},
                  if (widget.chipType == 'grades')
                    {grade.remove(widget.chipName)}
                };

          print('booktypes:$booktype');
          print('boards:$board');
          print('grades:$grade');
          print('subjects:$subject');
        });
      },
    );
  }
}

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;
  Future<void> uploadFile(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);
    try {
      Reference ref = storage.ref().child(DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(file);
      var dowurl = await (await uploadTask).ref.getDownloadURL();
      imageurl = dowurl.toString();
      print('ImageURL$imageurl');
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
