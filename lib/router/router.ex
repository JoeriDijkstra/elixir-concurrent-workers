defmodule Router.Router do
  use Plug.Router

  alias Router.Pipelines

  plug :match
  plug :dispatch

  post "/get-logs" do
    {:ok, body, _conn} = Plug.Conn.read_body(conn)
    {:ok, decoded_body} = Jason.decode(body)

    try do
      response = Pipelines.get_log_pipeline(decoded_body)
      send_resp(conn, 200, response)
    rescue
      e in RuntimeError -> send_resp(conn, 200, "Error occured: " <> e.message)
    end
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
