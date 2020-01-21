defmodule Justcall.Text do
  @moduledoc """
  Operations  on the `Text` API.
  """

  alias Justcall.Operation

  @doc """
  Send a text message.
  """
  @spec send(from :: binary(), to :: binary(), body :: binary(), opts :: keyword()) ::
          Operation.t()
  def send(from, to, body, opts \\ []) do
    payload = Enum.into(opts, %{from: from, to: to, body: body})
    Operation.new(:post, "/texts/new", payload)
  end
end
