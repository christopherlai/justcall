defmodule Justcall.ConfigurationTest do
  use ExUnit.Case, async: true
  alias Justcall.Configuration

  setup do
    put_env(:api_key, "key")
    put_env(:api_secret, "secret")

    :ok
  end

  describe "new/0" do
    test "raise if :api_key is missing" do
      delete_env(:api_key)

      assert_raise RuntimeError, fn ->
        Configuration.new()
      end
    end

    test "reaise if :api_secret is missing" do
      delete_env(:api_secret)

      assert_raise RuntimeError, fn ->
        Configuration.new()
      end
    end

    test "returns a `Configuration` struct with :api_key and :api_secret" do
      put_env(:api_key, "123")
      put_env(:api_secret, "abc")

      config = Configuration.new()
      assert config.headers[:Authorization] == "123:abc"
    end

    test "returns a `Configuration` struct with a custom :json_library" do
      put_env(:json_library, SomeJSONLibrary)

      config = Configuration.new()
      assert config.json_library == SomeJSONLibrary
    end

    test "returns a `Configuration` struct with a custom :client" do
      put_env(:client, SomeClient)

      config = Configuration.new()
      assert config.client == SomeClient
    end
  end

  defp put_env(key, value) do
    Application.put_env(:justcall, key, value)
  end

  defp delete_env(key) do
    Application.delete_env(:justcall, key)
  end
end
