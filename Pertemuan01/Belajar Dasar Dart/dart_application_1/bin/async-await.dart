Future <void> proccess1 () async {
  // Simulasi Delay Jaringan
  await Future.delayed(Duration(seconds: 1));
  print("Data fetched from the server");

}

void proccess2 () {
  print ("data dari p2 selesai");
}

void main () async {
  await proccess1();
  print ("Mulai proses");
  proccess2();
  print ("Proses selesai");
}