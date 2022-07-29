defmodule Beaufort do

  #Pablo Ivan Solares Romero A01732375
  #Pedro Samuel Gonzales Rodriguez A1732105

  @doc "The following code contains the necessary
  instructions and functions to carry  out a Beaufort
  polyalphabetic encryption process, where the shift
  of the letters from the original text is done according
  to a given key"

  # Main function, this function directs the entire process.
  # It receives 4 arguments with which the operation is carried out.

  # ->First argument "in_filename" must be introduced using the following
  #   format: "nameXX.txt"

  # ->Second argument is "key", only one letter must be introduced
  #   Example: "a"

  # ->Third argument "out_file" must be introduced using the following
  #   format: "nameXX.txt"

  # ->Fourth argument is "inst" only "code" and "decode" are
  #   valid instructions

  # Example of valid execution:

  # ->  Beaufort.main("mensaje.txt", "f", "mensaje_encriptado.txt", "decode")

  def main(in_filename, key, out_file, inst) do

    #All the inputs must be valid to continue the process

    if input_validation(in_filename, key, out_file, inst) do

      # Step1 reads the file and prepares it for the process
      # through calling the "read_contents" function.

      step1 = read_contents(in_filename)

      # This part defines if it is a process of encoding/decoding
      # through the function "code_decode".

      if code_decode(inst) do
        step2 = data_process(step1, encryption(key))
        arrange_data(out_file, step2)
      else
      step2 = data_process(step1, -1 * encryption(key))
      arrange_data(out_file, step2)
      end

    else
      # If one input is not valid displays a warning

      IO.puts("Please, check inputs")
      input_warning(in_filename, key, out_file, inst)
    end
  end

  # This function arranges the data and prepares
  # the out-file.

  def arrange_data(final_data, t) do
    text_data = t
    |> Enum.map(&Enum.join(&1))
    |> Enum.join("\n")

  File.write(final_data, text_data)
  end

  # This function takes the path of the file and opens it
  # also prepares the data to be read and then processed
  # creating a list of lists, where the main list contains
  # the rows of the text as elements, these elements are
  # nested lists.

  def read_contents(path) do
    path
    |> File.stream!()
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.codepoints(&1))
  end

  @doc "The data_process and process_row functions are responsible
  for processing the data contained in the text file to be encrypted.
  Data_process is in charge of processing the main list containing
  each of the lines of the text as elements and sends them to
  the process_row function.
  On the other hand, process_row recieves the rows as lists and
  processes each of their elements by calling the function shift_char"

  def data_process(list, key) do
    do_data_process(list, key, [])
  end
  defp do_data_process(list, key, res) do
    if Enum.empty?(list) do
      Enum.reverse(res)
    else
      if is_list(hd(list)) do
        do_data_process(tl(list), key, [process_row(hd(list), key) |res])
      else
        do_data_process(tl(list), key, [hd(list) |res])
      end
    end
  end

  def process_row(row, key), do: do_process_row(row, key, [])
  defp do_process_row([], _key, res), do:  Enum.reverse(res)
  defp do_process_row([head | tail], key, res), do: do_process_row(tail, key, [shift_char(head, key) | res])

  @doc "The encryotion function is in charge of receiving the
  key letter and processing it so that it is converted into the number
  that will indicate to the shift_char function how many places the
  current letter should be displaced for the encryption"

  def encryption(key) do
    if key > 0 do
      key = hd(String.to_charlist(key))
      cond do
        key >= 65 and key <= 90 -> (key - 65)
        key >= 97 and key <= 122 -> (key - 97)
      end
    end
  end

  @doc "This function is the one used in the main function
  to help to decide which process is going to carry out by
  the program"

  def code_decode(inst) do
    cond do
      String.equivalent?(inst, "code") == true -> true
      String.equivalent?(inst, "decode") == true -> false
    end
  end


  # Function for shifting letters, receives the letter to
  # be encoded together with the key letter for the encryption

  def shift_char(chr,int) do
    cond do
      #Shift of lowcase letters
      hd(String.to_charlist(chr)) >= 97 and hd(String.to_charlist(chr)) <= 122 -> if int > 0 do
        if hd(String.to_charlist(chr)) + int <= 122  do
          List.to_string([hd(String.to_charlist(chr)) + int])
        else
          List.to_string([(hd(String.to_charlist(chr)) - 122) + (int - 1) + 97 ])
        end
      else
        if hd(String.to_charlist(chr)) + int >= 97 do
          List.to_string([hd(String.to_charlist(chr)) + int])
        else
          List.to_string([(hd(String.to_charlist(chr)) - 97) - (abs(int) - 1) + 122 ])
        end
      end
      #Shift of uppercase letters
      hd(String.to_charlist(chr)) >= 65 and hd(String.to_charlist(chr)) <= 90 -> if int > 0 do
        if hd(String.to_charlist(chr)) + int <= 90  do
          List.to_string([hd(String.to_charlist(chr)) + int])
        else
          List.to_string([(hd(String.to_charlist(chr)) - 90) + (int - 1) + 65 ])
        end
      else
        if hd(String.to_charlist(chr)) + int >= 65 do
          List.to_string([hd(String.to_charlist(chr)) + int])
        else
          List.to_string([(hd(String.to_charlist(chr)) - 65) - (abs(int) - 1) + 90 ])
        end
      end
      # Characters different from a letter remain the same
      true -> chr
    end
  end

  # This function validates the inputs, if they are valid returns TRUE to
  # continue the operation.

  def input_validation(in_filename, key, out_file, inst) do
    if Regex.match?(~r/.txt/, in_filename) and Regex.match?(~r/.txt/, out_file) do
      if String.length(key) == 1 do
        if String.equivalent?(inst, "code") == true or String.equivalent?(inst, "decode") do
          true
        else
          false
        end
      else
        false
      end
    else
       false
    end
  end

  # This function gives a warning if one of the inputs is invalid

  def input_warning(in_filename, key, out_file, inst) do
    cond do
      Regex.match?(~r/.txt/, in_filename) == false -> IO.puts("Invalid in file name\nThe file must have .txt extension")
      String.length(key) != 1 -> IO.puts("Invalid key\nkey must be only one letter")
      Regex.match?(~r/.txt/, out_file) == false -> IO.puts("Invalid out file name\nThe file must have .txt extension")
      String.equivalent?(inst, "code") == false -> IO.puts("Invalid instruction\ncode or decode are the only valid instructions")
      String.equivalent?(inst, "decode") == false -> IO.puts("Invalid instruction\ncode or decode are the only valid instructions")
    end
  end

end
