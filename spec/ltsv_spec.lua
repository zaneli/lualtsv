require("busted")
require("ltsv")

describe("ltsv.parse", function()
  it("parse log string", function()
    expected = { host = "127.0.0.1", ident = "-", user = "frank", time = "[10/Oct/2000:13:55:36 -0700]", req = "GET /apache_pb.gif HTTP/1.0", status = "200", size = "2326", referer = "http://www.example.com/start.html", ua = "Mozilla/4.08 [en] (Win98; I ;Nav)" }
    actual = ltsv.parse("host:127.0.0.1\tident:-\tuser:frank\ttime:[10/Oct/2000:13:55:36 -0700]\treq:GET /apache_pb.gif HTTP/1.0\tstatus:200\tsize:2326\treferer:http://www.example.com/start.html\tua:Mozilla/4.08 [en] (Win98; I ;Nav)")
    assert.are.same(expected, actual)
  end)
  it("parse including colon value", function()
    expected = { n1 = "v11:v12:v13", n2 = "v21", n3 = "v31:v32" }
    actual = ltsv.parse("n1:v11:v12:v13\tn2:v21\tn3:v31:v32")
    assert.are.same(expected, actual)
  end)
end)

describe("ltsv.load", function()
  it("parse log file", function()
    expected = { { host = "127.0.0.1", ident = "-", user = "frank", time = "[10/Oct/2000:13:55:36 -0700]", req = "GET /apache_pb.gif HTTP/1.0", status = "200", size = "2326", referer = "http://www.example.com/start.html", ua = "Mozilla/4.08 [en] (Win98; I ;Nav)" } }
    actual = ltsv.load("spec/log.ltsv")
    assert.are.same(expected, actual)
  end)
  it("parse logs file", function()
    expected = { { host = "127.0.0.1", ident = "-", user = "frank", time = "[10/Oct/2000:13:55:36 -0700]", req = "GET /apache_pb.gif HTTP/1.0", status = "200", size = "2326", referer = "http://www.example.com/start.html", ua = "Mozilla/4.08 [en] (Win98; I ;Nav)" }, { n1 = "v11:v12:v13", n2 = "v21", n3 = "v31:v32" } }
    actual = ltsv.load("spec/logs.ltsv")
    assert.are.same(expected, actual)
  end)
end)

describe("ltsv.dump", function()
  it("dump log table", function()
    expected = "referer:http://www.example.com/start.html\tident:-\tuser:frank\thost:127.0.0.1\ttime:[10/Oct/2000:13:55:36 -0700]\tstatus:200\tsize:2326\tua:Mozilla/4.08 [en] (Win98; I ;Nav)\treq:GET /apache_pb.gif HTTP/1.0"
    actual = ltsv.dump({ host = "127.0.0.1", ident = "-", user = "frank", time = "[10/Oct/2000:13:55:36 -0700]", req = "GET /apache_pb.gif HTTP/1.0", status = "200", size = "2326", referer = "http://www.example.com/start.html", ua = "Mozilla/4.08 [en] (Win98; I ;Nav)" })
    assert.are.same(expected, actual)
  end)
  it("dump including colon value", function()
    expected = "n1:v11:v12:v13\tn2:v21\tn3:v31:v32"
    actual = ltsv.dump({ n1 = "v11:v12:v13", n2 = "v21", n3 = "v31:v32" })
    assert.are.same(expected, actual)
  end)
end)
