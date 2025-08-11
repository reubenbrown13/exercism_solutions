defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @enforce_keys [:direction, :position]
  defstruct [:direction, :position]

  defguardp is_valid_position(position)
            when is_tuple(position)
                 and tuple_size(position) == 2
                 and is_integer(elem(position, 0))
                 and is_integer(elem(position, 1))
  @validDirections [:north,:east,:south,:west]
  defguard is_direction(value) when value in @validDirections

  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0,0})
  def create(direction, position) when is_direction(direction) and is_valid_position(position) do
    [direction, position]
  end
  def create(_direction, position) when is_valid_position(position), do: {:error, "invalid direction"}
  def create(direction, _position) when is_direction(direction), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) when binary_part(instructions,0,1) in ["A","L","R"]  do
    i = String.first(instructions)
    case i do
      "A" -> move( robot,i )
      "L" -> rotate( robot, i)
      "R" -> rotate( robot, i)
    end |> simulate( String.slice(instructions, 1..-1) )
  end
  def simulate(robot, ""), do: robot
  def simulate(_robot, _instructions), do: {:error, "invalid instruction"}
  @doc """
  Return the robot's direction.

  Valid directions are: `:nort  end
    h`, `:east`, `:south`, `:west`
  """
  @spec rotate(robot :: any, ins :: String.t()) :: any
  def rotate(robot,ins) when (ins == "R" and hd(robot) == :west) or (ins == "L" and hd(robot) == :east) do
    [:north,position(robot)]
  end
  def rotate(robot,ins) when (ins == "R" and hd(robot) == :north) or (ins == "L" and hd(robot) == :south) do
    [:east,position(robot)]
  end
  def rotate(robot,ins) when (ins == "R" and hd(robot) == :east) or (ins == "L" and hd(robot) == :west) do
    [:south,position(robot)]
  end
  def rotate(robot,ins) when (ins == "R" and hd(robot) == :south) or (ins == "L" and hd(robot) == :north) do
    [:west,position(robot)]
  end
  @spec move(robot :: any, ins :: String.t()) :: any
  def move(robot,ins) when ins == "A" and hd(robot) == :north do
    [direction(robot),{elem(position(robot),0),elem(position(robot),1)+1}]
  end
  def move(robot,ins) when ins == "A" and hd(robot) == :east do
    [direction(robot),{elem(position(robot),0)+1,elem(position(robot),1)}]
  end
  def move(robot,ins) when ins == "A" and hd(robot) == :south do
    [direction(robot),{elem(position(robot),0),elem(position(robot),1)-1}]
  end
  def move(robot,ins) when ins == "A" and hd(robot) == :west do
    [direction(robot),{elem(position(robot),0)-1,elem(position(robot),1)}]
  end

  @spec direction(robot :: any) :: atom
  def direction(robot) do
    hd(robot)
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    Enum.at(robot,1)
  end
end
