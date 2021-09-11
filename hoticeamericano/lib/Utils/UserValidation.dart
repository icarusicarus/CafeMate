bool userIdVaildation(String? value) {
  String pattern = r'^[A-Za-z0-9]{5,30}$';

  RegExp numExp = RegExp("[0-9]");
  RegExp regExp = RegExp(pattern);

  if(numExp.hasMatch(value![0]))
    return true;
  return !regExp.hasMatch(value);
}

bool passwordValidation(String? value) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,30}$';
  RegExp regExp = RegExp(pattern);

  return !regExp.hasMatch(value!);
}

bool nicknameValidation(String? value) {
  String pattern = r'^[A-Za-z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,30}$';
  RegExp regExp = RegExp(pattern);

  return !regExp.hasMatch(value!);
}