defmodule Justcall do
  @moduledoc """
  Documentation for Justcall.
  """
  alias Justcall.Configuration

  def request(operation) do
    config = Configuration.new()
    config.client.request(operation, config)
  end
end
