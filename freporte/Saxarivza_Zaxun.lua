-- items: 18148
function event_say(e)
  if (e.other.GetModCharacterFactionLevel(e.other, 340) < -250) then
    eq.reject_say(e);
  elseif(e.message:findi("hail")) then
    e.self:Say("Salutations, " .. e.other:GetName() .. "! I am here as a favor to my brother, High Priest Perrir. We seek loyal followers of Innoruuk to earn their place among the hierarchy of the Spires. Are you [" .. eq.say_link("devoted to Innoruuk",false,"devoted to Innoruuk") .. "]?");
  elseif(e.message:findi("devoted to innoruuk")) then
    e.self:Say("My brother requests your presence in Neriak at the Spires of Innoruuk. Take this note with you. " .. e.other:GetName() .. ". It will inform Perrir of who sent you.");
    e.other:SummonItem(18148); -- Letter of recommendation
  end
end

function eq.reject_say(e)
    local random_result = math.random(4);
    if (random_result == 1) then
        e.self:Say("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.");
    elseif (random_result == 2) then
        e.self:Say("Is that your BREATH, or did something die in here?  Now go away!");
    elseif (random_result == 3) then
        e.self:Say("I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.");
    else
        e.self:Say("Oh look, a talking lump of refuse.  How novel!");
    end
end
