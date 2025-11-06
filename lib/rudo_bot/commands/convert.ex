defmodule RudoBot.Commands.Convert do
  alias RudoBot.HttpClient
  @base_url "https://api.frankfurter.app"

  def run(amount_str, from, to) when is_binary(amount_str) do
    case Float.parse(amount_str) do
      {float, ""} -> do_run(float, amount_str, from, to)
      _ -> "Invalid amount: '#{amount_str}'. Use um número (ex: 10 ou 10.5)."
    end
  end

  defp do_run(amount_float, amount_str, from, to) do
    query = [amount: amount_float, from: String.upcase(from), to: String.upcase(to)]

    case HttpClient.get(@base_url, "/latest", query) do
      {:ok, %{"rates" => %{^to => rate}}} ->
        "#{amount_str} #{String.upcase(from)} = **#{rate} #{String.upcase(to)}**"

      {:ok, %{"message" => message}} ->
        "Erro na conversão: #{message}"

      {:error, reason} ->
        "Erro ao converter: #{reason}. Verifique as moedas: #{from}, #{to}"
    end
  end
end
