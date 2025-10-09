void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
 var passed = scores.where((score) => score >= 50);
 print(passed.toList());
 var passedStudent = passed.toList().length;
  //print out the past student.
 print('$passedStudent students passed.');
}