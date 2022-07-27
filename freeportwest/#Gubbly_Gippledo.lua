-- items: 55030, 55029, 55032, 55031
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. I am afraid I am in no mood to talk right now, friend. I am in a lot of [trouble] right now.");
	elseif(e.message:findi("trouble")) then
		e.self:Say("am afraid there is nothing you can do to help me, but if you really want to know, I will tell you my [story].");
	elseif(e.message:findi("story")) then
		e.self:Say("I was tasked by Shin Master Grubbus of Gukta to travel here to Freeport and receive a gift from the Paladins of Marr. It was a holy ring blessed by Marr and a token of friendship between the Frogloks and the human paladins. It was of course an honor to be selected to perform such a task. I accepted the generous gift and made my way back home to Gukta. As I entered South Ro however that is when things [went terribly wrong].");
	elseif(e.message:findi("went terribly wrong")) then
		e.self:Say("As I entered the desert under the cover of night, a thick mist swirled about me and I could not see but a couple feet in front of me. A horrible hiss broke through the fog and the horrible visage of a ghoul darted towards me. I quickly took up my sword and dispatched the beast with little effort. Then a dreadful moaning from somewhere in the desert started. Soon it was joined by another monstrous moan, then another until I was completely surrounded by the terrible sound. The mist parted and a dark, robed figure appeared. He uttered something and hands began to erupt from the sand. Soon I was surrounded by a host of undead. They clawed and tore at me as I attempted to keep them at bay. The necromancer looked into my eyes and began chanting. His words filled me with dread. I dropped the ring and ran all the way back here. Not once stopping. I am a complete coward. I have let down my people and my God. I am sure I will be exiled for this. I doubt there is anything you can do to [help] me.");
	elseif(e.message:findi("help")) then
		e.self:Say("No disrespect intended towards you friend, but I have little faith you can find the ring. However, if you wish to look for yourself, you may want to go to South Ro and see what you can find. There is also another problem. I remember the undead in the desert tearing out some of the gems as they clawed at me. Perhaps the undead still carry some of the gems. Please see if you can find three missing gems in addition to the ring. They should be easy to identify. They were specially crafted by Gukta's finest jewelers. They are a deep red in color and bear the mark of The Truthbringer. You might want to search South Ro and the Oasis for them. When you have found the ring and the three gems, please hand them to me.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 55030,item2 = 55029})) then
		e.self:Say("Magnificent! You are truly an inspiring individual, "..e.other:GetName().."! Now let me see about getting these gems back in place. I was a jeweler before I became a Paladin of Marr. There we go! It is almost as good as new. The other paladins here and I have been talking about this incident. We have all decided that you should keep the ring as a reward for your dedication to Marr's cause and your bravery. You are now its keeper. If you head back to Gukta, you may want to talk to Bibsy Gakdoo in Gukta. He is a master jeweler and can probably upgrade the ring for you. You might want to wait until you are more powerful however since any components used in the upgrade might be difficult to locate. When you do decide to talk to Bibsy, give him this note. It tells that the ring has been entrusted to you and that he will be compensated by the Shin Knights for upgrading it for you. May Marr bless you. I must be off to pray. Farewell, friend.");
		e.other:SummonItem(55032); -- Item: Marr's Ring
		e.other:SummonItem(55031); -- Item: Note to Bibsy
		e.other:Ding();
		e.other:Faction(1719,2,0); -- Faction: Citizens of Gukta
		e.other:Faction(1718,2,0); -- Faction: Guktan Elders
		e.other:Faction(1716,2,0); -- Faction: High Council of Gukta
		e.other:Faction(1717,2,0); -- Faction: Lorekeepers of Gukta
		e.other:Faction(1709,2,0); -- Faction: Protectors of Gukta
		e.other:AddEXP(4000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
