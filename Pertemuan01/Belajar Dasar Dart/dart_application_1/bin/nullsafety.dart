void main () {
  int ? nullableInt;
  String ? nullableString = null;
  String ? nama = "Efendi Sugiantoro";
  print(nullableInt);
  print(nullableString);

  print (nullableInt ?? 0);
  print (nullableString ?? "Hello, Dart!");

  print (nama?.toUpperCase() ?? "Nama kosong");

}