defmodule Justcall.Client.Hackney do
  require Logger
  @behaviour Justcall.Client

  @impl true
  def request(%{http_method: method, url: url, data: nil}, config) do
    method
    |> :hackney.request(url, config.headers)
    |> handle_response(config.json_library)
  end

  @impl true
  def request(operation, config) do
    url = operation.url
    headers = config.headers
    parser = config.json_library
    body = parser.encode!(operation.data)

    operation.method
    |> :hackney.request(url, headers, body)
    |> handle_response(parser)
  end

  defp handle_response({:ok, status, _headers, ref}, parser) when status in [200, 201, 204] do
    with {:ok, body} <- :hackney.body(ref),
         {:ok, response} <- parser.decode(body) do
      {:ok, response}
    else
      {:error, reason} ->
        Logger.error("Unable to complete request. Reason: #{inspect(reason)}")

        {:error, reason}
    end
  end

  defp handle_response({:ok, status, _headers, ref}, parser) when status in [400, 404] do
    with {:ok, body} <- :hackney.body(ref),
         {:ok, response} <- parser.decode(body) do
      {:error, response}
    else
      {:error, reason} ->
        Logger.error("Unable to complete request. Reason: #{inspect(reason)}")

        {:error, reason}
    end
  end
end
