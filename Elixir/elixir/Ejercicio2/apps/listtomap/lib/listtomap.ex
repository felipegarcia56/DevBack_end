defmodule Listtomap do
  @moduledoc """
  Documentation for Listtomap.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Listtomap.hello()
      :world

  """

  def generator(l, map) do
    [date | body] = l
    [time | value] = body

    map =
      if Map.has_key?(map, date) do
        if Map.has_key?(map[date], time) do
          %{map | date => Map.merge(map[date], %{time => map[date][time] + Enum.at(value, 1)})}
        else
          %{map | date => Map.merge(map[date], %{time => Enum.at(value, 1)})}
        end
      else
        Map.merge(map, %{date => %{time => Enum.at(value, 1)}})
      end

    map
  end

  def createMap([], map), do: map

  def createMap([head | tail], map) do
    map = generator(head, map)
    createMap(tail, map)
  end

  def list() do
    l = [
      ["2018-12-01", "AM", "ID123", 5000],
      ["2018-12-01", "AM", "ID545", 7000],
      ["2018-12-01", "PM", "ID545", 3000],
      ["2018-12-02", "AM", "ID545", 7000]
    ]

    createMap(l, %{})
  end

  def hello do
    :world
  end
end
