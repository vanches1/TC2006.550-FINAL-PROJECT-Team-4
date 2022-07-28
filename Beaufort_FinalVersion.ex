defmodule Beaufort do
  #Final project Beaufort encoding
  #Pablo Ivan Solares Romero A01732375
  #Pedro Samuel Gonzales Rodriguez A1732105

  #Main function, directs all the data processing
  def main(in_filename, key, out_file, inst) do
    proc_data = in_filename
    step1 = read_contents(in_filename)
    if code_decode(inst) do
      step2 = data_process(step1, encryption(key))
      arrange_data(out_file, step2)
    else
      step2 = data_process(step1, -1 * encryption(key))
      arrange_data(out_file, step2)
    end
    #step2 = data_process(step1, encryption(key))

    #arrange_data(out_file, step2)
    #|> Enum.join("\n")

  end

  def arrange_data(final_data, t) do
    text_data = t
    |> Enum.map(&Enum.join(&1))
    |> Enum.join("\n")

  File.write(final_data, text_data)
  end

  #This function takes the path of the file and opens it
  #also prepares the data to be read in the main array
  def read_contents(path) do
    path
    |> File.stream!()
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.codepoints(&1))


   #|> Enum.map(&String.split(&1))
  end

  def data_process(list, key) do
    do_data_process(list, key, [])
  end
  defp do_data_process(list, key, res) do
    if Enum.empty?(list) do
      Enum.reverse(res)
    else
      if is_list(hd(list)) do #this part sends the row to process the data
        do_data_process(tl(list), key, [process_row(hd(list), key) |res])
      else
        do_data_process(tl(list), key, [hd(list) |res])
      end
    end
  end

  def process_row(row, key), do: do_process_row(row, key, [])
  defp do_process_row([], key, res), do:  Enum.reverse(res)
  defp do_process_row([head | tail], key, res), do: do_process_row(tail, key, [shift_char(head, key) | res])


  def encryption(key) do
    if key > 0 do
      key = hd(String.to_charlist(key))
      cond do
        key >= 65 and key <= 90 -> (key - 65)
        key >= 97 and key <= 122 -> (key - 97)
      end
    end
  end

  def code_decode(inst) do
    cond do
      String.equivalent?(inst, "code") == true -> true
      String.equivalent?(inst, "decode") == true -> false
    end
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
