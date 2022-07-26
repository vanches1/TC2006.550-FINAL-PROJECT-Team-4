# TC2006.550-FINAL-PROJECT-Team-4
Final project team: 
Pedro Samuel Gonzáles Rodríguez A01732105
Pablo Ivan Solares Romero A017323275


-> Project description

As a final project of the programming languages course, the implementation of a text encryption algorithm is proposed. It is intended to perform the encryption of information using the Beaufort algorithm, a poly-alphabetic encryption system. This algorithm is characterized by the need to establish a keyword to perform correctly the process of  encryption and decryption.

-> Programming language 

Due to the previous work done within the elixir programming language, it is proposed to use it as the main tool because it has a wide repertoire of functions for the manipulation of lists. This is quite useful since, if we remember how file information is processed and manipulated, lists are an element that will be worked with recurrently, hence the usefulness of elixir stands out.     

-> Expected solution

The expected solution is to implement an algorithm that receives an external text file together with a keyword to perform the encryption/decryption process. When the text file is received, it is intended to be preprocessed and then encrypted. The whole encryption process is based on the well-known "Tabula recta".

![tabula_recta](https://user-images.githubusercontent.com/108293127/180913208-784ed87e-0e5f-4215-b9de-cc1826fd84fe.png)



-> References

https://elixir.libhunt.com/categories/778-images 

Within this discussion forum of the elixir programmers community a list of the best libraries for image processing is listed. In this list stands out the library named "mogrify", it is clear that the features of this library make it a very competent tool for image processing.

 
In addition to having an extensive documentation of each of its functions.   

https://hexdocs.pm/mogrify/readme.html 

---------------------------------------------------------------------

-> Data Input

Since this is an image processing algorithm, the only type of data to be processed is an image.  

![ReadandDisplayImageExample_01](https://user-images.githubusercontent.com/108293127/180588757-0c1e3e18-0e34-43ba-817c-24436281763a.png)

However, other parameters can be considered, such as the modifications to be made to the pixel information matrix or even the filter to be applied to the image. These filters can be done manually, either by modifying the aforementioned matrices or by applying more complex mathematical operations to generate more sophisticated filters. For the latter case it is ideal to use functions already included in the library, since they are usually generated from multiple complex mathematical operations. 

-> Expected results

After image processing, a new image is expected to be obtained. Either with different filters applied on it, a change of color saturation or contrast, grayscale or simply a decomposition into RGB channels. It all depends on the handling and operations applied to the pixel matrix. 

![ContrastEnhancementExample_01](https://user-images.githubusercontent.com/108293127/180588767-22f39037-cc11-4db1-b425-7016a151d768.png)

-> Sketch of source file 

Process

Image (INPUT) -> Matrix -> lines of matrix -> apply filter (convert the value in every pixel by change the filter) -> Matrix convert -> Image with filter = (OUTPUT) 

*Input: The image that we want to process by the differents filters.

*Matrix: We use the libraries to transform the image in a matrix in values, and then separate the lines where to we modify the values of the pixel accordung to the filter.

*Filter_binary: Converts the grayscale matrix to a binary matrix of the image by replacing all values of the pixels in the input image with a luminance greater than level with the value 1 (white) and replacing all other pixels with the value 0 (black).

*Filter_GrayScale: Converts matrix A to a grayscale image I containing values in the range 0 (black) to 1 (white). amin and amax are the values of A that correspond to 0 and 1 in I. Values less than amin are shortened to 0, and values greater than amax are shortened to 1.

*MatrixtoImage: Converts the values of the matrix (pixels) with the values applied by the filter in a image processed.








