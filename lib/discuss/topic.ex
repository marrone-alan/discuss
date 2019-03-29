defmodule Discuss.Topics do
  import Ecto.Query, warn: false
  alias Discuss.Repo

  alias Discuss.Topics.Topic

  def list_topics do
    Repo.all(Topic)
  end

  def change_topics(%Topic{} = topic) do
    Topic.changeset(topic, %{})
  end

  def create_topic(attrs \\ %{}) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  def get_topic!(id), do: Repo.get!(Topic, id)

end