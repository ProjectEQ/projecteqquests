-- #Mister_Lockout
-- Used to check instance lockouts until we have expedition system.

function event_say(e)
	local instance_requests = require("instance_requests")
  local lockouts = require("lockouts_def");
  local lockout_globals = lockouts.Lockout_Globals();

	if(e.message:findi("hail")) then
		e.other:Message(257, "Would you like to know your [" .. eq.say_link("Lockouts",false,"Lockouts") .. "] or fix your [" ..eq.say_link('skills', false, 'skills') .. "] ?")
	elseif(e.message:findi("lockouts")) then
		instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)
  elseif(e.message:findi("skills")) then

    -- See the global/global_player.lua for the reference index for these values
    local free_skills =  {0,1,2,3,4,5,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,28,29,30,31,32,33,34,36,37,38,39,41,42,43,44,45,46,47,49,51,52,54,67,70,71,72,73,74,76};

    for k,v in ipairs(free_skills) do
      if ( e.other:MaxSkill(v) > 0 and e.other:GetRawSkill(v) < 1 and e.other:CanHaveSkill(v) ) then 
        e.other:SetSkill(v, 1);
      end
        
    end
	end
end
