import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyToClipBoardScreen extends StatefulWidget {
  const CopyToClipBoardScreen({super.key});

  @override
  State<CopyToClipBoardScreen> createState() => _CopyToClipBoardScreenState();
}

class _CopyToClipBoardScreenState extends State<CopyToClipBoardScreen> {
  // TextField에서 값을 받을 controller들
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();

  // 클립보드에 복사하는 기능
  void _copyValuesToClipboard() {
    final text1 = _controller1.text;
    final text2 = _controller2.text;
    final text3 = _controller3.text;

    // \t를 넣어주면 엑셀에 붙여넣기 할 때, 한 칸씩 띄울 수 있다.
    final clipboardText = "$text1\t$text2\t$text3";

    // setData()를 통해 클립보드에 값 저장 (Future<void>를 return) => 후에 콜백 함수를 받음
    // 저장 후, 스낵바에 표시
    // 여기서 context는 buildContext를 의미 => 현재 위젯은 위젯 트리에서 어디에 위치하는지에 대한 정보를 가지고 있다.
    Clipboard.setData(ClipboardData(text: clipboardText)).then((_) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("클립보드에 복사 완료"))));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Copy to Clip Board'),),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TextField는 부모 위젯에서 크기를 지정해줘야 한다.
                // 지정하지 않으면 무한히 거져서 에러 발생
                Text("입력1 : "),
                Container(width: 100,child: TextField(controller: _controller1, decoration: InputDecoration(hintText: "Enter"),)),
                Text("입력2 : "),
                Container(width: 100,child: TextField(controller: _controller2, decoration: InputDecoration(hintText: "Enter"),)),
                Text("입력3 : "),
                Container(width: 100,child: TextField(controller: _controller3, decoration: InputDecoration(hintText: "Enter"),)),
              ],
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              _copyValuesToClipboard();
            }, child: Text('Copy'))
          ],
        ),
      ),
    );
  }
}