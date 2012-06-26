/**
 * Write a program to print out the endianness of the system.
 */

#include <iostream>
using namespace std;

int main() {
  int i = 1;
  char *p = (char *) &i;

  if (p[0] == 1) {
    cout << "LittleEndian" << endl;
  } else {
    cout << "BigEndian" << endl;
  }

  return 0;
}
