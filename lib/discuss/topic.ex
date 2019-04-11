defmodule Discuss.Topics do
  import Ecto.Query, warn: false
  alias Discuss.Repo

  alias Discuss.Topics.{Topic, Comment}

  def list_topics do
    Repo.all(Topic)
  end

  def change_topics(%Topic{} = topic) do
    Topic.changeset(topic, %{})
  end

  def create_topic(attrs \\ %{}, conn) do
    conn.assigns.user
    |> Ecto.build_assoc(:topics)
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  def add_comment(topic, content, user_id) do
    topic
    |> Ecto.build_assoc(:comments, user_id: user_id)
    |> Comment.changeset(%{content: content})
    |> Repo.insert()
  end

  def get_topic!(id) do
    Topic 
    |> Repo.get!(id)
    |> Repo.preload(comments: [:user])
  end

  def update_topic(%Topic{} = topic, attrs) do
    topic
    |> Topic.changeset(attrs)
    |> Repo.update()
  end

  def delete_topic(%Topic{} = topic) do
    Repo.delete(topic)
  end

  def check_topic_owner(topic_id, conn) do
    Repo.get(Topic, topic_id).user_id == conn.assigns.user.id
  end

end