import 'package:dusty_dust/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TestScreen',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ValueListenableBuilder<Box>(
            valueListenable: Hive.box(testBox).listenable(),
            builder: (context, box, widget) {
              return Column(
                children: box.values
                    .map(
                      (e) => Text(e.toString()),
                    )
                    .toList(),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(testBox);
              print('keys:${box.keys.toList()}');
              print('values:${box.values.toList()}');
            },
            child: Text('박스 프린트하기!'),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(testBox);

              /// 데이터를 생성하거나
              /// 업데이트할때

              box.add('세로운 데이터!');
            },
            child: Text(
              '데이터 넣기!',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(testBox);

              print(box.getAt(1));
            },
            child: Text(
              '특정 값 가져오기',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(testBox);

              box.clear();
            },
            child: Text(
              '삭제하기!',
            ),
          ),
        ],
      ),
    );
  }
}
