defmodule HelperWorker.HelperWorkerServer do
  use GenServer

  def init(state) do
    IO.inspect(state)
    {:ok, state}
  end

  def handle_call(:view, _, state) do
    {:reply, state, state}
  end

  def handle_call(:make_request, _, state) do
    try do
      case HTTPoison.get("https://jsonplaceholder.typicode.com/posts/") do
        {:ok, %{status_code: 200, body: body}} -> {:reply, body, state}
        {:ok, %{status_code: status}} -> {:reply, {:error, "Could not contact external API (Status code: #{status})"}, state}
      end
    rescue
      e in RuntimeError -> {:reply, {:error, e.message}, state}
    end
  end
end
