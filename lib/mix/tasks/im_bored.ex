defmodule Mix.Tasks.ImBored do
  @moduledoc """
  Mix task to run when you are bored!

  ## Examples

    $ mix im_bored
    Clean out your closet and donate the clothes you've outgrown
  """

  use Mix.Task

  def run([]) do
    Mix.Task.run("app.start")

    %{
      activity: activity,
      cost: cost,
      type: type,
      participants: participants,
      key: key
    } = Boredom.get_random_activity()

    IO.puts("\n================ You bored? ================")
    IO.puts("Activity: #{activity}")
    IO.puts("Cost: #{cost}")
    IO.puts("Type: #{type}")
    IO.puts("Participants: #{participants}")
    IO.puts("Key: #{key}")
    IO.puts("\n")
  end
end
