var Hello = (){
  print ('Halo, Dart!') ;
};

var jumlah = (int a, int b){
  return a + b;
};
void main () {
  Hello();
  print (jumlah (5, 10));
}