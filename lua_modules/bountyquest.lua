local bountyquest = {}

function bountyquest.do_dialog(e)
    local mob_class = e.self:GetClass();
    
    if (mob_class == 28) then rogue_dialog(e)
    end
end

function rogue_dialog(e)
    if (e.message:findi("guild business")) then
        e.self:Say("Hello, adventurer. If you are interested in becoming a member of the guild, you must first [" .. eq.say_link("how do i prove myself?",false,"prove yourself") .. "].")
    end
end

return bountyquest;