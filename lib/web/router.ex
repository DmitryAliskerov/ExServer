defmodule Web.Router do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "I'm alive!")
  end

  get "/input" do
    conn = Plug.Conn.fetch_query_params(conn)
    params = conn.query_params
    code = params["code"]
    path = System.get_env("CODE_FILE_PATH")
    {:ok, file} = File.open(path, [:write])
    IO.write(file, code)
    File.close(file)
    send_resp(conn, 200, "Code: #{code} wrted to: #{path}")
  end

  match _ do
    send_resp(conn, 404, "This is not the page you're looking for.")
  end

end
