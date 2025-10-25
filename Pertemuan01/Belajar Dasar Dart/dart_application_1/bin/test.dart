void main(){
  var nama = "Efendi Sugiantoro";
  nama = "Efendi";
  // Final dan Const
  final umur = 20;
  final DateTime sekarang = DateTime.now();
  const maxScore = 100;
  const double phi = 3.14;
  // Dynamic Initialization
  dynamic variable = "Nama Saya Efendi";
  variable = 42;
  // maxScore = 200; --- IGNORE ---
  // Late Initialization
  late String FullName;
  FullName = "Efendi Sugiantoro";

  print (nama);
  print (umur);
  print (sekarang);
  print (phi);
  print (variable);
}