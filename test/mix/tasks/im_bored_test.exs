defmodule Mix.Tasks.ImBoredTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias Mix.Tasks.ImBored

  describe "mix im_bored" do
    test "should return an activity to do if your bored" do
      output =
        capture_io(fn ->
          ImBored.run([])
        end)

      assert output =~ "Activity:"
      assert output =~ "Cost:"
      assert output =~ "Type:"
      assert output =~ "Participants:"
      assert output =~ "Key:"
    end
  end
end
