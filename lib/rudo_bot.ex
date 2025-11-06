defmodule RudoBot do

  use Nostrum.Consumer
  alias Nostrum.Api

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    case msg.content do
      "!ping" ->
        Api.create_message(msg.channel_id, "Pong!")
      _ ->
        :ignore
    end
  end

end
