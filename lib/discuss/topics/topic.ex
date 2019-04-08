defmodule Discuss.Topics.Topic do
    use Ecto.Schema
    import Ecto.Changeset
  
    schema "topics" do
      field :title, :string
      belongs_to :user, Discuss.Topics.User
    end
  
    @doc false
    def changeset(struct, params \\ %{}) do
      struct
      |> cast(params, [:title])
      |> validate_required([:title])
    end
  end
  