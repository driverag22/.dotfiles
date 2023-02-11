-- Necessary abbreviations
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- Some LaTeX-specific conditional expansion functions
local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function()  -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

-- For visual snippets
local get_visual = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else  -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
    
s({trig = "mm", snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "$<>$",
        {
            d(1, get_visual),
        }
    )
),

s({trig = 'ee', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "e^{<>}",
        {
            i(1)
        }
    ),
    {condition = tex_utils.in_mathzone}
),

s({trig = 'ff', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\frac{<>}{<>}",
        {
            i(1),
            i(2)
        }
    ),
    {condition = tex_utils.in_mathzone}
),

s({trig = 'ii', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\int^{<>}_{<>}",
        {
            i(1),
            i(2)
        }
    ),
    {condition = tex_utils.in_mathzone}
),

s({trig = 'pp', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\prod^{<>}_{<>}",
        {
            i(1),
            i(2)
        }
    ),
    {condition = tex_utils.in_mathzone}
),

s({trig = 'ss', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\sum^{<>}_{<>}",
        {
            i(1),
            i(2)
        }
    ),
    {condition = tex_utils.in_mathzone}
),

s({trig = 'exx', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\expec{<>}",
        {
            i(1),
        }
    ),
    {condition = tex_utils.in_mathzone}
),

s({trig = 'var', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\var{<>}",
        {
            i(1),
        }
    ),
    {condition = tex_utils.in_mathzone}
),

s({trig = 'app', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\approx",
        {}
    ),
    {condition = tex_utils.in_mathzone}
),

s({trig = 'xtt', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\texttt{<>}",
        {
            i(1)
        }
    ),
    {condition = tex_utils.in_mathzone}
),

}
