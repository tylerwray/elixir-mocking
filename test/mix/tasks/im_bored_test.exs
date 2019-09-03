defmodule Mix.Tasks.ImBoredTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Mock

  alias Mix.Tasks.ImBored

  describe "mix im_bored" do
    test "should return an activity to do if your bored" do
      with_mock HTTPoison,
        get!: fn _url ->
          %HTTPoison.Response{
            body:
              "{\"activity\":\"Listen to music you haven't heard in a while\",\"accessibility\":0.9,\"type\":\"music\",\"participants\":1,\"price\":0.05,\"link\":\"\",\"key\":\"4296813\"}"
          }
        end do
        output =
          capture_io(fn ->
            ImBored.run([])
          end)

        assert output =~ "Activity: Listen to music you haven't heard in a while"
        assert output =~ "Cost: Low"
        assert output =~ "Type: music"
        assert output =~ "Participants: 1"
        assert output =~ "Key: 4296813"
      end
    end
  end
end
