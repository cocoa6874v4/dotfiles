local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  -- if __name__ == "__main__":
  s("ifmain", {
    t({ "if __name__ == \"__main__\":", "\t" }),
    i(1, "pass"),
  }),

  -- if
  s("if", {
    t("if "),
    i(1, "condition"),
    t({ ":", "\t" }),
    i(2, "pass"),
  }),

  -- elif
  s("elif", {
    t("elif "),
    i(1, "condition"),
    t({ ":", "\t" }),
    i(2, "pass"),
  }),

  -- else
  s("else", {
    t({ "else:", "\t" }),
    i(1, "pass"),
  }),

  -- for x in y:
  s("for", {
    t("for "),
    i(1, "x"),
    t(" in "),
    i(2, "iterable"),
    t({ ":", "\t" }),
    i(3, "pass"),
  }),

  -- while
  s("while", {
    t("while "),
    i(1, "condition"),
    t({ ":", "\t" }),
    i(2, "pass"),
  }),

  -- def
  s("def", {
    t("def "),
    i(1, "func_name"),
    t("("),
    i(2, "args"),
    t({ "):", "\t" }),
    i(3, "pass"),
  }),

  -- class with __init__
  s("class", {
    t("class "),
    i(1, "ClassName"),
    t({ ":", "\tdef __init__(self, " }),
    i(2, "args"),
    t({ "):", "\t\t" }),
    i(3, "pass"),
  }),

  -- from X import Y
  s("fromim", {
    t("from "),
    i(1, "module"),
    t(" import "),
    i(2, "name"),
  }),

  -- try / except
  s("try", {
    t({ "try:", "\t" }),
    i(1, "pass"),
    t({ "", "except " }),
    i(2, "Exception"),
    t({ " as e:", "\t" }),
    i(3, "pass"),
  }),

  -- with open(...) as f:
  s("with", {
    t("with open("),
    i(1, "filepath"),
    t(", \"r\") as "),
    i(2, "f"),
    t({ ":", "\t" }),
    i(3, "pass"),
  }),

}
