defmodule Justcall.Configuration do
  @moduledoc """
  Request configurations for the `Justcall` API.
  """

  @type t :: %__MODULE__{
          headers: keyword(),
          json_library: module() | nil,
          client: module() | nil
        }

  @base_headers ["Content-Type": "application/json"]

  defstruct headers: [],
            json_library: Jason,
            client: Justcall.Client.Hackney

  @doc """
  Returns a `Configuration` struct.
  """
  @spec new :: t()
  def new do
    config = runtime()
    headers = build_headers(@base_headers, config[:api_key], config[:api_secret])
    json_library = config[:json_library] || Jason
    client = config[:client] || Justcall.Client.Hackney

    struct(__MODULE__, headers: headers, json_library: json_library, client: client)
  end

  @spec build_headers(headers :: keyword(), key :: binary, secret :: binary) :: keyword()
  defp build_headers(headers, key, secret) do
    Keyword.merge(headers, Authorization: "#{key}:#{secret}")
  end

  @spec runtime :: keyword()
  defp runtime do
    config = Application.get_all_env(:justcall)

    unless config[:api_key] do
      raise "Missing :api_key for :justcall config."
    end

    unless config[:api_secret] do
      raise "Missing :api_secret for :justcall config."
    end

    config
  end
end
