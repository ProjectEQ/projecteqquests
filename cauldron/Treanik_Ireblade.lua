
-- Berserker Epic 1.0

function event_say(e)

	if(e.other:GetClass() == 16 or e.other:GetGM()) then -- Berserker and GM bypass
		if e.other:GetLevel() >= 45 then
				if e.message:findi("beast fights") then
					e.self:Say("Da only way to learn is to fight. It called Praklion of the Cauldron or sometin. Me hear it live here very long time, but rarely come out. It feed at weird times. Course, dat when it most mad. McArik found it traveling through deep craggy lands. Dat is how he decided it was good beast to test his ability to beat a baddy dat had some [sense of strategy]. It even took him long time to defeat it.");
				elseif e.message:findi("strategy") then
					e.self:Say("It do have sense of stragegy. It a creature dat has got smartz wit da magic too. Da way it mixes its abilities is good stuffs. You gots to try to catch it when it eats. It usually comes out when it dark out. And when you kill it, can you get my axe back? Me lost it to dat beast. Plus me needs proof you killed it so me can give you sumtin to give to McArik.");
				end
				--e.self:Say("You berserker, but me have nothing for you!");	
		else
			e.self:Say("Me has nothing to do with you youngling.");
		end
	else
		e.self:Say("You not berserker, so you go away. Me no talk to you!");
	end
end

function event_trade(e)
	local item_lib = require("items");	
	
	if item_lib.check_turn_in(e.trade, {item1 = 60199}) then  -- Item: Note for Treanik
		e.self:Say("Me hopes you can hold your breath, ".. e.other:GetCleanName() ..". Me make sure to stock up before makin' dat long swim. Pesky goblins all over. Treanik must tell dat dere is much more dan pests here to taunt da likes of us. Dere be a beast down dere dat me not killed yet. Me much younger dan you, but me learn how dat [beast fights] -- it smarter dan da average creature, you know. Don't be fooled.");
	elseif item_lib.check_turn_in(e.trade, {item1 = 60200}) then  -- Proper Flag so not to be skipable and Item: Treanik's Tarnished Axe
		e.self:Say("My axe! Me so happy! You are big force to be rekoned with, ".. e.other:GetCleanName() ..". Me wasn't sure... but now, look at you, like spiroc fluffing feathers. McArik be so pleased! Take dis amulet me made. I know not much, but me swore to McArik that anyone who passes dis test would get a trinket from me.");
		e.other:SummonItem(60201); -- Item: Bone Trinket

	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_spawn(e)
	eq.set_timer("timecheck", 30 * 1000);
end

function event_timer(e)
	local zone_time = eq.get_zone_time();

	if(zone_time["zone_hour"] <= 13 or zone_time["zone_hour"] >= 23) then
		--check between 11pm - 1pm

		if (eq.get_spawn_condition("cauldron", 0, 1) == 1) then
			--if spawn condition is already on, do nothing

		else
			eq.spawn_condition("cauldron", 0, 1, 1);
			--set praklion spawn condition to on
		end

	else
		-- if time is between 2pm-10pm turn off spawn condition
		eq.spawn_condition("cauldron", 0, 1, 0);
	end
end
