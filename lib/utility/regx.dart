// ignore_for_file: non_constant_identifier_names

RegExp PhoneregExp = RegExp(
  r'^(\+201|01|00201)[0-2,5]{1}[0-9]{8}',
  caseSensitive: false,
  multiLine: false,
);
RegExp emailregExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
RegExp passwordregExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
RegExp textnumberregExp = RegExp(r'^[0-9_\-=@,\.;]+$');
// RegExp SpecialCharacters =  RegExp( r"^[a-zA-Z0-9.a-zA-Z0-9 ! # $%&* + -/=?^_`{|}~]+\.+");

RegExp onlystringCharacters = RegExp(r"^[\p{L},.'-]*$",
    caseSensitive: false, unicode: true, dotAll: true);
