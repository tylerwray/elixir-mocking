defmodule Boredom do
  @moduledoc """
  Boredom context.
  """

  @bored_api Application.get_env(
               :boredom,
               :bored_api,
               BoredAPI
             )

  @doc """
  Get a random activity to do when you're bored.

  ## Examples

    iex> Boredom.get_random_activity()
    %{}
  """
  def get_random_activity do
    Application.get_env(
      :boredom,
      :bored_api,
      BoredAPI
    )
    |> IO.inspect(label: "Here")

    IO.inspect(@bored_api, label: "ther")

    ""
    |> @bored_api.get_activity()
    |> price_to_cost()
  end

  defp price_to_cost(%{price: price} = map) when price >= 0 and price < 0.5 do
    Map.merge(map, %{cost: "Low"})
  end

  defp price_to_cost(%{price: price} = map) when price >= 0.5 do
    Map.merge(map, %{cost: "High"})
  end
end
