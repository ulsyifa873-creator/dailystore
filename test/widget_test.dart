
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Aplikasi DailyStore berhasil dibuka',
      (WidgetTester tester) async {
    await tester.pumpWidget(const KatalogApp());

    expect(find.text('DailyStore'), findsOneWidget);
    expect(find.text('Lihat Katalog'), findsOneWidget);
  });
}
