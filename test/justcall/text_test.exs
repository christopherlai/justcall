defmodule Justcall.TextTest do
  use ExUnit.Case, async: true
  alias Justcall.Text
  alias Justcall.Operation

  describe "send/3" do
    test "returns an `Operation` struct" do
      assert %Operation{
               method: :post,
               url: "https://api.justcall.io/v1/texts/new",
               data: %{from: "+14155551212", to: "+14155551234", body: "Message"}
             } = Text.send("+14155551212", "+14155551234", "Message")
    end
  end
end
