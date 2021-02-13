import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_test/my_widget.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    
    //WidgetTester 가제 공하는 pumpWidget함수로 위젯을 빌드하고 랜더링 합니다.
    await tester.pumpWidget(MyWidget(title: 'T', message: 'M'));

    //find.bykey(..) 특정 Key 가있는 위젯을 검색하여 위젯을 찾습니다
    //find.byType(..) 특정 유형의 위젯을 검색하여 위젯을 찾습니다
    //find.text(..) 인수와 동일한 문자열을 포함하는 Text 및 EditableText 위젯을 찾습니다
    //find.byWidget(..) 특정 자식 위젯이 존재하는지 찾습니다
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    //expect(actual,matcher) : actual과 matcher가 일치하는지 비교
    //findsNothing  : 위젯 트리에 일치하는 위젯이 없음
    //findsWidgets :  위젯 트리에 일치하는 위젯 있음(하나 이상의 위젯을 찾을 때)
    //findsOneWidget  :  위젯 트리에 일치하는 하나의 위젯을 찾음
    //findsNWidgets(int n) : 위젯트리에 특정 수의 위젯을 찾음
    
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);

  });
}
