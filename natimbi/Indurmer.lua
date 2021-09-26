
function event_say(e)
	if(e.message:findi("hail")) then
    e.self:Emote("holds an index finger to his pursed transparent lips.");
    e.self:Say("Shhh! Be as quiet as you can. I'm trying to avoid the Legion of Mata Muram. They'll surely kill us if they find we're here.");
  elseif(e.message:findi("dead")) then
    e.self:Emote("is aghast with disbelief.");
    e.self:Say("No, that can't be...I'm not...Dead. You're lying! You're a filthy boldfaced liar!");
    
    e.self:SetSpecialAbility(35, 0); --turn off immunity
    e.self:SetSpecialAbility(24, 0); --turn off anti aggro

    e.self:AddToHateList(e.other,1);
   end
end
