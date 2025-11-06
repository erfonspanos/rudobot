defmodule RudoBot.Commands.Pokemon do
  alias RudoBot.HttpClient

  @base_url "https://pokeapi.co"

  def run(name) do
    name_low = String.downcase(name)

    case HttpClient.get(@base_url, "/api/v2/pokemon/#{name_low}") do
      {:ok, %{"name" => name, "id" => id, "types" => types}} ->
        type_names = Enum.map(types, &(&1["type"]["name"])) |> Enum.join(", ")
        "**#{String.capitalize(name)}** (ID: #{id}) \nType(s): #{type_names}"

      {:error, _reason} ->
        "Pokémon '#{name}' não encontrado."
    end
  end
end
