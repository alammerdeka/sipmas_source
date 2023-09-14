part of 'decorations.dart';
InputDecoration textFieldDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: miniKarla.copyWith(color: Colors.grey.shade400),
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 0, style: BorderStyle.none)));
}
InputDecoration textFieldPrefixDecoration(String hintText, Icon icon) {
  return InputDecoration(
      hintText: hintText,
      prefixIcon: icon,
      hintStyle: miniKarla.copyWith(color: Colors.grey.shade400),
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 0, style: BorderStyle.none)));
}