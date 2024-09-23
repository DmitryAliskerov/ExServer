defmodule Web.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "I'm alive!")
  end

  match _ do
    send_resp(conn, 404, "This is not the page you're looking for.")
  end

end
