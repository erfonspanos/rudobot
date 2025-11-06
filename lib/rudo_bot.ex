defmodule RudoBot do
  use Nostrum.Consumer
  alias Nostrum.Api
  alias RudoBot.Commands.{Chuck, Pokemon, Weather, Convert, Translate}

  @impl Nostrum.Consumer
  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    if msg.author.bot, do: :ignore, else: handle_command(msg)
  end

  defp handle_command(msg) do
    parts = String.split(msg.content, " ", trim: true)

    case parts do
      ["!ping"] ->
        Api.create_message(msg.channel_id, "Pong!")

      ["!chuck"] ->
        Api.create_message(msg.channel_id, Chuck.run())

      ["!pokemon", name] ->
        Api.create_message(msg.channel_id, Pokemon.run(name))

      ["!weather", city] ->
        Api.create_message(msg.channel_id, Weather.run(city))

      ["!convert", amount, from, to] ->
        Api.create_message(msg.channel_id, Convert.run(amount, from, to))

      ["!translate", from, to | text_parts] ->
        text = Enum.join(text_parts, " ")
        Api.create_message(msg.channel_id, Translate.run(from, to, text))

      _ ->
        :ignore
    end
  end
end
