defmodule Mix.Tasks.ImBoredTest do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO
  import Mox

  alias Mix.Tasks.ImBored

  setup :verify_on_exit!

  describe "mix im_bored" do
    test "should return an activity to do if your bored" do
      BoredAPIMock
      |> expect(:get_activity, fn _params ->
        %{
          accessibility: 0.3,
          activity: "Find a DIY to do",
          key: "4981819",
          link: "",
          participants: 1,
          price: 0.4,
          type: "diy"
        }
      end)

      output =
        capture_io(fn ->
          ImBored.run([])
        end)

      assert output =~ "Activity: Find a DIY to do"
      assert output =~ "Cost: Low"
      assert output =~ "Type: diy"
      assert output =~ "Participants: 1"
      assert output =~ "Key: 4981819"
    end
  end
end
