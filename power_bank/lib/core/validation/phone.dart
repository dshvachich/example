import '../entities/phone_number.dart';
import 'base_form.dart';

enum PhoneValidationError { invalid, empty }

class PhoneForm extends BaseForm<PhoneNumber?, PhoneValidationError> {
  const PhoneForm.pure([PhoneNumber? value, this.isValid]) : super.pure(value);

  const PhoneForm.dirty([PhoneNumber? value, this.isValid]) : super.dirty(value);

  final bool? isValid;

  @override
  PhoneValidationError? validator(PhoneNumber? value) {
    if ((value?.phoneNumber.length ?? 0) < 11) {
      return PhoneValidationError.empty;
    }

    if (isValid == true) {
      return null;
    } else {
      return PhoneValidationError.invalid;
    }
  }

  String getRawNumber() => value!.getRawNumber();

  Future<String?> getFormattedNumber() => value!.getFormattedNumber();
}
