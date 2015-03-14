--thurgadina/Petcas_Coldbeard.lua NPCID 115141
--Warrior Prequest
function event_say(e)
	if(e.message:ifind("hail")) then
		e.self:Say("Hail to ye as well offlander. I bid you welcome to the Icy Mug, one o' the finest establishments for a drink in Thurgadin. Whether it's [souvenirs], stories, or that [special brew] yer lookin for, you've come to the right place.");
	elseif(e.message:findi("souvenirs")) then
		e.self:Say("Here at the Icy Mug we have our own signature stein fer yer drinkin pleasure. For only 5 gold pieces ye can take one home to show yer kinfolk.");
	elseif(e.message:findi("special brew")) then
		e.self:Say("Aha, you're looking for something with a kick to it, eh? Well, I'm willing to give some up to you, but it's going to cost you. Give me 350 gold pieces and I might consider parting ways with some.");
	end	
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {gold = 350})) then
		e.self:Say("Here are your special beans. I'm sure you'll enjoy the fine flavor and the delicate aroma that can only be gotten from the depths of Thurgadin. I know one recipe calls to filter three coffee beans to get some normal coffee, then filtering the coffee and those beans to get a wintry treat able to heat just about anyone up.");
		e.other:SummonItem(60290); -- special beans
	elseif(item_lib.check_turn_in(e.trade, {gold = 5})) then
		e.self:Say("Here ya go!");
		e.other:SummonItem(30145); --The Icy Mug Souvenir Stein
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("What's the rush there, youngster?");
		eq.signal(115019,1);
	elseif(e.signal == 2) then
		e.self:Say("That's not good, the Grand Historian's mighty protective of his daughter. What he do after he caught ya?");
		eq.signal(115019,2);
	elseif(e.signal == 3) then
		eq.signal(115019,3);
	elseif(e.signal == 4) then
		e.self:Say("Well, coulda been worse. A month's worth of sermons is a far sight better than a trip to the bottom of the Dain's well.");
		eq.signal(115019,4);
	elseif(e.signal == 5) then
		e.self:Say("Here ya go, Ronodun, on the house this time. Drink fast, don't need the Grand Historian to come lookin' fer ya...");
		eq.signal(115019,5);
	elseif(e.signal == 6) then
		e.self:Say("My pleasure, son. You just remember to keep me in all those prayers you'll be sayin this month. Hahhahah!");
	end	
end	