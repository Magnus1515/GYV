
#include<iostream>
#include <cmath>

//include it for istringstream
#include <sstream>
#include <string>
#include <vector>
#include <fstream>


using namespace std;
const int PRIME_CONST = 31;

vector<string> SeparateWords(string palabra){
      vector<string> arr;
      //Creamos un objeto de istringstream 
      //y inicializamos el string de input
    istringstream iss(palabra);

    string word;
        //Extraemos cada palabra sin espacios
        //esta forma puede manejar 
        //cualquier tipo de caracter especial que tengamos

    while(iss >> word) {  
            
            arr.push_back(word);
            //meteremos en nuestro arreglo las palbras ya separadas  
    }
    return arr;
    //regresamos arr, porque lo necesitaremos adelante
    

}
//En esta funcion hash convertimos basicamente cualquier parametro a hash 
//en este caso las llaves las pedimos en tipo string, 
int hashFunction(string key){
        int hashCode = 0; //Declaramos nuestra variable donde guardaremos nuestro hash
        for (int i = 0; i < key.length(); i++) {
            hashCode += key[i] * pow(PRIME_CONST, i);
        }
        return hashCode;
        //nos regresa el hashcode el cual es el numero ya de hash 
        //como en c++ no existe una funcion tuvimos que creara 
}
int MapValue(int hash, int n){
    int index = hash % n; //Realizamos la operacion de mod entre hash y n 
    return index;
}
vector<int> GetHashes(vector<string> arreglo){
    vector<int> vecHashes; 
    //Declaramos nuestro vector para los hashes
    int N = arreglo.size(); 
    // guardamos en n el tamaño del arreglo
    for(int i=0;i < N;i++){ 
        //creamo un for para recorrer todo el arreglo en el tamaño del indice
        int h = hashFunction(arreglo[i]); // variable donde guardamos hashes
        vecHashes.push_back(h); //ingresamos los valores de h en nuestro vecHashes

    }
    return vecHashes;
    //regresamos vecHashes
} 
vector<int> GetIndex(vector <int> arreglo, int N){
    vector<int> VecIndex; // creamos un vector para ahora nuestro indices de vector
    for(int i=0;i < N;i++){
        int h = MapValue(arreglo[i], N); // variable donde guardamos los hashes con los vechashes y N
        VecIndex.push_back(h); // los indices seran introduccidos a VecIndex

    }
    return VecIndex; 
    //regresamos nuevamente VecIndex para dar como resultado final


}
int main(){
    

    vector<string> h1 = SeparateWords("Este sabado David fue a comer tacos de adobada");
    vector<int> h2 = GetHashes(h1);
    vector<int> h3 = GetIndex(h2,h2.size());
    cout<<h3[0]<<endl;
    cout<<h3[1]<<endl;
    cout<<h3[4]<<endl;
    //cout<<h2[1];

    
    // cout << hashFunction("movies") << endl;
    // int h2= hashFunction("john");
    // cout<<MapValue(h2, TamañoInidice);
   
    
    // return 0;
}


    
