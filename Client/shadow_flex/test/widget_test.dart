// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:shadow_flex/models/hero.dart';

void main() {
  test("HeroData indexParse unit test", () {
    HeroData data = HeroData();
    expect(data.indexParse(0), [0, 0, 0]);

    expect(data.indexParse(100), [1, 0, 0]);
    expect(data.indexParse(110), [1, 1, 0]);
    expect(data.indexParse(150), [1, 5, 0]);
    expect(data.indexParse(116), [1, 1, 6]);
    expect(data.indexParse(120), [1, 2, 0]);
    expect(data.indexParse(123), [1, 2, 3]);
    expect(data.indexParse(130), [1, 3, 0]);
    expect(data.indexParse(140), [1, 4, 0]);
    expect(data.indexParse(145), [1, 4, 5]);
    expect(data.indexParse(153), [1, 5, 3]);

    expect(data.indexParse(200), [2, 0, 0]);
    expect(data.indexParse(210), [2, 1, 0]);
    expect(data.indexParse(213), [2, 1, 3]);

    expect(data.indexParse(300), [3, 0, 0]);

    expect(data.indexParse(400), [4, 0, 0]);

    expect(data.indexParse(500), [5, 0, 0]);
    expect(data.indexParse(540), [5, 4, 0]);
    expect(data.indexParse(510), [5, 1, 0]);
    expect(data.indexParse(514), [5, 1, 4]);
    expect(data.indexParse(520), [5, 2, 0]);
    expect(data.indexParse(523), [5, 2, 3]);
    expect(data.indexParse(530), [5, 3, 0]);
    expect(data.indexParse(532), [5, 3, 2]);
    expect(data.indexParse(547), [5, 4, 7]);

    expect(data.indexParse(600), [6, 0, 0]);
    expect(data.indexParse(620), [6, 2, 0]);
    expect(data.indexParse(610), [6, 1, 0]);
    expect(data.indexParse(614), [6, 1, 4]);
    expect(data.indexParse(624), [6, 2, 4]);

    expect(data.indexParse(700), [7, 0, 0]);
    expect(data.indexParse(720), [7, 2, 0]);
    expect(data.indexParse(710), [7, 1, 0]);
    expect(data.indexParse(714), [7, 1, 4]);
    expect(data.indexParse(725), [7, 2, 5]);

    expect(data.indexParse(800), [8, 0, 0]);
    expect(data.indexParse(840), [8, 4, 0]);
    expect(data.indexParse(810), [8, 1, 0]);
    expect(data.indexParse(814), [8, 1, 4]);
    expect(data.indexParse(820), [8, 2, 0]);
    expect(data.indexParse(823), [8, 2, 3]);
    expect(data.indexParse(830), [8, 3, 0]);
    expect(data.indexParse(833), [8, 3, 3]);
    expect(data.indexParse(843), [8, 4, 3]);

    expect(data.indexParse(900), [9, 0, 0]);
    expect(data.indexParse(910), [9, 1, 0]);
    expect(data.indexParse(913), [9, 1, 3]);

    expect(data.indexParse(1000), [10, 0, 0]);
  });

  group('HeroData CheckBounce unit test', () {
    test('Positive', () {
      HeroData data = HeroData();
      try {
        data.CheckBounce([0, 0, 0]);

        data.CheckBounce([1, 0, 0]);
        data.CheckBounce([1, 1, 0]);
        data.CheckBounce([1, 5, 0]);
        data.CheckBounce([1, 1, 6]);
        data.CheckBounce([1, 2, 0]);
        data.CheckBounce([1, 2, 3]);
        data.CheckBounce([1, 3, 0]);
        data.CheckBounce([1, 4, 0]);
        data.CheckBounce([1, 4, 5]);
        data.CheckBounce([1, 5, 3]);

        data.CheckBounce([2, 0, 0]);
        data.CheckBounce([2, 1, 0]);
        data.CheckBounce([2, 1, 3]);

        data.CheckBounce([3, 0, 0]);

        data.CheckBounce([4, 0, 0]);

        data.CheckBounce([5, 0, 0]);
        data.CheckBounce([5, 4, 0]);
        data.CheckBounce([5, 1, 0]);
        data.CheckBounce([5, 1, 4]);
        data.CheckBounce([5, 2, 0]);
        data.CheckBounce([5, 2, 3]);
        data.CheckBounce([5, 3, 0]);
        data.CheckBounce([5, 3, 2]);
        data.CheckBounce([5, 4, 7]);

        data.CheckBounce([6, 0, 0]);
        data.CheckBounce([6, 2, 0]);
        data.CheckBounce([6, 1, 0]);
        data.CheckBounce([6, 1, 4]);
        data.CheckBounce([6, 2, 4]);

        data.CheckBounce([7, 0, 0]);
        data.CheckBounce([7, 2, 0]);
        data.CheckBounce([7, 1, 0]);
        data.CheckBounce([7, 1, 4]);
        data.CheckBounce([7, 2, 5]);

        data.CheckBounce([8, 0, 0]);
        data.CheckBounce([8, 4, 0]);
        data.CheckBounce([8, 1, 0]);
        data.CheckBounce([8, 1, 4]);
        data.CheckBounce([8, 2, 0]);
        data.CheckBounce([8, 2, 3]);
        data.CheckBounce([8, 3, 0]);
        data.CheckBounce([8, 3, 3]);
        data.CheckBounce([8, 4, 3]);

        data.CheckBounce([9, 0, 0]);
        data.CheckBounce([9, 1, 0]);
        data.CheckBounce([9, 1, 3]);

        data.CheckBounce([10, 0, 0]);
        expect(true, true);
      } catch (exeption) {
        expect(false, true);
      }
    });

    test('Negative', () {
      HeroData data = HeroData();
      try {
        data.CheckBounce([-1, 0, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }

      try {
        data.CheckBounce([11, 0, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }

      try {
        data.CheckBounce([0, 1, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([0, 1, 1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([0, 0, 1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }

      try {
        data.CheckBounce([1, 6, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([1, 1, 7]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([1, 2, 4]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([1, 3, 1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([1, 4, 6]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([1, 5, 4]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([1, -1, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([1, 1, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([1, 2, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([1, 3, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([1, 4, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([1, 5, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }

      try {
        data.CheckBounce([2, -1, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([2, 0, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([2, -1, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([2, 2, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([2, 1, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([2, 1, 4]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }

      try {
        data.CheckBounce([3, 1, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([3, 0, 1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([3, 1, 1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([3, -1, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([3, 0, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([3, -1, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }

      try {
        data.CheckBounce([4, 1, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([4, 0, 1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([4, 1, 1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([4, -1, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([4, 0, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([4, -1, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }

      try {
        data.CheckBounce([5, -1, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([5, 0, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([5, -1, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([5, 5, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([5, 1, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([5, 1, 5]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([5, 2, 4]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([5, 2, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([5, 3, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([5, 3, 3]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([5, 4, 8]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([5, 4, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }

      try {
        data.CheckBounce([6, -1, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([6, 0, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([6, -1, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([6, 3, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([6, 1, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([6, 1, 5]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([6, 2, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([6, 2, 5]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }

      try {
        data.CheckBounce([7, -1, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([7, -1, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([7, 0, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([7, 3, 0]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([7, 1, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([7, 1, 5]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([7, 2, -1]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
      try {
        data.CheckBounce([7, 2, 6]);
        expect(false, true);
      } catch (exeption) {
        expect(exeption, isException);
      }
    });
  });

  /* testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  }); */
}
