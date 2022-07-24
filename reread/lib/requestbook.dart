// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reread/homepage.dart';
import 'package:reread/uploadbook.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class RequestBookPage extends StatefulWidget {
  const RequestBookPage({Key? key}) : super(key: key);

  @override
  State<RequestBookPage> createState() => _RequestBookPageState();
}

List booktype = [];
List board = [];
List grade = [];
List subject = [];
bool isPageChanged = false;
String errorMsg = '';
List filterOptions = [];
List dataBaseDocOptions = [];

class _RequestBookPageState extends State<RequestBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false,
          );
        }),
        foregroundColor: Colors.white,
        title: const Text('Filter search'),
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
                        print(board);
                        if (board.isEmpty ||
                            grade.isEmpty ||
                            booktype.isEmpty ||
                            subject.isEmpty) {
                          setState(() {
                            errorMsg = '''*Atleast one option must be
    chosen from each field''';
                          });
                        } else {
                          filterOptions.addAll(board);
                          filterOptions.addAll(grade);
                          filterOptions.addAll(booktype);
                          filterOptions.addAll(subject);
                          print(filterOptions);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FilteredResultsPage(),
                            ),
                          );
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  errorMsg,
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
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
          if (isPageChanged == true) {
            setState(() {
              isSelected = false;
            });
          }
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

class FilteredResultsPage extends StatefulWidget {
  const FilteredResultsPage({Key? key}) : super(key: key);
  @override
  State<FilteredResultsPage> createState() => _FilteredResultsPageState();
}

var firebaseUser = FirebaseAuth.instance.currentUser;
bool isContainerVisible = true;

class _FilteredResultsPageState extends State<FilteredResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          setState(() {
            booktype = [];
            board = [];
            grade = [];
            subject = [];
            filterOptions = [];
            dataBaseDocOptions = [];
            isPageChanged = false;
          });
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => RequestBookPage()),
            (Route<dynamic> route) => false,
          );
        }),
        foregroundColor: Colors.white,
        title: Text('Results'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('uploadedBooks')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return snapshot.data!.docs.isNotEmpty
                ? ListView(
                    children: snapshot.data!.docs.map(
                      (document) {
                        dataBaseDocOptions = [];
                        dataBaseDocOptions.addAll(document['boards']);
                        dataBaseDocOptions.addAll(document['booktypes']);
                        dataBaseDocOptions.addAll(document['grades']);
                        dataBaseDocOptions.addAll(document['subjects']);
                        print(dataBaseDocOptions);
                        print(filterOptions);
                        dataBaseDocOptions.every(
                                (element) => filterOptions.contains(element))
                            ? isContainerVisible = true
                            : isContainerVisible = false;

                        print(board);
                        print(grade);
                        print(subject);
                        print(isContainerVisible);
                        return isContainerVisible
                            ? Card(
                                elevation: 10,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              minHeight: 103),
                                          child: ExpansionTile(
                                            collapsedIconColor: Colors.purple,
                                            key: GlobalKey(),
                                            tilePadding: EdgeInsets.all(10),
                                            backgroundColor: Colors.white,
                                            collapsedBackgroundColor:
                                                Colors.white,
                                            textColor: Colors.black,
                                            collapsedTextColor: Colors.black,
                                            title: Column(
                                              children: [
                                                Text(
                                                  document['subjects']
                                                      .toString()
                                                      .splitMapJoin(',')
                                                      .replaceAll('[', '')
                                                      .replaceAll(']', ''),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Board : ${document['boards'].toString().splitMapJoin(',').replaceAll('[', '').replaceAll(']', '')}",
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Book Type : ${document['booktypes'].toString().splitMapJoin(',').replaceAll('[', '').replaceAll(']', '')}",
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Grades : ${document['grades'].toString().splitMapJoin(',').replaceAll('[', '').replaceAll(']', '')}",
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Description : ${document['description'].toString().splitMapJoin(',').replaceAll('[', '').replaceAll(']', '')}",
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            children: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 8),
                                                    child: Container(
                                                      height: 180,
                                                      color: Colors.white,
                                                      child: Image(
                                                          image: NetworkImage(
                                                              imageurl)),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10,
                                                                right: 10,
                                                                bottom: 5),
                                                        child: FlatButton(
                                                          color: Colors.green,
                                                          minWidth: 0,
                                                          onPressed: () {
                                                            showDialog(
                                                              context: context,
                                                              builder: (_) =>
                                                                  AlertDialog(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                title: const Text(
                                                                    'Confirm Order'),
                                                                content:
                                                                    Container(
                                                                  child: const Text(
                                                                      'This action cannot be undone.'),
                                                                ),
                                                                actions: [
                                                                  FlatButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(
                                                                              true);
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'Cancel',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blue,
                                                                          fontSize:
                                                                              15),
                                                                    ),
                                                                  ),
                                                                  FlatButton(
                                                                    color: Colors
                                                                        .green,
                                                                    onPressed:
                                                                        () {
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              "uploadedBooks")
                                                                          .doc(document
                                                                              .id)
                                                                          .delete();

                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              FinalPageReceiver(),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'Confirm',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              15),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                ],
                                                                elevation: 24,
                                                              ),
                                                            );
                                                          },
                                                          child: const Icon(
                                                            Icons
                                                                .check_box_rounded,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container();
                      },
                    ).toList(),
                  )
                : Scaffold();
          }),
    );
  }
}

class FinalPageReceiver extends StatefulWidget {
  const FinalPageReceiver({Key? key}) : super(key: key);

  @override
  State<FinalPageReceiver> createState() => _FinalPageReceiverState();
}

class _FinalPageReceiverState extends State<FinalPageReceiver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            icon: Icon(Icons.home)),
        foregroundColor: Colors.white,
        title: const Text('Request Submitted'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Image(image: AssetImage('lib/assets/images/thankyou.jpg')),
              const SizedBox(height: 60),
              Row(
                children: const [
                  Text('Sender Name : '),
                  Text(
                    'Pranav Mahajan',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Text('Email id : '),
                  Text(
                    'pranav.mahajan@gmail.com',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('Contact (tap to redirect) : '),
                  GestureDetector(
                    child: const Text(
                      '9972644523',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      UrlLauncher.launch("tel:9927644523");
                    },
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
