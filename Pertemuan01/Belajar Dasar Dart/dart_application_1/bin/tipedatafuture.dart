Future<String> proccess1 () async {
  // Simulasi Delay Jaringan
  await Future.delayed(Duration(seconds: 1));
  return "Data fetched from the server";

}

Future<String> fetchUsername () async {
  // Simulasi Delay Jaringan 
  await Future.delayed(Duration(seconds: 1));
  return "Efendi Sugiantoro";
}
// Fungsi Main Asynchronous
void main () async {
  var data = await proccess1();
  print (data);
  print ("Mulai proses");
  var username = await fetchUsername();
  print ("Username: $username");
  data = await proccess1();
  print (data);
  print ("Proses selesai");
}