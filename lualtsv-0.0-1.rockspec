package = "lualtsv"
version = "0.0-1"
source = {
    url = "git://github.com/zaneli/lualtsv.git",
    branch = "master",
}
description = {
    summary = "Labeled Tab-separated Values(http://ltsv.org/) parser for Lua",
    homepage = "https://github.com/zaneli/lualtsv",
    license = "MIT <http://opensource.org/licenses/MIT>",
}
dependencies = {
    "lua >= 5.1"
}
build = {
    type = "builtin",
    modules = {
        lualtsv = "src/ltsv.lua"
    }
}
