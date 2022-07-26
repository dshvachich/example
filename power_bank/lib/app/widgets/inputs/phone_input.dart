import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:power_bank/app/resources/app_colors.dart';
import 'package:power_bank/app/widgets/inputs/input_without_border.dart';
import 'package:power_bank/core/entities/phone_number.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({
    this.phone,
    this.error,
    this.onChanged,
    this.autoFocus = false,
    this.focusNode,
  });

  final PhoneNumber? phone;
  final String? error;
  final ValueChanged<PhoneNumber>? onChanged;
  final bool autoFocus;
  final FocusNode? focusNode;

  @override
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  static const String _defaultHint = '+7 (000) 000-00-00 ';

  MaskTextInputFormatter? _formatter;
  late TextEditingController _controller;
  String? _hint;

  void initState() {
    super.initState();
    String newText;
    if ((widget.phone?.formattedNumber ?? '').isEmpty) {
      newText = '+7';
    } else {
      newText = widget.phone!.formattedNumber;
    }
    _controller = TextEditingController(text: newText);
    _initFormatter();
    _updateHint();
  }

  @override
  void didUpdateWidget(covariant PhoneInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    String newText;
    if ((widget.phone?.formattedNumber ?? '').isEmpty) {
      newText = '+7';
    } else {
      newText = widget.phone!.formattedNumber;
    }
    String currentText = _controller.text;
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
                fontSize: 28,
                color: AppColors.inputHint,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          InputWithoutBorder(
            maxLength: 40,
            maxLines: 1,
            controller: _controller,
            textAlign: TextAlign.start,
            focusNode: widget.focusNode,
            inputFormatters: _formatter != null ? [_formatter!] : null,
            keyboardType: TextInputType.phone,
            onChanged: _onChanged,
            autofillHints: [AutofillHints.telephoneNumber],
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

  Future<void> _initFormatter() async {
    _formatter = MaskTextInputFormatter(mask: '+7 (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});
    if (mounted) {
      setState(() {});
    }
  }

  void _onChanged(String text) async {
    String phone = text.replaceAll(RegExp(r'[^0-9]'), '');
    PhoneNumber number = PhoneNumber(
      phoneNumber: phone,
      dialCode: '7',
      isoCode: 'ru',
      formattedNumber: text,
    );
    widget.onChanged?.call(number);
  }

  void _updateHint() {
    String currentText = _controller.text;
    _hint = currentText + _defaultHint.substring(currentText.length, _defaultHint.length);
    setState(() {});
  }
}
