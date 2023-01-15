-- items: 18737, 13554, 6701, 18827, 13947
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am Sir Valeron Dushire, leader of the order of the Knights of Truth. If your soul shines with purity and strength, I urge you to join our order. The might of Mithaniel Marr stands behind all who join. Soon that might will help us free this city from the tyranny of the [Freeport Militia].");
	elseif(e.message:findi("freeport militia")) then
		e.self:Say("The Freeport Militia took control of this city long ago. They are nothing more than a group of thugs not worthy of respect. They follow the words of [Sir Lucan] D'Lere. He has been a thorn in this city's side for too long. If you wish to aid us in the fight against tyranny, go speak with Jemoz or Sir Theron. May the Truthbringer shine upon your soul.");
	elseif(e.message:findi("stop sir lucan")) then
		e.self:Say("That would be good, but I doubt you can. We have been trying for years and are unable to get him apart from the militia. If you do the impossible and destroy Sir Lucan, bring me his testimony. Every knight of the Hall of Truth carries a signed testimony. Sir Lucan still holds his.");
	elseif(e.message:findi("sir lucan")) then
		e.self:Say("Lucan is a bad seed. You see, I trained Sir Lucan. He was nothing more than a street rat who was taken in by the Temple of Marr. The priests taught him and found him to be very agile and strong. They requested either the Priests of Marr or the Knights of Truth take him on as a squire. Gygus could not spare the trainers at the time and so we took the boy. The boy became a man, and a very formidable knight. Then something [went awry].");
	elseif(e.message:findi("went awry")) then
		e.self:Say("During one of our crusades into the lands of Norrath, we left Sir Lucan in charge of the remaining knights. He did much good and the people respected him. He was overtaken by power. He soon began to hire mercenaries to guard the city, calling them the Freeport Militia. His true downfall began when he killed Sentry Dillius, a paladin of the Priests of Marr. His divine powers were stripped from his soul. He was a paladin no longer. He and his militia now control the city. They treat it as their playground and bully the populace. Someone must [stop Sir Lucan].");
	elseif(e.message:findi("hero")) then
		e.self:Say("His name has been long lost but his legend lives on in every young knight who aspires to continue his fight. He attempted to quell an evil that resided within Kithicor, perverting nature itself. Much to his relief, it was an earthly foe he fought against and not a denizen summoned from the planes of evil. Then, suddenly, he was surrounded by dozens of dark elves. He was captured and taken to the Dead to be experimented upon and had his soul twisted by vile necromantic magics. Then the Tier'Dal cast his remains to the winds. Where they landed, no one knew, until now. You have found one of his bones. I hereby charge you with a Holy Quest to bring this Hero's bones back for a burial with honors. Do you [accept], knight?");
	elseif(e.message:findi("i accept")) then
		e.self:Say("Good! I knew you would. It is one of the highest honors one can receive. Your quest will not be easy for I know not where his other bones lay. A spy of ours within Neriak was able to surmise that six of his bones along with his sword and shield were scattered throughout Norrath. You must search far and wide to find the remaining pieces, as you already have one.. Do not give up. It is now your sacred duty. Once you have retrieved all eight pieces, come back to me and inform me that you [have all the bones].");
	elseif(e.message:findi("have all the bones")) then
		e.self:Say("Excellent! You are indeed worthy to bear the title of Holy Knight! Now, about the coffin. I have spoken with Ping Fuzzlecutter, outside the western gates. Ask him about the coffin and once it is made, bring it to Simon Aldicott of Marr. I shall have Simon meet you by the lake in the Commonlands after Ping gives you the coffin.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18737})) then --Tattered Note
		e.self:Say("Welcome to the Guild, here's your guild tunic. Now, let's get to work.");
		e.other:SummonItem(13554); --Faded Purple Tunic*
		e.other:Ding();
		e.other:Faction(281,100,0); --Knight of Truth
		e.other:Faction(271,-15,0); --Dimal Rage
		e.other:Faction(330,-15,0); --The Freeport Militia
		e.other:Faction(362,20,0); --Priests of Marr
		e.other:Faction(311,10,0); --Steel Warriors
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 6701})) then --a dusty old leg bone
		e.self:Say("According to this crest on the tunic, you have recovered one of the bones of a lost Paladin [Hero].");
		e.other:SummonItem(6701); -- Item: Dusty Old Leg Bone
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18827})) then --a testimony of truth
		e.self:Say("Praise be to Marr!! You have done the impossible!! Sir Lucan is finally sent to the higher courts of the Tribunal. The city now has a chance to prosper. The Hall of Truth has been redeemed and gives you thanks. Take this, it is the Sword of Faith. May you wield it with righteousness. Beware of the remainder of the militia. They will be hunting for your head.");
		e.other:SummonItem(13947); -- Brilliant Sword of Faith
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF zone: freportn ID: 8077 NPC: Valeron_Dushire
