-- items: 8720, 8732
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail traveler. may I assist you with something. or are you just passing through?");
	elseif(e.message:findi("passing through")) then
		e.self:Say("Very well friend. please take care when passing beyond the river to the east.  Several researchers and their mercenary escort passed through our camp en route to the temple.  That was last week and they have yet to return.  We are holding off on our expedition until we can learn more about what happened to them."); 
	elseif(e.message:findi("temple")) then
		e.self:Say("The temple of the lizardmen. The lost temple of Cazic-thule. It's just to the east of here.. across the river.");
	elseif(e.message:findi("expedition")) then
		e.self:Say("Several weeks ago, I received the news from M'lady Morkul that the Academy was researching this temple. It had been years since I last visited this site, so naturally I was interested. Of course, that was before we set camp in this accursed place. I must be honest; I was quite ready to leave after our first night here.");
	elseif(e.message:findi("night")) then
		e.self:Say("After securing the site, we set sentinels to alert us to any patrols or prying jungle eyes. Unfortunately, our magic did little to provide us with a night's rest that eve. The incessant sound of drums and the screams from within the temple had little regard for our lack of rest and already nervous disposition. Several times during the course of my slumber that night, I was taunted by foul visions of an unnatural sort.");
	elseif(e.message:findi("visions")) then
		e.self:Say("My mind was filled with images of grotesque rituals. The lizards that inhabit that place were gathered around magical portals, chanting in a tongue too wretched to recall. As they spoke and danced, the denizens of some horrid void were pouring from the shimmering rifts! I awoke to find the others in the same state of horror! When I gathered my senses, I noticed that all of our equipment has been covered in some sort of black ooze, though our sentinels displayed no signs of having been triggered.");
	elseif(e.message:findi("ooze")) then
		e.self:Say("I really cannot recall much about the ooze. We have noticed that our memories seem to be affected by this place as well. I know that the ooze was present when we awoke, but it seemed to have been absorbed into the ground. It moved on its own volition. That is all that I can recall.");
	elseif(e.message:findi("happened")) then
		e.self:Say("There was a story that floated about when I was a student. In summary, there was a tome of similar nature to the Phobonomicon. An ambitious mage recovered the tome from the possession of several faceless creatures in the Abysmal Sea. This mage reportedly went quite insane. The story claims that his last act of madness was to cast the tome into a living rift of matter. The rift then opened and released a creature of an unspeakable nature. This cured the mage of his problems... for good. That is why you should return all items of that sort to me.");
	elseif(e.message:findi("phobonomicon")) then
		e.self:Say("A Phobonomicon, book of fear, is rumored to be creatable through the use of rituals and tools too disturbing to describe. Once the ritual or process is complete, the book will begin to take on its own... life, for lack of a better word. The book of fear is capable of unthinkable magic. Watch yourself, should you stumble into such a tome.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 8720})) then
		e.self:Say("Thank You. This is most interesting. I must study it immediatly"); -- text made up
		e.other:SummonItem(8732); -- Item: Medallion of the Arcane Scientists
		e.other:Ding();
		e.other:AddEXP(100000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:feerrott  ID:47132 -- Aqaar_Aluram