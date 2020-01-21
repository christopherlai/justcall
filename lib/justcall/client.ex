defmodule Justcall.Client do
  @moduledoc """
  Client behaviour.
  """

  alias Justcall.{
    Configuration,
    Operation
  }

  @type response :: {:ok, term} | {:error, term}

  @doc """
  Executes a request for the given Operation with the given Configuration.
  """
  @callback request(operation :: Operation, configuration :: Configuration) :: response()
end
