defmodule RudoBot.Commands.Chuck do
  alias RudoBot.HttpClient

  @base_url "https://api.chucknorris.io"

  def run do
    case HttpClient.get(@base_url, "/jokes/random") do
      {:ok, %{"value" => joke}} ->
        "#{joke} :face_with_cowboy_hat:"
      {:error, reason} ->
        "Erro ao buscar piada: #{reason}"
    end
  end
end
