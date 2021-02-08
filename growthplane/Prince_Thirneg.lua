function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Salutations! I am the Prince of the Tunarean Court! What brings you to this most sacred of all Tunares blessed creations?");
	elseif(e.message:findi("lady gelistial")) then
		e.self:Say("Gelistial is a very wise Lady. She does well in her duties to the court as well as the duties to her people. Unfortunately the weight of her responsibility prevents us from meeting as often as I would like.");
	elseif(e.message:findi("lithiniath")) then
		e.self:Say("Ahh..Lithiniath, the first of the black unicorns, cursed by Fizzlethorpe Bristlebane to spread madness and delusions. Lithiniath is not evil, but his lawful magical nature has been replaced with a chaotic reflection of it that has twisted his mind. Lithiniaths physical form can not survive the removal of the chaotic magical nature. The only cure for Lithiniath is death and rebirth into a lawful vessel.");
	elseif(e.message:findi("phat lewt")) then
		e.self:CastSpell(982,e.other:GetID(),0,1); -- Spell: Cazic Touch
		e.self:Say("'You shall find no 'phat lewtz' here! Your selfishness shall be your downfall!");
	end
end
