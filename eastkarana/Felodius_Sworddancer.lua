function event_say(e)
	if(e.message:findi("hai")) then
		e.self:Say(string.format("Hello, %s, I am Felodious Sworddancer. A travelling historian and storyteller. Would you care to hear a [story]?",e.other:GetName()));
	elseif(e.message:findi("story")) then
		e.self:Say("I could treat you to a story about an [ogre] legend! But perhaps you would like to hear a story about the [gnome] that cried kobold?");
	elseif(e.message:findi("gnome")) then
		e.self:Say("Once upon a time, there was a young gnome boy. His job was to repair the clockworks outside Ak'Anon and tell the guards if there was any trouble from kobolds., one day, the boy decided to play a prank on the guards.He decided it would be fun to watch the guards, in full plate armor, run from the gates of Ak'Anon to the valley that led to the Faydark [forest].");
	elseif(e.message:findi("forest")) then
		e.self:Say("The boy cried out as loud as he could, running to the guard. Kobolds! Kobolds! They are dragging off a girl into theforest! The guard sprinted off in the direction of the forest, looking to destroy the kobold menace. The boy jogged after him, laughing the whole time. When the guard arrived there were, of course, no kobolds. He trudged back to Ak'Anon waiting for some [excitement].");
	elseif(e.message:findi("ogre legend")) then
		e.self:Say("Suteng was an ogre champion who walked the land long before the children of Rallos Zek were cursed. He feared no other creation of Zek and the children of the other gods were to be laughed at. It was at this time that Rallos Zek was seeking a warrior to unite all of his armies and lead them to battle against the forces of the other [gods].");
	elseif(e.message:findi("excitement")) then
		e.self:Say("The next day, the boy claimed that kobolds were attacking one of the local farms. The guards all ran to save the farm and of course, no kobolds, and no sign of a battle. Angered by another prank the guards cursed the boy and went back to their stations at the [entrance] to Ak'Anon.");
	elseif(e.message:findi("gods")) then
		e.self:Say("Suteng was a great combatant, however, he was far too cocky to become a suitable leader and this displeased Rallos Zek. One who respected no one could not do this. In order to test Suteng, who had grown far too confident, Rallos had his twin sons  craf ttwo swords to test his great ogre warrior's reaction and resolve Rallos created a great red scabbard to hold the swords as [well].");
	elseif(e.message:findi("wel")) then
		e.self:Say("The swords were like no others. Each one having an ornately crafted hilt shaped like a dragon head. Sparkling diamonds, black sapphires and jacinth covered the handles as well. The razor sharp blades were covered in runes that glowed and [shimmered].");
	elseif(e.message:findi("shimmered")) then
		e.self:Say("Suteng bowed in reverence to his Lord Rallos Zek as he was given the weapons. Rallos warned Suteng that these weapons might destroy him if he were not trulyworthy of leading his armies. Not heading Rallos' warning that the weapons may be too powerful for him to control, Suteng gathered up a raiding party of his finest warriors to seek [battle].");
	elseif(e.message:findi("battle")) then
		e.self:Say("They traveled across the lands in search of a suitable target. Finally they came across a goblin army camped upon the plains. Suteng sounded his battle charge and his band of ogres charged down the hillsideinto the army's [encampment].");
	elseif(e.message:findi("encampment")) then
		e.self:Say("With each swipe of their swords the ancient ogres slew many goblins. Suteng waded through the battle, his new weapons calling out for the blood of more powerful foes. His bloodlust grew with each kill, his blades spurring him onward. Ignoring his own wounds, he fought on until the goblin army was dead or scattered to the [winds].");
	elseif(e.message:findi("winds")) then
		e.self:Say("Only the hulking ogres of old remained standing on the blood-soaked plains. Suteng felt like a god and that would be his downfall.He looked to his companions, the great and powerful ogre warriors with whom he had killed and shed blood. Suteng felt nothing but contempt for them. They, of course, were weaker then, or at least so he [thought].");
	elseif(e.message:findi("thought")) then
		e.self:Say("Without a second thought, Suteng stabbed the ogre nearest to him in the neck with one of the swords. His body moved like a whirlwind of death, slaughtering his own companions. The ogres fought back valiantly, no match for Suteng with his enchanted [blades].");
	elseif(e.message:findi("blades")) then
		e.self:Say("The laughter of Rallos Zek boomed across the plains as the lord of war appeared before Suteng and took the weapons from the ogre's hands. The swords slashed into Suteng swiftly, killing him where he stood. The lord of war spoke to the remaining ogres on the battlefield, explaining why he had [tested] Suteng.");
	elseif(e.message:findi("tested")) then
		e.self:Say("He also told them each that if they wished to wield the weapons, they would have to seek them out for they would be broken into pieces and spread across Norrath. The blades would not be whole again until a suitable warrior found the pieces, and gained the red [scabbard].");
	elseif(e.message:findi("scabbard")) then
		e.self:Say("The lord of war handed the smallest ogre the great red scabbard and told him that it was his charge, and the charge of his family, to test any warrior who wished to have it.");
	elseif(e.message:findi("entrance")) then
		e.self:Say("The following day, the boy was fixing a small clockwork just out of view of the guards. A vicious kobold sprang at him and ripped into him with its big paws. The boy screamed and cried! Kobolds! Kobolds! But the guards did not come, they had grown tired of the boy's pranks the kobolds had a fine meal that night. The end.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- End of File, Zone:eastkarana  NPC:15059 -- Felodius_Sworddancer