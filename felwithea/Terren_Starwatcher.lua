-- items: 17124, 19633, 19634, 19632, 19631, 19636, 19635, 19637, 20280, 20297, 20300, 20271, 20274, 20330
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome friend! Have you come to the Temple of Tunare to give praise or are you a young Cleric seeking [guidance] from your elders?");
	elseif(e.message:findi("further guidance")) then
		e.self:Say("If you are ready to put your life on the line for the citizens of our homeland than hear my words. The Crushbone Clan of Orcs are evil and strong adversaries of we Koada`Dal. Recently an orc scout assaulted a merchant from our city carrying a valuable amulet from the Fier`Dal city of Kelethin. Our seers have divined the name of the orc that is in possession of the amulet. Gurleg Bribgok. Find this despicable creature and return the amulet to me so that I may return it to its proper owner."); 
	elseif(e.message:findi("guidance")) then
		e.self:Say("Tunare shall be pleased to have a new disciple amongst her Koada`Dal children. We Clerics of Tunare offer spiritual guidance to the citizens of Felwithe and when needed aid the Paladins of Tunare and the Keepers of the Art in the defense of our people and forest from those [creatures] that seek to cause us harm. Every young cleric should pursue acquiring a [suit of armor] to protect themselves when aiding those in need outside of the safety of Felwithes walls.");
	elseif(e.message:findi("creatures")) then
		e.self:Say("There are many evil creatures in Norrath. Some are evil by nature. others have chosen evil by their devotion to evil deities. Even the Faydarks are not safe for young Koada`Dal. The orcs of Clan Crushbone seek to expand their territory from their citadel to the north. The brownies viciously guard their hidden communities. pixies play mischievous and sometimes deadly pranks on travelers. and the arboreans have returned to the Faydarks after centuries of slumber."); 
	elseif(e.message:findi("suit of armor")) then
		e.self:Say("You will need this Mail Assembly Kit to craft your Sylvan Initiate Armor. The materials required for the armor vary according to which piece you desire to craft. Once you have been suitably outfitted return to me and I will offer [further guidance]. Do you desire to craft [Sylvan Initiate Gauntlets]. [Sylvan Initiate Boots]. a [Sylvan Initiate Bracer]. a [Sylvan Initiate Helm]. [Sylvan Initiate Greaves]. [Sylvan Initiate Vambraces]. or a [Sylvan Initiate Breastplate]?");
		e.other:SummonItem(17124); -- Item: Mail Assembly Kit
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("To assemble sylvan initiate gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Large Sylvan Bat Fur and two Arborean Sprout Twigs in the Mail Assembly Kit.");
		e.other:SummonItem(19633); -- Item: Crude Gauntlets Mold
	elseif(e.message:findi("boots")) then
		e.self:Say("To assemble sylvan initiate boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Large Sylvan Bat Fur. and two Arborean Sprout Roots in the Mail Assembly Kit.");
		e.other:SummonItem(19634); -- Item: Crude Boot Mold
	elseif(e.message:findi("bracer")) then
		e.self:Say("To assemble a sylvan initiate bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done. combine the Crude Bronze Bracer with a Large Sylvan Bat Fur and an Arborean Sprout Bark in the Mail Assembly Kit.");
		e.other:SummonItem(19632); -- Item: Crude Bracer Mold
	elseif(e.message:findi("helm")) then
		e.self:Say("To assemble a sylvan initiate helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Large Sylvan Bat Fur and an Arborean Sapling Bark in the Mail Assembly Kit.");
		e.other:SummonItem(19631); -- Item: Crude Helm Mold
	elseif(e.message:findi("greaves")) then
		e.self:Say("To assemble sylvan initiate greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Giant Sylvan Bat Furs and two Arborean Sapling Barks in the Mail Assembly Kit.");
		e.other:SummonItem(19636); -- Item: Crude Greaves Mold
	elseif(e.message:findi("vambraces")) then
		e.self:Say("To assemble sylvan initiate vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with a Giant Sylvan Bat Fur and two Arborean Sapling Barks in the Mail Assembly Kit.");
		e.other:SummonItem(19635); -- Item: Crude Vambrace Mold
	elseif(e.message:findi("breastplate")) then
		e.self:Say("To assemble a sylvan initiate breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Giant Sylvan Bat Fur. and two Mature Arborean Barks in the Mail Assembly Kit.");
		e.other:SummonItem(19637); -- Item: Crude Breastplate Mold
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20280})) then
		e.self:Say("You have done well young $name. If you continue to show such devotion to your people and your faith then perhaps one day you will serve in the chambers of King Tearis Thex himself. Take this Rusty Sylvan Morning Star and scrape the rust from it in a forge with a sharpening stone. It may take several attempts if you are unfamiliar with the process. Once that is done bring me the Refined Sylvan Morning Star, a Pristine Drakeling Scales, and an Arborean Amber.");
		e.other:SummonItem(20297); -- Item: Rusty Sylvan Morning Star
		e.other:Ding();
		e.other:Faction(226,10,0); -- Faction: Clerics of Tunare
		e.other:Faction(279,10,0); -- Faction: King Tearis Thex
		e.other:Faction(5001,10,0); -- Faction: Anti-mage
		e.other:AddEXP(36450);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20300,item2 = 20271,item3 = 20274})) then
		e.self:Say("Terren Starwatcher fashions a grip out of the pristine forest drakeling scales, fastens the arborean amber to the pommel, and polishes the head of the morning star with a luminescent substance. 'I grant you a Sylvan Initiate Morning Star. May it serve you well in your service to The All Mother.");
		e.other:SummonItem(20330); -- Item: Sylvan Initiate Morningstar
		e.other:Ding();
		e.other:Faction(226,10,0); -- Faction: Clerics of Tunare
		e.other:Faction(279,10,0); -- Faction: King Tearis Thex
		e.other:Faction(5001,10,0); -- Faction: Anti-mage
		e.other:AddEXP(36450);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:felwithea  ID:61010 -- Terren_Starwatcher
