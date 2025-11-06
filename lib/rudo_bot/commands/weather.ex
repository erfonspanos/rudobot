defmodule RudoBot.Commands.Weather do
  alias RudoBot.HttpClient

  @base_url "https://wttr.in"

  def run(city) do
    query_params = [format: "j1"]

    case HttpClient.get(@base_url, "/#{city}", query_params) do
      {:ok, %{"current_condition" => [%{"FeelsLikeC" => temp, "weatherDesc" => [%{"value" => desc}]}]}} ->
        "Weather in **#{city}**: #{temp}°C, #{desc}"

      {:error, _reason} ->
        "Não foi possível consultar o clima para '#{city}'."
    end
  end
end
