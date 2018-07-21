local function lockouts(e)
    local lockouts = require("lockouts_def");
    local instance_requests = require("instance_requests");
    lockout_globals = lockouts.Lockout_Globals();
    instance_requests.DisplayLockouts(e.self, e.self, lockout_globals)
end

return lockouts;