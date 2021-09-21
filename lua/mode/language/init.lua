local vue = require('mode.language.vue')
local c = require('mode.language.c')
local css = require('mode.language.css')
local html = require('mode.language.html')
local emmet = require('mode.language.emmet')
local go = require('mode.language.go')
local haskell = require('mode.language.haskell')
local omnisharp = require('mode.language.omnisharp')
local java = require('mode.language.java')
local php = require('mode.language.php')
local rust = require('mode.language.rust')
local angular = require('mode.language.angular')
local lua = require('mode.language.lua')
local flutter = require('mode.language.flutter')
local ts = require('mode.language.ts')
local fsharp = require('mode.language.fsharp')
local json = require('mode.language.json')
local tailwind = require('mode.language.tailwind')
local M = {
  angular,
  rust,
  php,
  java,
  omnisharp,
  haskell,
  go,
  emmet,
  html,
  css,
  c,
  vue,
  lua,
  flutter,
  ts,
  fsharp,
  json,
  tailwind,
}
return M
