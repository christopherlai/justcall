defmodule Justcall.OperationTest do
  use ExUnit.Case, async: true
  alias Justcall.Operation

  describe "new/2" do
    test "returns a `Operation` struct with the given method and path" do
      op = Operation.new(:get, "/test")
      assert op.method == :get
      assert op.url == "https://api.justcall.io/v1/test"
      refute op.data
    end
  end

  describe "new/3" do
    test "returns a `Operation` struct with the given method, path and payload" do
      op = Operation.new(:get, "/test", %{foo: :bar})
      assert op.method == :get
      assert op.url == "https://api.justcall.io/v1/test"
      assert op.data == %{foo: :bar}
    end
  end
end
