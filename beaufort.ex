defmodule Beaufort do
  #Main function, directs all the data processing
  def main(in_filename, _out_file) do
    _proc_data = in_filename
    |> read_contents()
    |> Enum.join("\n")

  end
  #This function takes the path of the file and opens it
  #also prepares the data to be read in the main array
  def read_contents(path) do
    path
    |> File.stream!()
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.split(&1, ","))
  end

  #Function for keyword manage
  def key_word(_kword, _og_text_len) do
    :Manejo_de_la_keyword
  end

  def encryption(_og_letter, _k_letter) do
    :Calculos_modulo
  end

  #Function for shifting letters
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
      true -> chr
    end
  end

end

#chr |> String.to_charlist |> hd numero a string
#List.to_string([chr]) pasa el numero a string
