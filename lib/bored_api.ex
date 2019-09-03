defmodule BoredAPI do
  @type activity :: %{
          accessibility: float(),
          activity: String.t(),
          key: String.t(),
          link: String.t(),
          participants: number(),
          price: float(),
          type: String.t()
        }

  @callback get_activity(String.t()) :: activity

  def get_activity(params) do
    "https://www.boredapi.com/api/activity/#{params}"
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Poison.decode!()
    |> Map.new(fn {k, v} -> {String.to_atom(k), v} end)
  end
end
