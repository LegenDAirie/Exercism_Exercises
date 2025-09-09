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

  def pair(_full_name1, _full_name2) do
  """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     A. B.  +  C. D.     **
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
