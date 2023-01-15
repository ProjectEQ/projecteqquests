function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail!! Respect all laws in Kelethin and her territory and you shall live a fruitful life.");
	elseif(e.message:findi("quiver of kithicor")) then
		e.self:Say("Ummm.. I have some bad news. I did find it, but a band of brownie outcasts came in the night, took [all of the arrows] from the quiver and ran back to the forest they came from. As if that were not enough, while I was hot on their little heels, the thief [Wiltin Windwalker] came into Kelethin and took the quiver itself. Whew!! What a day!");
	elseif(e.message:findi("the arrows")) then
		e.self:Say("All of the arrows are gone. You must get the arrows of recognition, acknowledgment, defiance, gallantry, bravery and fortitude. Get them from the brownie outcasts and combine them in the quiver.");
	elseif(e.message:findi("wiltin windwalker")) then
		e.self:Say("Wiltin Windwalker!! Traitor he is! He left Kelethin to join the Pirates of Gunthak. I heard news that the Royal Navy of Ak'Anon sank the pirate ship he was on in the Ocean of Tears. What I don't get is where those little gnomes moor their ships. They have no harbor!! But that is another story.");
	end
end
