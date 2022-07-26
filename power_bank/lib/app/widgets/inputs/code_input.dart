import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:power_bank/app/resources/app_colors.dart';
import 'package:power_bank/app/widgets/inputs/input_without_border.dart';

class CodeInput extends StatefulWidget {
  const CodeInput({
    this.code,
    this.error,
    this.onChanged,
    this.autoFocus = false,
    this.focusNode,
  });

  final String? code;
  final String? error;
  final ValueChanged<String>? onChanged;
  final bool autoFocus;
  final FocusNode? focusNode;

  @override
  _CodeInputState createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  static const String _defaultHint = '00000 ';

  late TextEditingController _controller;
  String? _hint;

  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.code ?? '');
    _updateHint();
  }

  @override
  void didUpdateWidget(covariant CodeInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    String currentText = _controller.text;
    String newText = widget.code ?? '';
    if (newText != currentText) {
      _controller.value = TextEditingValue(
        text: newText,
        selection: TextSelection.fromPosition(
          TextPosition(offset: newText.length),
        ),
      );
    }
    _updateHint();
  }

  @override
  Widget build(BuildContext context) {
    Widget input = IntrinsicWidth(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Text(
              _hint ?? '',
              style: const TextStyle(
                fontSize: 40,
                color: AppColors.inputHint,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          InputWithoutBorder(
            textStyle: const TextStyle(
              fontSize: 40,
              color: AppColors.inputText,
              fontWeight: FontWeight.w500,
            ),
            maxLength: 5,
            maxLines: 1,
            controller: _controller,
            textAlign: TextAlign.start,
            focusNode: widget.focusNode,
            keyboardType: TextInputType.number,
            onChanged: widget.onChanged,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
    );
    if (widget.focusNode != null) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          widget.focusNode!.requestFocus();
        },
        child: IgnorePointer(child: input),
      );
    } else {
      return input;
    }
  }

  void _updateHint() {
    String currentText = _controller.text;
    _hint = currentText + _defaultHint.substring(currentText.length, _defaultHint.length);
    setState(() {});
  }
}
