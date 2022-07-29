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

TERMINAL of CODE:
![input_1](https://user-images.githubusercontent.com/108293097/181804404-3b3f0091-6028-430f-af81-98983b305165.JPG)

TERMINAL of DECODE:
![input_2](https://user-images.githubusercontent.com/108293097/181804417-afb3fde3-db00-4043-a208-42b896994414.JPG)

TEXT_ FILE of the INPUT of CODE:

![entrada_1](https://user-images.githubusercontent.com/108293097/181799402-fbe82b23-a602-41d0-bfd8-e47309c5fca1.JPG)

TEXT_ FILE of the INPUT of DECODE:
![salida_1](https://user-images.githubusercontent.com/108293097/181804201-fc5393e0-1157-4b9d-817a-fb033d54acea.JPG)

-> Process of the program 

This function takes the path of the file and opens it, then prepares the data to be read and processed creating a list of lists, where the main list contains the rows of the text as elements, these elements are nested lists. After we give functions that are responsible for processing the data contained in the text file to be encrypted. 

Where one is in charge of processing the main list containing each of the lines of the text as elements and sends them to other function that recieves the rows as lists and processes each of their elements by calling the function that receives the letter to be encoded together with the key letter for the encryption, that key, we use a function that processing it so that it is converted into the number that will indicate to the function how many places the current letter should be displaced for the encryption. 

At the end his function arranges the data and prepares the out-file

-> Expected results

TEXT_ FILE of the OUTPUT of CODE:

![salida_1](https://user-images.githubusercontent.com/108293097/181799446-1f501d18-eb4d-4de8-a16d-eaad17457490.JPG)

TEXT_ FILE of the OUTPUT of DECODE:

![salida_2](https://user-images.githubusercontent.com/108293097/181804153-2f95285a-5498-4326-9228-c8dfa4b11def.JPG)

-> Process to Compile and Warnings.

To Compile we have to input in your terminal:

iex.bat .\"File_name".exs

Then 

Beaufort.main("Hola.txt","R","hola_encryp.txt" ,"code")

Where: 
*First argument "in_filename" must be introduced using the following format: "nameXX.txt"

*Second argument is "key", only one letter must be introduce Example: "a"

*Third argument "out_file" must be introduced using the following format: "nameXX.txt"

*Fourth argument is "inst" only "code" and "decode" are valid instructions

Warnings:

If you put:

*A file different file in the input from a .txt you obtain a message that say: "Invalid in file name\nThe file must have .txt extension"

*More than a letter in key you obtain a message that say: "Invalid key\nkey must be only one letter"

*A file different file in the output from a .txt you obtain a message that say: "Invalid out file name\nThe file must have .txt extension"

*A word different than "decode" or "code" you obtain a message that say: "Invalid instruction\ncode or decode are the only valid instructions"










