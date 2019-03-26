defmodule Discuss.Topics do
  import Ecto.Query, warn: false
  alias Discuss.Repo

  alias Discuss.Topics.Topic

  def change_topics(%Topic{} = topic) do
    Topic.changeset(topic, %{})
  end
end