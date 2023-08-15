-- items: 69973, 69974
local event_starter;
local following=false
local arrived=false;

function event_say(e)
	if(e.other:HasItem(69956)) then
		if(e.message:findi("hail")) then
			if arrived then
				e.self:Say("At last I am free again! Thank you so much for saving me from the horrors of this vile place. You have my gratitude. I can find my way out from here friend. Here take this [" .. eq.say_link("note") .. "] back to my brother. It should explain what good deed you have done for me today.");
			else
				e.self:Say("Uuugh. . .");
			end
		elseif(e.message:findi("note") and arrived) then
			e.self:Say("Ok, here's the note for you. Thank you again!");
			e.other:SummonItem(69973); --Note from Pashia
			eq.depop_with_timer();
		elseif(e.message:findi("duram wants you to come home") and not following) then
			e.self:Say("Duram sent you? Unbelievable. Before I go anywhere, I need my sword back, it was taken from me earlier. That beast in there took it and knocked me down. . .he thought I was dead because I didn't move. Defeat him and bring me back my sword and I will leave with you.");
			eq.spawn2(316075, 0, 0,-1919,-756.75,-309.8,248); --#Diad_the_Devourer (316075)
		elseif(e.message:findi("follow") and e.other:GetID()==event_starter:GetID()) then
			e.self:Say("Ok, let's get out of here!");
			eq.follow(event_starter:GetID());
			eq.set_timer("check_dist",1000);
			e.self:SetSpecialAbility(19, 0);
			e.self:SetSpecialAbility(20, 0);
			e.self:SetSpecialAbility(24, 0);
			arrived=false;
			following=true;
			eq.set_timer("depop",30*60*1000); --30min
			eq.debug("following: " .. event_starter:GetName());
			--she should complain all the time?
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:HasItem(69956)) then
		if(item_lib.check_turn_in(e.trade, {item1 = 69974})) then --Pashia's Sword
			e.self:Say("My sword, you have brought it back to me. Thank you " .. e.other:GetName() .. ", you truly are heroic. Now, let us get out of here. I will [" .. eq.say_link("follow") .. "] you when you are ready.");
			event_starter=eq.get_entity_list():GetClientByID(e.other:GetID());
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if e.timer=="check_dist" then
		eq.debug("dist to goal: " .. e.self:CalculateDistance(-135.5, -5682.7, -306.1));
		if (e.self:CalculateDistance(-135.5, -5682.7, -306.1) <=50) then
			eq.stop_follow();
			arrived=true;
			following=false;
			eq.stop_timer("check_dist");
			eq.debug("arrived");
			e.self:MoveTo(e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading(),true);
		end
		--dont let wise guys coh/bard to zone in
		if (e.self:CalculateDistance(event_starter:GetX(),event_starter:GetY(),event_starter:GetZ()) >200) then		
			following=false;
			eq.stop_follow();
			eq.debug("stop follow: " .. event_starter:GetName());
			e.self:MoveTo(e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading(),true);
		elseif (e.self:CalculateDistance(event_starter:GetX(),event_starter:GetY(),event_starter:GetZ()) <=200 and not arrived) then
			following=true;
			eq.follow(event_starter:GetID());
			eq.debug("following: " .. event_starter:GetName());
		end
	elseif e.timer=="depop" then
		eq.depop_with_timer();
	end
end
