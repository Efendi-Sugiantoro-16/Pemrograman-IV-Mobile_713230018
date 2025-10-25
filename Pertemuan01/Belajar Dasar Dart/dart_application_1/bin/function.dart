
int tambah (int a, int b) {
  return a + b;
}

void tampil(String teks){
  print (teks);
}

void greet (String name) {
  print ("Halo, $name!");
}

void main () {
  print ("Halo, Dart!");
  tampil ('ini kirim data');
  int hasil = tambah (5, 10);
  print ("Hasil: $hasil");
}