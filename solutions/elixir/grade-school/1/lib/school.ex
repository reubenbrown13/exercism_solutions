defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """
  @type gradeMap :: %{ grade: integer, names: [] }
  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(gradeMap, String.t(), integer) :: map
  def add(db, name, grade) do
    if ( !Map.has_key?(db, grade) ), do: put_in( db[grade], [name] ), else: put_in( db[grade], [name|db[grade]] )
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(gradeMap, integer) :: [String.t()]
  def grade(db, grade) do
    if ( !Map.has_key?(db, grade) ), do: [], else: db[grade]
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(gradeMap) :: [{integer, [String.t()]}]
  def sort(db) do
    db |> Enum.map( fn {key,val} -> {key, Enum.sort(val)} end )
  end
end
