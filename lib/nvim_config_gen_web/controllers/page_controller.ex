defmodule NvimConfigGenWeb.PageController do
  use NvimConfigGenWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def download(conn, _params) do
    send_download(conn, {:binary, contents()}, filename: "init.lua")
  end

  defp contents() do
"""
--- bootstrap plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

--- load plugins
plugins = {
  { 'AlexvZyl/nordic.nvim' }
}
require("lazy").setup(plugins)

--- this stops Nvim from adding a tab
--- when it autoindents a line
--- in addition to the spaces its copying from the above line
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

--- set line numbers for pairing
vim.opt.number = true

--- enable 24-bit RGB colors
vim.opt.termguicolors = true

--- set the colorscheme
vim.cmd("colorscheme nordic")
"""
  end
end
