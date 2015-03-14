local chrono = 13906;
local diamond = 13907;
local ebon = 13904;
local library = 13905;
local chronorReturned = 0;
local diamondReturned = 0;
local ebanReturned = 0;
local libraryReturned = 0;
local illusionResponse = 0;

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, mighty adventurer! I am Guard Cheslin Sydwend and I am here to serve and protect. Feel safe when we Qeynos guards are on watch. We are the best!");
	elseif(e.message:findi("father sent me")) then
		e.self:Say("My father has no need to worry and I do not need a baby sitter. I may be in training still, but a Qeynos guard in training is still a formidable opponent. EVIL, BEWARE!!   HAIL ANTONIUS BAYLE! ");
	elseif(e.message:findi("donate")) then
		e.self:Say("Of course I shall donate to that esteemed order. Here you are, my good friend. Now run along before you are injured by some nasty creature. By the way, you should speak with my fellow guard, Leopold. He also would donate.");
		e.other:SummonItem(13295);
	elseif(e.message:findi("illusion")) then
		if(illusionResponse == 0) then
			e.self:Say("Yes!! I seem to have dropped some of my [Illusion] cards.");
			illusionResponse = 1;
		else
			e.self:Say("h!! Do you play Illusion, too? I love that game. I have some very rare cards in my deck. I seem to have dropped four of them somewhere during my last patrol. Darn it! They probably blew away the minute I dropped them! I will never find those cards again.");
			illusionResponse = 0;
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local correcthandin = 0;
	local wowwie = e.self:Say("Wow!! I thought I lost this for good. All together I lost the [illusion] cards: Ebon Lotus, Library of Erudin, Chrono Cyclone and Diamond Vale. Man!! Those are rare cards!");
	if(item_lib.check_turn_in(e.trade, {item1 = chrono})) then
		chronoReturned = 1;
		correctHandin = 1;
		thought = wowwie;
	end	
	if(item_lib.check_turn_in(e.trade, {item1 = diamond})) then
		diamondReturned = 1;
		correctHandin = 1;
		thought = wowwie;
	end
	if(item_lib.check_turn_in(e.trade, {item1 = ebon})) then
		ebonReturned = 1;
		correctHandin = 1;
		thought = wowwie;
	end
	if(item_lib.check_turn_in(e.trade, {item1 = library})) then
		libraryReturned = 1;
		correctHandin = 1;
		thought = wowwie;
	end
	if(chronoReturned == 1 and diamondReturned == 1 and ebonReturned == 1 and libraryReturned == 1) then
		e.self:Say("Oh great! I have all my cards back. Here is a little something for assisting a Qeynos guard. And any time you are in trouble, just call on Cheslin, master swordsman. Take it to my father, Master Chesgard of the Knights of Thunder in Qeynos. No doubt he sent you to follow me on my watch.");
		e.other:Ding();
		e.other:SummonItem(18839);
		e.other:Faction(135,5,0); -- Guards of Qeynos
		e.other:Faction(9,5,0); -- Antonius Bayle
		e.other:Faction(53,-10,0); -- Corrupt Qeynos Guards
		e.other:Faction(33,-10,0); -- Circle of Unseen Hands
		e.other:Faction(217,5,0); -- Merchants of Qeynos
		e.other:AddEXP(1500);
		e.other:GiveCash(8,11,2,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	if(e.wp == 1) then
		e.self:Say("Hail, fellow guards! I am off to protect the travelers of the hills from evil. I shall return!");
		eq.signal(4142,1);
		eq.signal(4069,1);
	elseif(e.wp == 3) then
		e.self:Say("Fear not, simple travelers. Cheslin the masterful is here to protect you.");
		eq.create_ground_object(library,xloc,yloc,zloc,0,300000);
		e.self:Say("Hey! Did I just drop something?");
	elseif(e.wp == 4) then
		e.self:Say("Fear not, simple travelers. Cheslin the masterful is here to protect you.");
		eq.create_ground_object(ebon,xloc,yloc,zloc,0,300000);
		e.self:Say("Hey! Did I just drop something?");
	elseif(e.wp == 7) then
		e.self:Say("Fear not, simple travelers. Cheslin the masterful is here to protect you.");
		eq.create_ground_object(diamond,xloc,yloc,zloc,0,300000);
		e.self:Say("Hey! Did I just drop something?");
	elseif(e.wp == 9) then
		e.self:Say("Fear not, simple travelers. Cheslin the masterful is here to protect you.");
		eq.create_ground_object(chrono,xloc,yloc,zloc,0,300000);
		e.self:Say("Hey! Did I just drop something?");
	elseif(e.wp == 11) then
		e.self:Say("I lost some of my [illusion] playing cards. And they were the rare ones too! Darn it! If anyone finds them, please return them to me.");
	end
end

