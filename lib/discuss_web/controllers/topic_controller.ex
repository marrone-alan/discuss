defmodule DiscussWeb.TopicController do
	use DiscussWeb, :controller

	alias Discuss.Topics
  alias Discuss.Topics.Topic

	def new(conn, _params) do
		changeset = Topics.change_topics(%Topic{})
		render(conn, "new.html", changeset: changeset)
	end
end