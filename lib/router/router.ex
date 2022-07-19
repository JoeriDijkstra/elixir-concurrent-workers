defmodule Router.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/get-logs" do
    {:ok, body, _conn} = Plug.Conn.read_body(conn)
    {:ok, decoded_body} = Jason.decode(body)

    try do
      response = GenServer.cast(:scheduler, {:add, decoded_body})
      case response do
        {:error, message} -> raise message
        res -> send_resp(conn, 200, res)
      end
    rescue
      e in RuntimeError -> send_resp(conn, 200, "Error occured: " <> e.message)
    end
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
