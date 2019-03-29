defmodule DiscussWeb.TopicController do
	use DiscussWeb, :controller

	alias Discuss.Topics
	alias Discuss.Topics.Topic

	def index(conn, _params) do
		topics = Topics.list_topics()
		render(conn, "index.html", topics: topics)
	end

	def new(conn, _params) do
		changeset = Topics.change_topics(%Topic{})
		render(conn, "new.html", changeset: changeset)
	end

	def create(conn, %{"topic" => topic_params}) do
		case Topics.create_topic(topic_params) do
      {:ok, topic} ->
        conn
        |> put_flash(:info, "Topic created successfully.")
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
	end

	def edit(conn, %{"id" => id}) do
		topic = Topics.get_topic!(id)
		changeset = Topics.change_topics(topic)
		render(conn, "edit.html", topic: topic, changeset: changeset)
	end
end