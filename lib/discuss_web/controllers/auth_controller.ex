defmodule DiscussWeb.AuthController do
	use DiscussWeb, :controller
  plug Ueberauth

  def callback(conn, params) do
    IO.puts "ma oeeee"
    IO.inspect(conn.assigns)
    IO.puts "ma oeeee"
    IO.inspect(params)
    IO.puts "ma oeeee"
  end
end