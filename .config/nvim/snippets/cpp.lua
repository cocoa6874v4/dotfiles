local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

return {

    -- int main()
    s("main", {
        t({ "#include <iostream>", "\t", "\t" }),
        t({ "int main() {", "\t" }),
        i(1, ""),
        t({ "", "", "\treturn 0;", "}" }),
    }),

    -- for (int i = 0; i < n; i++)
    s("for", {
        t("for (int "),
        i(1, "i"),
        t(" = 0; "),
        rep(1),
        t(" < "),
        i(2, "n"),
        t("; "),
        rep(1),
        t({ "++) {", "\t" }),
        i(3, ""),
        t({ "", "}" }),
    }),

    -- while
    s("while", {
        t("while ("),
        i(1, "condition"),
        t({ ") {", "\t" }),
        i(2, ""),
        t({ "", "}" }),
    }),

    -- do while
    s("dow", {
        t({ "do {", "\t" }),
        i(1, ""),
        t({ "", "} while (" }),
        i(2, "condition"),
        t(");"),
    }),

    -- if
    s("if", {
        t("if ("),
        i(1, "condition"),
        t({ ") {", "\t" }),
        i(2, ""),
        t({ "", "}" }),
    }),

    -- else
    s("else", {
        t({ "else {", "\t" }),
        i(1, ""),
        t({ "", "}" }),
    }),

    -- else if
    s("elseif", {
        t("else if ("),
        i(1, "condition"),
        t({ ") {", "\t" }),
        i(2, ""),
        t({ "", "}" }),
    }),

    -- class
    s("class", {
        t("class "),
        i(1, "ClassName"),
        t({ " {", "public:", "\t" }),
        i(2, ""),
        t({ "", "private:", "\t" }),
        i(3, ""),
        t({ "", "};" }),
    }),

    -- struct
    s("struct", {
        t("struct "),
        i(1, "Name"),
        t({ " {", "\t" }),
        i(2, ""),
        t({ "", "};" }),
    }),

    -- switch
    s("switch", {
        t("switch ("),
        i(1, "expr"),
        t({ ") {", "\tcase " }),
        i(2, "value"),
        t({ ":", "\t\t" }),
        i(3, ""),
        t({ "", "\t\tbreak;", "\tdefault:", "\t\t" }),
        i(4, ""),
        t({ "", "\t\tbreak;", "}" }),
    }),

    -- try catch
    s("try", {
        t({ "try {", "\t" }),
        i(1, ""),
        t({ "", "} catch (...) {", "\t" }),
        i(2, ""),
        t({ "", "}" }),
    }),

    -- cout
    s("cout", {
        t("std::cout << "),
        i(1, ""),
        t(" << \"\\n\";"),
    }),

    -- cin
    s("cin", {
        t("std::cin >> "),
        i(1, "var"),
        t(";"),
    }),

}

