import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;
final questionsPaperRF = firestore.collection('questionPapers');
DocumentReference questionRF({
  required String paperId, 
  required String questionId }) => questionsPaperRF.doc(paperId).collection('questions').doc(questionId);