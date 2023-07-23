import 'package:los_app/system/types.dart';

final Map<ValidateType, RegExp> validateRegs = {
  ValidateType.id: RegExp(
    r'^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$',
  ),
  ValidateType.phoneNumber: RegExp(
    r'\d{2,3}-\d{3,4}-\d{4}',
  ),
  ValidateType.teamName: RegExp(
    r'^[0-9a-zA-Z가-힣]{1,10}\S',
  ),
  ValidateType.specialChar:
      RegExp(r'[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\"]'),
};

bool match(String str, ValidateType type) {
  final RegExp? reg = validateRegs[type];
  if (reg == null) throw 'NullRegTypeException';
  return validateRegs[type]!.hasMatch(str);
}
