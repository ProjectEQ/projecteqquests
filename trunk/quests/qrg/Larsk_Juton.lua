-- NPC: Larsk_Juton

function event_say(e)
	if(e.message:findi("hai")) then
		e.self:Say("Hail, Adventurer! I hope you are enjoying your time in Surefall Glade. You must be careful when leaving the Jaggedpine. There have been many report of [Sabertooths] attacking travelers.");
	elseif(e.message:findi("Sabertooths")) then
		e.self:Say("The gnolls of Blackburrow are called Sabertooths. They have been seen in force on a regular basis. They are surely up to something. We have even heard rumors of a [pact] between Qeynos merchants and the dogs.");
	elseif(e.message:findi("pact")) then
		e.self:Say("Sources have come forward to tell of a pact between a merchant of Qeynos and the Sabertooths. It all has to do with blades and brew. We hear that a meeting will occur soon, somewhere in the Qeynos Hills at night. Do not fear, we shall find a brave ranger to [halt this meeting].");
	elseif(e.message:findi("halt this meeting")) then
		e.self:Say("Very good of you. Stop this meeting by killing the gnoll in Qeynos Hills. We hear that he shall be there in the late evening, and that his name is Furgoot or Furgy, something like that. Find him and kill him. I want his head. And if you should find any evidence of who the merchant is, be sure to hand it over to me.");
	elseif(e.message:findi("assist in the extermination of the gnoll brewers")) then
		e.self:Say("Within the bowels of Blackburrow, our scouts have reported seeing the gnoll brewers.  You will go and brave the lair of the dogs and slay these brewers in order to cease the flow of Blackburrow Stout.  During your mission, should you find any Blackburrow casks, you must return them to me.  When you have recovered three of these casks, I shall award you the [Cloak of Jaggedpine].");
	elseif(e.message:findi("Cloak of Jaggedpin")) then
		e.self:Say("The Cloak of Jaggedpine was made for those loyal to the ways of the forest.  It is enchanted to increase one\'s dexterity.  It is awarded to those who have aided in our cause to rid the land of those vile dogs called the Sabertooths.  Should you earn one, be sure to hold onto it - you never know when we may alter the enchantments placed upon the cloak.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13309})) then
		e.self:Say("So, I see you rid the hills of the beast. Good work! I have a reward for you. I hope it will be usefull. I am afraid this gnoll\'s death will not halt the alliance between the two. I shall require your services to [assist in the extermination of the gnoll brewers].");
		e.other:SummonItem(2140);
		e.other:Ding();
		e.other:Faction(265,10,0);
		e.other:Faction(159,10,0);
		e.other:Faction(279,-30,0);
		e.other:Faction(135,10,0);
		e.other:AddEXP(1000);
		e.other:GiveCash(math.random(10),math.random(10),math.random(10),math.random(10));
	elseif(item_lib.check_turn_in(e.trade, {item1 = 17970,item2 = 17970, item3 = 17970})) then
		e.self:Say("Excellent!  Ridding the area of those foul beasts will certainly slow down whatever it is they are planning.  Here is the Cloak of Jaggedpine.  You should keep this, for you never know when we may decide to alter the enchantments on it.");
		e.other:SummonItem(2915);
		e.other:Ding();
		e.other:Faction(265,10,0);
		e.other:Faction(159,10,0);
		e.other:Faction(279,-30,0);
		e.other:Faction(135,10,0);
		e.other:AddEXP(1000);
		e.other:GiveCash(math.random(10),math.random(10),math.random(10),math.random(10));
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18811})) then
		e.self:Say("Fine Work, "..e.other:GetName()..". Hmmm. It seems this needs taking care of. Take this note to the Captain of the City Guard in Qeynos. His name is Captain Tillin. He will have to attend to this matter. Also.. Let me see the gnoll\'s head. I must know you killed him. Be safe, my friend. I am sure that whoever this McNeal is, he was simply a lackey. Whoever he works for is most likely going to be looking for you. Watch your back in Qeynos.");
		e.other:SummonItem(18815);
		e.other:Ding();
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
