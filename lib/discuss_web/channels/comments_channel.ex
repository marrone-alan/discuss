defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  alias Discuss.Topics
	alias Discuss.Topics.Topic

  def join("comments:" <> topic_id, _params, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Topics.get_topic!(topic_id)

    {:ok, %{}, assign(socket, :topic, topic)}
  end

  def handle_in(name, %{"content" => content}, socket) do
    topic = socket.assigns.topic

    case Topics.add_comment(topic, content) do
      {:ok, comment} ->
        {:reply, :ok, socket}
      {:error, reason} ->
        {:reply, {:error, %{errors: reason}}, socket}
    end
  end
end