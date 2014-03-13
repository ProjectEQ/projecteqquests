-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Eh!!? What do I see before me? A young upstart? Some child pretending to be a great mind? If you wish to test your mettle then you will assist Tergon. Will you [Help Tergon] or are you far [too superior] to deal with such things?");
	elseif(e.message:findi("help tergon")) then
		e.self:Say("No!! You will help yourself. Your task shall find your skills tested. Succeed and knowledge is yours. Fail and death shall embrace you. Go to the Steamfont Mountains and seek out a troll named Bugglegupp. As a youngster I once tried to attack the beast with a device of mine. It sent an Iron Pellet deep into the beasts head. Kill Bugglegupp and return the Iron Pellet. I hope the Pellet does not get lost in the battle.");
	elseif(e.message:findi("too superior")) then
		e.self:Say("Well excuse me!! your majesty. Please forgive my arrogance. Now get out of here, before you stink this place up with that rotting grape you call a brain!");
	elseif(e.message:findi("further tasks")) then
		e.self:Say("Not all experience is gained upon the battlefield. We magicians must heighten our minds to become formidable opponents. I see much promise in you, " .. e.other:GetName() .. ". I will require you to [travel abroad] toward Freeport.");
	elseif(e.message:findi("travel abroad")) then
		e.self:Say("You will go to Freeport and seek out the Academy of Arcane Science. There you shall find my brother Retlon. He has scribed some new spells in my [personal spellbook]. Hand him this note as proof of your alliance. He works closely with Master Dooly Jonkers.");
		e.other:SummonItem(1717);
		e.other:Ding();
	elseif(e.message:findi("defector")) then
		e.self:Say("It seems a gnome magician by the name of Toko Binlittle has gone and left the guild. He joined forces with the [Pirates of Gunthak]. Find him. He must be destroyed. Our secrets cannot be known. Return his head to me and I shall give you the [Elemental Grimoire].");
	elseif(e.message:findi("pirates of gunthak")) then
		e.self:Say("From what I know, the Pirates of Gunthak are from the southern Gulf of Gunthak. It seems as though a small band of them has been operating within the Ocean of Tears, leagues from their own territory.");
	elseif(e.message:findi("elemental grimoire")) then
		e.self:Say("The Elemental Grimoire contains the knowledge which will advance your techniques in research. With it you shall learn to research spells and scribe them for your own spellbook.");
	elseif(e.message:findi("personal spellbook")) then
		e.self:Say("MISSING TEXT, NEEDED FROM LIVE"); -- Need text from live
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13333})) then
		e.self:Say("So, you have survived. There is no doubt in my mind that you achieved this solely with your own powers. Only a dim one requires the assistance of others. Take this. May it help you in your pursuit of greatness. [Further tasks] may bring you to that point.");
		e.other:SummonItem(15058);
		e.other:SummonItem(eq.ChooseRandom(15400,15397,15399,15398,15317,15058));
		e.other:Faction(91,3,0);
		e.other:Faction(71,-3,0);
		e.other:Faction(322,-3,0);
		e.other:Faction(115,3,0);
		e.other:Faction(176,3,0);
		e.other:Ding();
		e.other:AddEXP(150);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13387})) then
		e.self:Say("Thank you " .. e.other:GetName() .. ". I had no doubt you would fulfill my will and return my spellbook.. here is your reward for such effort. Now I have news of a larger matter. It has to do with a [defector].");
		e.other:Faction(91,3,0);
		e.other:Faction(71,-3,0);
		e.other:Faction(322,-3,0);
		e.other:Faction(115,3,0);
		e.other:Faction(176,3,0);
		e.other:Ding();
		e.other:AddEXP(150);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13388})) then
		e.self:Say("Excellent work, " .. e.other:GetName() .. ". It's unfortunate this had to be done, but we cannot allow our secrets to fall into the hands of others.");
		e.other:SummonItem(17502); -- elemental grimoire
		e.other:Faction(91,3,0);
		e.other:Faction(71,-3,0);
		e.other:Faction(322,-3,0);
		e.other:Faction(115,3,0);
		e.other:Faction(176,3,0);
		e.other:Ding();
		e.other:AddEXP(300);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
