-- Converted to .lua by Speedz
-- added saylink by robregen

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Me says hi to you.  What you want from me?  Oh!!  Me shaman trainer.  You must be shaman.  Are you [" .. eq.say_link("shaman Darkone",false,"shaman Darkone") .. "]?");
	elseif(e.message:findi("shaman darkone")) then
		e.self:Say("You choose rite if you bes a shaman.  Wes da best.  You remember ta not get in Kaglari way.  He get mad berry easy.  He gets berry mad at Urako if he finds out me make [" .. eq.say_link("big mistake",false,"big mistake") .. "].");
	elseif(e.message:findi("big mistake")) then
		e.self:Say("Kaglari makes Urako cleans his kwarters.  He says nots to open closet.  Me make mistake and opens his closet and out comes da skeletons.  Dey runs out into Grobb.  Me needs ta gets dem back before Kaglari finds out.  Me needs sumwun to [" .. eq.say_link("collect Kaglari skeletons",false,"collect Kaglari skeletons") .. "].");
	elseif(e.message:findi("collect kaglari skeletons")) then
		e.self:Say("Tank you!!  Dere is fours of dem.  You can finds dem here in Grobb.  I no tink dey will want to come homes to Kaglari's closet.  You ask dem to [" .. eq.say_link("come back to the closet",false,"come back to the closet") .. "] and see whut dey say.  If you gets dem back me promise to gives you a [" .. eq.say_link("Kaglari mana doll",false,"Kaglari mana doll") .. "].");
	elseif(e.message:findi("kaglari mana doll")) then
		e.self:Say("Kaglari catch many humans.  He pull spirit from dem and force into dolls.  Now deir spirit give shaman extra mana.  Dey good power source.  Now humans good for someting.  Da mana dolls only for shaman power.");
	end
end
