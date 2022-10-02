defmodule CounterWeb.PageLiveTest do
  use CounterWeb.ConnCase
  import Phoenix.LiveViewTest

  # test "disconnected and connected render", %{conn: conn} do
  #   {:ok, page_live, disconnected_html} = live(conn, "/")
  #   assert disconnected_html =~ "0"
  #   assert render(page_live) =~ "0"
  # end

  test "increment event and decrement", %{conn: conn} do
    {:ok, page_live, _html} = live(conn, "/")
    assert render_click(page_live, :add, %{}) =~ "1"
    assert render_click(page_live, :add, %{}) =~ "2"
    assert render_click(page_live, :add, %{}) =~ "3"
    assert render_click(page_live, :sub, %{}) =~ "2"
    assert render_click(page_live, :sub, %{}) =~ "1"
    assert render_click(page_live, :sub, %{}) =~ "0"
  end

  test "reset event", %{conn: conn} do
    {:ok, page_live, _html} = live(conn, "/")
    assert render_click(page_live, :add, %{}) =~ "1"
    assert render_click(page_live, :reset, %{}) =~ "0"
  end
end
