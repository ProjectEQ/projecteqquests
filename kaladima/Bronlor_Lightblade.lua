function event_say(e)
	if(e.message:findi("hail")) then
		-- Initiate Symbol of Brell Serilis (Start)
		e.self:Say("Allo dere " .. e.other:GetCleanName() .. ", how does ye fare today? Are ye a [priest] of the great Brell Serilis? If ye are not I mean nothing against yar but I am on a mission to administer guidance to a holy priest of milord Brell Serilis.");
	elseif(e.message:findi("priest")) then
		-- Initiate Symbol of Brell Serilis
		e.self:Say("Well now were talkin " .. e.other:GetCleanName() .. ". I think if ye have been doing well in your training then ye will be ready to assist me in with the problem we been havin with those dern good fer nothin [green rascals].");
	elseif(e.message:findi("green rascals")) then
		-- Initiate Symbol of Brell Serilis
		e.self:Say("Well of course I be talkin bout dose goblins that have tried to storm our front gates fer some time. I reckon dey are up to no good sense I hear dey just be a few from a well trained horde of goblin invaders that are planning an attack me thinks. Will ye [help] us in finding and slaying these goblins?");
	elseif(e.message:findi("help")) then
		-- Initiate Symbol of Brell Serilis
		e.self:Say("Dats great to here " .. e.other:GetCleanName() .. "! To prove to me that you have found and slain these beasts bring four sets of the beads that dey carry around their necks. I dont know much about dem but Id reckon dey have set up camp close by here. The night watch that haulted the first attack by these goblins described the fighting style to be of the highest goblin caliber. I hope this helps, good luck to ye.");
	elseif(e.message:findi("task")) then
		-- Disciple Symbol of Brell Serilis (Start)
		e.self:Say("Ah ye are ready fer yer task are ya " .. e.other:GetCleanName() .. ". I must say dat I am quite impressed with the excellent job dat ya did taking care of those strong goblins. Ok well ye came for yer task so here it tis. I need to get this note to me friend Taldrik, however he has told me that he was heading to the Oasis that is finest in norrath for sum relaxin time. Although I would love to go myself but Im afraid I hab many duties to uphold here. Will you [deliver] my note to Taldrik?");
	elseif(e.message:findi("deliver")) then
		-- Disciple Symbol of Brell Serilis
		e.self:Say("Fantastic " .. e.other:GetCleanName() .. "! I knew that ye would be able to help me. Please take this note to Taldrik, whereber he may be and be sure to give him his favorite [drinks] or he may be very grumpy.");
		-- Summon: a note to Taldrik
		e.other:SummonItem(2429); -- Item: A Note To Taldrik
	elseif(e.message:findi("drinks")) then
		-- Disciple Symbol of Brell Serilis
		e.self:Say("Oh yes of course. Taldriks favorites if I can remembur correctly be Elven wine, Freeport stout, and of course Dwarven ale! Bring these drinks to him with your note and after ye tell him you are sent from muh to continue your training im shure he will warm up to ye fer sure.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- Handin: Enraged Goblin Beads
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2396, item2 = 2396, item3 = 2396, item4 = 2396})) then
		-- Initiate Symbol of Brell Serilis (End)
		e.self:Say("I knew I was able to trust ye to help me rid the land of these nasty goblins! The Bloodforge Brigade salutes ye " .. e.other:GetCleanName() .. ". Ye will be well known in our city for being the young one that helped rid our mountains of these goblins. Please take this as a symbol of your devotion to your faith and your God and return to me when ye are ready for yer next [task].");
		e.other:Faction(227,5);   -- +Clerics of Underfoot
		e.other:Faction(274,5);  -- +Kazon Stormhammer
		e.other:Faction(293,3);  -- +Miners Guild 249
		e.other:QuestReward(e.self,0,0,0,0,1430,25); -- Item: Initiate Symbol of Brell Serilis
		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
