local rest = {}
function rest.request(...)
    http = require("socket.http")
    json = require("lua_modules/lib/json")
    require ("lua_modules/lib/utils")

	local args = {...}
	local reqbody = args[3] or ""
	
	local respbody = {}
	
	local r, err, h, s = http.request {
		method = args[1],
		url = args[2],
		source = ltn12.source.string(reqbody),
		headers = {
			["Content-Type"] = "application/json",
			["Content-Length"] = #reqbody
		},
		sink = ltn12.sink.table(respbody)
	}
	
	if err == 200 then
		err = nil
	end
	return json:decode(table.concat(respbody)), err
end

return rest;