import 'package:test/test.dart';
import '../W3/CHALLEGNE1.dart';

main() {
  test('quiz test case all answer right -', () {
    List<Question> questions = [Question(title: 'what is 2+2', chioces: ['1','2','3','4'], goodChoice: '4'),
                                Question(title: 'where is the Angkortemple', chioces: ['Kampot','phompenh','Siemreap','kompongtom'], goodChoice: 'Siemreap'),
                                Question(title: 'How many nose does pig have?', chioces: ['1','2','3','4'], goodChoice: '1'),
                                Question(title: 'why are you lazy?', chioces: ['too much work','IDK','ADHD','cuz I am lazy!'], goodChoice: 'IDK')
    ];
    Quiz myq = Quiz(questions);
    myq.addAnswer(questions[0], '4');
    myq.addAnswer(questions[1], 'Siemreap');
    myq.addAnswer(questions[2], '1');
    myq.addAnswer(questions[3], 'IDK');
    print(myq.getTotalScore());

    expect(myq.getTotalScore(), 4);
    
  });
}