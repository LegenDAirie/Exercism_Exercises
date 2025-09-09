defmodule HighSchoolSweetheart do
  def first_letter(name), do: String.trim(name) |> String.slice(0, 1)

  def initial(name) do
    first_letter(name)
      |> String.capitalize()
      |> Kernel.<>(".")
  end

  def initials(full_name) do
    [name_one, name_two] = String.split(full_name, " ")
    initial(name_one) <> " " <> initial(name_two)
  end

  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
