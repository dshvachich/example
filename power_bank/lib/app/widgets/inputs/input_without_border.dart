import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:power_bank/app/resources/app_colors.dart';

class InputWithoutBorder extends StatefulWidget {
  const InputWithoutBorder({
    this.text,
    this.label,
    this.hint,
    this.error,
    this.controller,
    this.onChanged,
    this.autoFocus = false,
    this.maxLength,
    this.inputFormatters,
    this.keyboardType,
    this.autofillHints,
    this.needCounter = false,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.minLines,
    this.focusNode,
    this.textStyle = const TextStyle(
      fontSize: 28,
      color: AppColors.onBackground11,
      fontWeight: FontWeight.w500,
    ),
    this.hintStyle = const TextStyle(
      fontSize: 28,
      color: AppColors.inputHint,
      fontWeight: FontWeight.w500,
    ),
  });

  final String? text;
  final String? label;
  final String? hint;
  final String? error;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool autoFocus;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final bool needCounter;
  final TextAlign textAlign;
  final int maxLines;
  final int? minLines;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;

  @override
  _InputWithoutBorderState createState() => _InputWithoutBorderState();
}

class _InputWithoutBorderState extends State<InputWithoutBorder> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.text);
  }

  @override
  void didUpdateWidget(covariant InputWithoutBorder oldWidget) {
    super.didUpdateWidget(oldWidget);
    String newText = widget.text ?? '';
    if (newText != _controller.text && widget.controller == null) {
      _updateText(newText);
    }
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: _controller,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        style: widget.textStyle,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        textAlign: widget.textAlign,
        autofillHints: widget.autofillHints,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          counterText: widget.needCounter ? null : '',
          errorText: widget.error,
          hintText: widget.hint,
          hintStyle: widget.hintStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 7),
        ),
      );

  void _updateText(String newText) {
    String currentText = _controller.text;
    int offset = -1;
    List<String> newTextChars = currentText.split('');
    if (newText.isEmpty) {
      offset = 0;
    } else {
      for (var char in newTextChars) {
        var index = newTextChars.indexOf(char);
        if (index >= currentText.length) {
          offset = newText.length;
          break;
        }
        String startNewText = newText.substring(0, index);
        String startCurrentText = currentText.substring(0, index);
        if (startNewText != startCurrentText) {
          offset = index;
          break;
        }
      }
      if (offset == -1) {
        offset = newText.length;
      }
    }

    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: offset),
      ),
    );
  }
}
