import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key key}) : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    List<int> value = [2];
    List<S2Choice<int>> frameworks = [
      S2Choice<int>(value: 1, title: 'Ionic'),
      S2Choice<int>(value: 2, title: 'Flutter'),
      S2Choice<int>(value: 3, title: 'React Native'),
    ];

    return Column(
      children: [
        SmartSelect<int>.multiple(
          title: 'Frameworks',
          value: value,
          choiceItems: frameworks,
          onChange: (state) => setState(() => value = state.value),
          choiceLayout: S2ChoiceLayout.wrap,
          choiceDirection: Axis.horizontal,
        ),
      ],
    );
  }
}
