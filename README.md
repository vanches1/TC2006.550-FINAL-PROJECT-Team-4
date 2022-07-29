# TC2006.550-FINAL-PROJECT-Team-4
Final project team: 
Pedro Samuel Gonzáles Rodríguez A01732105
Pablo Ivan Solares Romero A017323275


-> Project description

As a final project of the programming languages course, the implementation of a text encryption algorithm is proposed. It is intended to perform the encryption of information using the Beaufort algorithm, a poly-alphabetic encryption system. This algorithm is characterized by the need to establish a keyword to perform correctly the process of  encryption and decryption.

-> Programming language 

Due to the previous work done within the elixir programming language, it is proposed to use it as the main tool because it has a wide repertoire of functions for the manipulation of lists. This is quite useful since, if we remember how the information of files is processed and manipulated, lists are an element that will be worked with recurrently, hence the usefulness of elixir stands out.     

-> Expected solution

The expected solution is to implement an algorithm that receives an external text file together with a keyword to perform the encryption/decryption process. When the text file is received, it is intended to be preprocessed and then encrypted. The whole encryption process is based on the well-known "Tabula recta".

![tabula_recta](https://user-images.githubusercontent.com/108293127/180913208-784ed87e-0e5f-4215-b9de-cc1826fd84fe.png)

![vigenere](https://user-images.githubusercontent.com/108293127/181595096-33b594aa-3e58-436f-89d9-fb3ae7ac16a7.gif)



Basically, the whole encryption process is as it follows: 

1.- The letter of the original text is located in the top horizontal row.

2.- Go down the column, until the current letter of the keyword is found.

3.- The leftmost letter of the current row is the new letter of the ciphertext.

Once the last character of the keyword has been used, the algorithm returns to the first key letter and starts taking key characters again from the beginning until the whole text is encrypted.

-> References

The complete documentation of the Beaufort encryption algorithm can be found on the following page. 

http://www.crypto-it.net/eng/simple/beaufort-cipher.html

There we can find a detailed description of the process along with an example implementation in the Python programming language.

---------------------------------------------------------------------

-> Data Input

Since this is a text encryption algorithm, it is expected to receive thre important input to have a succesful function of the programs that is :

1.-External text file along (must be introduced using the following format: "nameXX.txt"). 

2.-The encryption keyword (only one letter must be introduced, the example: "a"). 

3.-Name of the out text file along (must be introduced using the following format: "nameXX.txt").

4.-The word "decode" o "code" valid.

TEXT_ FILE of the INPUT:

![notepad-1](https://user-images.githubusercontent.com/108293127/180915857-96e10935-0fb2-4697-a413-ea225f441d5b.gif)

-> Process of the program 

This function takes the path of the file and opens it, then prepares the data to be read and processed creating a list of lists, where the main list contains the rows of the text as elements, these elements are nested lists. After we give functions that are responsible for processing the data contained in the text file to be encrypted. 

Where one is in charge of processing the main list containing each of the lines of the text as elements and sends them to other function that recieves the rows as lists and processes each of their elements by calling the function that receives the letter to be encoded together with the key letter for the encryption, that key, we use a function that processing it so that it is converted into the number that will indicate to the function how many places the current letter should be displaced for the encryption. 

At the end his function arranges the data and prepares the out-file



-> Expected results




-> Sketch of source file 

Process










