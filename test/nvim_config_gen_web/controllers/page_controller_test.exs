defmodule NvimConfigGenWeb.PageControllerTest do
  use NvimConfigGenWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
  end

  test "GET /download", %{conn: conn} do
    conn = get(conn, ~p"/download")
    assert text_response(conn, 200) =~ "bingo"
  end
end
