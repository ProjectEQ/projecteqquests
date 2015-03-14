function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. I am Rashinda Elore. The city Landholder Manager. If you have business to discuss. please direct it to my two clerks downstairs. Good day.");
	elseif(e.message:findi("blades")) then
		e.self:Say("'Zimel's Blades? It used to be a fine place of rare weaponry. [Ariska Zimel] was the owner. No one knows what happened to the man. He just vanished overnight. His shop used to be in East Freeport which is now a slum, er, I mean, which now has plenty of available lots for sale with plenty of potential. As for Zimel's Blades, we [condemned] it.");
	elseif(e.message:findi("ariska zimel")) then
		e.self:Say("Ariska Zimel was a human blacksmith, a master when it came to making swords, I hear. He kept to himself a lot. He disappeared about one year ago. A lot of people were disappointed when we had to condemn Zimel's Blades. All the merchandise was handed over to Groflah Steadirt. Mostly charred junk.");
	elseif(e.message:findi("groflah steadirt")) then
		e.self:Say("Groflah Steadirt is the dwarven owner of Groflah's Forge which is right near here. He was Ariska Zimel's best friend. They were apparently avid travelers before settling down here in Freeport. I guess it was during their travels that they picked up the fine arts of the forge. You should talk to Groflah about Zimel. He can tell you more than I can.");
	elseif(e.message:findi("condemned")) then
		e.self:Say("About a week after Ariska Zimel's disappearance, strange noises were heard from his shop. Loud booms and rumbling as though the earth itself were exploding. When the militia got to the shop, they said the shop was badly burned by an exploding boiler. They had us condemn the building due to its unsafe structure");
	end
end