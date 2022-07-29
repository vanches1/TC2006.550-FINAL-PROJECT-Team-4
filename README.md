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

-External text file along. 
-The encryption keyword. 
-The word "decode" o "code".

![notepad-1](https://user-images.githubusercontent.com/108293127/180915857-96e10935-0fb2-4697-a413-ea225f441d5b.gif)


However, other parameters can be considered, such as the modifications to be made to the pixel information matrix or even the filter to be applied to the image. These filters can be done manually, either by modifying the aforementioned matrices or by applying more complex mathematical operations to generate more sophisticated filters. For the latter case it is ideal to use functions already included in the library, since they are usually generated from multiple complex mathematical operations. 

-> Expected results

After image processing, a new image is expected to be obtained. Either with different filters applied on it, a change of color saturation or contrast, grayscale or simply a decomposition into RGB channels. It all depends on the handling and operations applied to the pixel matrix. 



-> Sketch of source file 

Process










