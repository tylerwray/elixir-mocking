defmodule Boredom do
  @moduledoc """
  Boredom context.
  """

  import Mockery.Macro

  @doc """
  Get a random activity to do when you're bored.

  ## Examples

    iex> Boredom.get_random_activity()
    %{}
  """
  def get_random_activity do
    "https://www.boredapi.com/api/activity"
    |> mockable(HTTPoison).get!()
    |> Map.get(:body)
    |> Poison.decode!()
    |> Map.new(fn {k, v} -> {String.to_atom(k), v} end)
    |> price_to_cost()
  end

  defp price_to_cost(%{price: price} = map) when price >= 0 and price < 0.5 do
    Map.merge(map, %{cost: "Low"})
  end

  defp price_to_cost(%{price: price} = map) when price >= 0.5 do
    Map.merge(map, %{cost: "High"})
  end
end
