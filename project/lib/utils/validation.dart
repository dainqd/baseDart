class Validation {
  static bool validationPhone(String value) {
    Pattern pattern = r'(^#?(0[3|5|7|8|9])[0-9][0-9]{7}#?$)';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value)) return false;
    return true;
  }

  static bool validationEmail(String value) {
    Pattern pattern =
        r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$";
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value)) return false;
    return true;
  }
}
