# Justcall
This library currently only supports sending `text` messages. Please open a PR to add support for additional `Justcall` endpoints.

## Installation
To start using `Justcall`, add `justcall` to your `mix.exs` file and run `mix deps.get`.

```elixir
defp deps do
  [
    {:justcall, github: "christopherlai/justcall"}
  ]
end
```

## Usage
Constructing a API request is decoupled from executing the API request. In example below, `Justcall.Text.send/3` returns an `Justcall.Operation`, calling `Justcall.request/1` performs the network side effect.

```elixir
text = Justcall.Text.send("+15555551212", "+15555551313", "Message body")
{:ok, response} = Justcall.request(text)
```

## Testing
Network side effects are performed using the `Justcall.Client.Hackney` module which uses the `Justcall.Client` behaviour.

While testing your application, you can create a mock module that implements the callbacks in `Justcall.Client` or use [`mox`](#)(https://hex.pm/packages/mox).

```elixir
# config/test.exs
import Config

config :justcall,
  client: MockClient


# mock_client.ex
defmodule MockClient do
  @behaviour Justcall.Client

  @impl true
  def request(_op, _config) do
    {:ok, "Success"}
  end
end
```

## Status
![](https://github.com/christopherlai/justcall/workflows/test/badge.svg)

## License
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.