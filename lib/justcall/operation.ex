defmodule Justcall.Operation do
  @moduledoc """
  Standardized struct constructing a API request.
  """

  @type t :: %__MODULE__{
          method: atom(),
          url: binary(),
          data: term()
        }

  @base "https://api.justcall.io/v1"

  defstruct method: :get,
            url: "/",
            data: nil

  @doc """
  Returns a `Operation` struct without data.
  """
  @spec new(metnod :: atom, path :: binary) :: t()
  def new(method, path) do
    new(method, path, nil)
  end

  @doc """
  Returns a `Operation` struct with data.
  """
  @spec new(method :: atom, path :: binary, payload :: term) :: t()
  def new(method, path, payload) do
    struct(%__MODULE__{method: method, data: payload}, url: @base <> path)
  end
end
