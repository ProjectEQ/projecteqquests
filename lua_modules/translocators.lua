local helper = {}

function helper.hail_text(e, zone, location)
    if e.message:findi('hail') then
        e.self:Say("Greetings ".. e.other:GetCleanName() ..", I am ".. e.self:GetCleanName() ..". I have been sent here by the Gnomish Academy of Science to assist you in traveling the oceans of norrath. If you would like to [" ..eq.say_link("Travel to " .. zone .." ") .."] please let me know.");
    elseif e.message:findi("Travel to ".. zone) then
        e.self:Say("Beaming you up!");
        e.other:MovePC(location.zone, location.x, location.y, location.z, location.heading);
    end
end

return helper;
