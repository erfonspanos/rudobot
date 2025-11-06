defmodule RudoBot.Commands.Translate do
  alias RudoBot.HttpClient
  @base_url "https://api.mymemory.translated.net"

  def run(from, to, text) do
    query = [q: text, langpair: "#{from}|#{to}"]

    case HttpClient.get(@base_url, "/get", query) do
      {:ok, %{"responseData" => %{"translatedText" => translated}}} ->
        "Traduction (#{from} -> #{to}):\n> #{translated}"
      {:error, reason} ->
        "Erro ao traduzir: #{reason}"
    end
  end
end
