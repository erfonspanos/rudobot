defmodule RudoBot.HttpClient do
  use Tesla

  def client(base_url) do
    Tesla.client([
      {Tesla.Middleware.BaseUrl, base_url},
      {Tesla.Middleware.JSON, engine: Jason}
    ])
  end

  def get(url, path, query_params \\ []) do
    client = client(url)

    with {:ok, %Tesla.Env{status: 200, body: body}} <- Tesla.get(client, path, query: query_params) do
      {:ok, body}
    else
      {:ok, %Tesla.Env{status: status, body: body}} ->
        {:error, "API Error: Status #{status} - #{inspect(body)}"}
      {:error, reason} ->
        {:error, "HTTP Client Error: #{inspect(reason)}"}
    end
  end
end
