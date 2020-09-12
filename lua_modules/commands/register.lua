local function register(e)
    if e.args[2] == nil then
        e.self:Message(0, "Usage: #register <action> <code>")
        return
    end
    -- eq.debug("sending action: " .. e.args[1] .. ", code: " .. e.args[2])    
    local rest_lib = require("rest");
    local result, err = rest_lib.request("GET", "http://localhost:9933/api/register/confirm?action=" .. e.args[1] .. "&code=" .. e.args[2], "");
    if err then
        e.self:Message(0, "failed to register: " .. err)
        return
    end
    e.self:Message(0, "register: " .. result["message"])
end
return register;