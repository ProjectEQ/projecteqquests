--causeway/Korbuk_Brimblade.lua NPCID 
--Warrior Epic 2.0
function event_spawn(e)
	eq.set_timer("say",1000);
	eq.set_timer("depop",30*60*1000);
end

function event_say(e)
	if(e.message:findi("sword")) then
		e.self:Say("You have lived far too long. I shall end your miserable existence now!");
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:SetSpecialAbility(35, 0);		
		e.self:AddToHateList(e.other);	
	end	
end

function event_death_complete(e)
	eq.spawn2(303129,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Essence of Kreljnok
end

function event_timer(e)
	if e.timer=="say" then
		e.self:Say("At last, you have arrived. I've been waiting. Da time has come and your journey is at its end.You must hand over da sword so dat I may reign over everything in greatness! It is destinedfor me and me alone! No one else shall have it, least of all you! If you[" .. eq.say_link("won't give you da sword",false,"won't give me da sword") .. "], I'll take it from you!");
		eq.stop_timer("say");
	elseif e.timer=="depop" then
		eq.depop();
	end
end
