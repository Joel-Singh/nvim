---@diagnostic disable-next-line: unused-local
local ls = require 'luasnip'

---@diagnostic disable-next-line: unused-local
local s = ls.snippet

---@diagnostic disable-next-line: unused-local
local sn = ls.snippet_node

---@diagnostic disable-next-line: unused-local
local isn = ls.indent_snippet_node

---@diagnostic disable-next-line: unused-local
local t = ls.text_node

---@diagnostic disable-next-line: unused-local
local i = ls.insert_node

---@diagnostic disable-next-line: unused-local
local f = ls.function_node

---@diagnostic disable-next-line: unused-local
local c = ls.choice_node

---@diagnostic disable-next-line: unused-local
local d = ls.dynamic_node

---@diagnostic disable-next-line: unused-local
local r = ls.restore_node

---@diagnostic disable-next-line: unused-local
local events = require 'luasnip.util.events'

---@diagnostic disable-next-line: unused-local
local ai = require 'luasnip.nodes.absolute_indexer'

---@diagnostic disable-next-line: unused-local
local extras = require 'luasnip.extras'

---@diagnostic disable-next-line: unused-local
local l = extras.lambda

---@diagnostic disable-next-line: unused-local
local rep = extras.rep

---@diagnostic disable-next-line: unused-local
local p = extras.partial

---@diagnostic disable-next-line: unused-local
local m = extras.match

---@diagnostic disable-next-line: unused-local
local n = extras.nonempty

---@diagnostic disable-next-line: unused-local
local dl = extras.dynamic_lambda

---@diagnostic disable-next-line: unused-local
local fmt = require('luasnip.extras.fmt').fmt

---@diagnostic disable-next-line: unused-local
local fmta = require('luasnip.extras.fmt').fmta

---@diagnostic disable-next-line: unused-local
local conds = require 'luasnip.extras.expand_conditions'

---@diagnostic disable-next-line: unused-local
local postfix = require('luasnip.extras.postfix').postfix

---@diagnostic disable-next-line: unused-local
local types = require 'luasnip.util.types'

---@diagnostic disable-next-line: unused-local
local parse = require('luasnip.util.parser').parse_snippet

---@diagnostic disable-next-line: unused-local
local ms = ls.multi_snippet

return {
  s({ trig = 'mm', snippetType = 'autosnippet', wordTrig = true }, fmta([[$<>$]], { i(1) })),
  s({ trig = 'MM', snippetType = 'autosnippet', wordTrig = true }, fmta([[$ <> $]], { i(1) })),
  s({ trig = 'vvv', snippetType = 'autosnippet', wordTrig = true }, fmta([[chevron.l <> chevron.r]], { i(1) })),
  s(
    { trig = 'rrr', snippetType = 'autosnippet', wordTrig = true },
    fmta(
      [=[#rect[
  <>
]]=],
      { i(1) }
    )
  ),
  s(
    { trig = 'general-template' },
    fmta(
      [[
#import "/templates/general-template.typ": *

#show: general.with(
  title: "<>",
  preamble: [<>],
  class: "<>",
)
  ]],
      { i(1), i(2), i(3) }
    )
  ),
  s(
    { trig = 'transaction' },
    fmta(
      [[
Transaction(
  "<>",
  "<>",
  "<>",
  [<>],
  ed("<> <> <>"),
),
  ]],
      { i(1, 'kind'), i(2, 'cost'), i(3, 'name'), i(4, 'description'), i(5, 'MMM'), i(6, 'DD'), i(7, 'YYYY') }
    )
  ),
}
