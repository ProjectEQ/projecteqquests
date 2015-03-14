function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Ironforge's.  We are the makers of all things fine. Would you care to view my wares, or have you come to learn the fine art of crafting [Antonian Weapons]?");
	elseif(e.message:findi("Antonian Weapons")) then
		e.self:Say("I teach the process of crafting [Antonian javelins] and [Antonian long swords], weapons of superb craftsmanship used by the greatest knights and the personal guards of Antonius Bayle! You'll find nothing like them in all of Norrath since they can only be forged here in Qeynos at the Royal Qeynos forge.");
	elseif(e.message:findi("Antonian javelins")) then
		e.self:Say("The Antonian javelin is crafted from a medium quality sheet of metal, a flask of water, and a javelin mold. They are light and precise, perfect for use in battle or in competitions of skill.");
	elseif(e.message:findi("Antonian long swords")) then
		e.self:Say("Your standard Antonian long sword is crafted from a folded sheet of metal, a long blade mold, a hilt mold, pommel mold, and a flask of water. The finest of the Antonian long swords are crafted from an enchanted folded sheet of metal, long blade mold, hilt mold, pommel mold, royal temper and either a ruby or an emerald forged into the weapon at the time of its creation.");
	end
end
