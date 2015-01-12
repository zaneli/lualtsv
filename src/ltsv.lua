module("ltsv", package.seeall)

function parse(text)
  local r = {}
  for x in text:gmatch("[^\t]+") do
    k, v = x:match("^([^:]+):(.+)$")
    r[k] = v
  end
  return r
end

function load(file)
  local f = io.input(file)
  local r = {}
  for line in f:lines() do
    r[#r+1] = parse(line)
  end
  f:close()
  return r
end

function dump(ltsv)
  local xs = {}
  for k, v in pairs(ltsv) do
    xs[#xs+1] = k .. ":" .. v
  end
  return table.concat(xs, "\t")
end

return ltsv