// exemplo de codigo em linguagem C++ 
// para somar dois numeros
#include <iostream>
using namespace std;

int main() {
  double num1, num2;
  cout << "Digite o primeiro numero: ";
  cin >> num1;
  cout << "Digite o segundo numero: ";
  cin >> num2;

  double soma = num1 + num2;

  cout << "A soma de "<< num1 << " e " << num2 << "=" << soma << endl;
  return 0;
}