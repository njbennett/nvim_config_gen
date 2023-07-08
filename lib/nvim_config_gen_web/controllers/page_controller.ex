defmodule NvimConfigGenWeb.PageController do
  use NvimConfigGenWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def download(conn, _params) do
    { :ok, contents } = File.read("./init.lua")
    send_download(conn, {:binary, contents}, filename: "init.lua")
  end
end
