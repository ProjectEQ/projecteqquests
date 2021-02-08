-- items: 17937, 13921, 13873, 13868
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. "!  To enter these grounds is to proclaim your faith in the Truthbringer.  In this city you shall find no greater allies than the Knights of Truth.  We urge all knights and clerics who oppose the hand of the Freeport Militia to [join the crusade].");
	elseif(e.message:findi("join the crusade")) then
		e.self:Say("Then take arms against the Freeport Militia!  They serve no one save Sir Lucan, the fallen knight.  From this day forth, I put a bounty upon all militia members.  For every bashed milita helm, a reward!!  If you are not prepared to battle the militia just yet, you may [assist in other areas].");
	elseif(e.message:findi("assist in other areas")) then
		e.self:Say("I have need of one such as you.  I have been awaiting a message. I will need a young acolyte to [retrieve the message] for me or there are also some [fishing duties] I wish to delegate.");
	elseif(e.message:findi("retrieve the message")) then
		e.self:Say("Thank you, " .. e.other:GetName() .. ". Venture to the Commonlands.  There, by a lake, will be a courier from the great city of Qeynos.  Tell him you are from the Hall of Truth.  He will have a message for you to deliver to Eestyana Naestra.");
	elseif(e.message:findi("fishing duties")) then
		e.self:Say("I have been creating shields for the crusade.  Right now I work on the sharkskin shield for the knights.  I require two shark skins. Unfortunately, most sharks are too dangerous for the squires.  I have begun using [reef shark] skins.  Will you hunt the [reef sharks]?");
	elseif(e.message:findi("reef shark")) then
		e.self:Say("Reef sharks are the smallest and most docile of the sharks.  Even a young acolyte can slay one.  I have heard there are some in the Ocean of Tears.  I need a young acolyte to [hunt] reef sharks.  I require their skins.");
		e.other:SummonItem(17937); -- Item: Empty Shark Sack
	elseif(e.message:findi("hunt")) then
		e.self:Say("I thought I spied the shoulders of a swimmer upon you! Take this large sack. Travel to the Ocean of Tears. There are numerous reef sharks there. I shall require no fewer than two shark skins. When the full sack is combined and returned to me, I shall reward you.");
	end
 end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13921})) then
		e.self:Say("Fantastic work, my young knight.  Here is a small token of the my appreciation.  I would offer you a sharkskin shield, but I have made only a few and the paladins are testing them.");
		e.other:Faction(281,10,0); -- knights of truth
		e.other:Faction(362,10,0); -- priests of marr
		e.other:Faction(311,10,0); -- steel warriors
		e.other:Faction(271,-30,0); -- dismal rage
		e.other:Faction(330,-30,0); -- freeport militia
		e.other:AddEXP(1000);
		e.other:GiveCash(0,0,0,3);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13873})) then
		e.self:Say("Thanks for the hard work, here is a shield to help you in your duties.");
		e.other:SummonItem(13868); -- Item: Sharkskin Shield
		e.other:Faction(281,10,0); -- knights of truth
		e.other:Faction(362,10,0); -- priests of marr
		e.other:Faction(311,10,0); -- steel warriors
		e.other:Faction(271,-30,0); -- dismal rage
		e.other:Faction(330,-30,0); -- freeport militia
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportn  ID:8073 -- Theron_Rolius
