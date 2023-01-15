-- items: 1837, 1887
function event_say(e)
	if(e.other:GetFaction(e.self) < 2) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings, young " .. e.other:Race() .. ". Very few of your kind has ever seen the halls you now walk through. You must have provided a great service to our kin for them to allow you passage into this inner sanctum. We welcome you to our ancient home.");
		elseif(e.message:findi("thank you")) then
			e.self:Say("Might, wisdom, and manners? Quite a surprise to see all of these traits in one of the younger races. I am impressed. I see you are a noble creature, one who would treat another creature of nobility with respect... 'Oglard's eyes suddenly begin to shine with a magical golden light. He looks down upon you as if in judgement and asks, 'Tell me, " .. e.other:GetCleanName() .. ", have you done battle with dragons?'");
		elseif(e.message:findi("no I have not")) then
			e.self:Emote("'s eyes begin to flare even brighter, then quickly fade, a frown left upon the wurm's face. He says, 'Hmmm. I see. Thank you for the information, and good luck in your travels.'");
			e.other:Faction(430,-200); -- Faction: Claws of Veeshan
		elseif(e.message:findi("yes I have")) then
			e.self:Emote("'s eyes slowly begin to lose the golden light that flared earlier. He then studies you carefully before saying 'There are many Dragons on this world that do not share our beliefs. If you have done battle with dragons and have lived, then you may be able to help us.");
		elseif(e.message:findi("help")) then
			e.self:Say("When a Dragon dies, his spirit leaves his corporeal body and joins Veeshan among the stars. It is our greatest desire, to be without desire, at the time of our death. Even in preperation for battle, we accept that we may die and strive to be empty of desire so that our spirits do not cling to this world when our end has come. For some, however, this is not the case");
		elseif(e.message:findi("who are the one")) then
			e.self:Say("When a Dragon dies, and his heart is filled with desire, his spirit will remain here in the filth of this world. The greatest torment is to transcend one's body, and still be confined to this world. Like being trapped within a cell with a single locked door, having the key to unlock it and escape, yet having no hands to use the key. This has befallen one of our comrades");
		elseif(e.message:findi("comrade")) then
			e.self:Say("And therein lies our plight. Our fellow Dragon now suffers eternally in unlife, between worlds. We hear his pained howls when we sleep, unable to aid our fallen comrade. He turned his back on us centuries ago, and joined the Ring of Scale. In response to this we erased his name and bloodline, along with the others who left, from our memories and books. He is still Dragon though, and does not deserve the fate he's been dealt. Without his name, we are helpless.");
		elseif(e.message:findi("his name")) then
			e.self:Say("Unfortunately our libraries have no record of him. We know of his death from 2 sources only. Our Lord Yelinak was the first to hear his tormented howling. Then the rest of us slowly began to hear him as well. A chosen few left our home to find his corpse if possible. We were surprised to find he had died here on this continent. Apparently he had returned to us, which pains us even more.");
		elseif(e.message:findi("returned")) then
			e.self:Say("His body was found in the Eastern Wastes, spears of Krom Zek make protruding from his side and chest.' The wurm pauses for a moment to sigh heavily. He continues, sorrow on his voice, 'We believe......we hope, one of the sentient races witnessed his murder. Chances are slim to nil. But perhaps one of those.....Caldoin? Or something? Found him and recorded his name. Will you investigate this for us Keyno ? ");
		elseif(e.message:findi("will investigate")) then
			e.self:Say("We are greatful for your service to us. We know you have little interest in our affairs, yet you risk your life to aid us. Once you find his name, then perhaps we can find a way to release his restless spirit. If you do this, you will be rewarded an item of your choice from our hoard of treasure. Begin with.....whatever they call themselves. The Giants refer to them as iron pellets. Return to me proof of his name and he will be remembered. ");
		end
	else
		e.self:Say("I have nothing to speak about to the likes of you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 1837}, 0)) then -- Onyxbrand
		e.self:Emote("examines the axe closely. The Wurm's eyes widen as he makes out the name of Garzicor and immediately raises his head to the ceiling, letting out a howl of emotional pain. Your bones shake with the screach, an image of a man in the midst of a rain of his own child's blood comes to mind, the agony is so great. Out of breath, Oglard drops his head and focuses his attention back to you, barely able to hold himself up. He places an urn before you and says, 'You must find his corpse. Find his burial site and summon Garzicor's spirit by speaking your remembrance of him. Speak to him and find out all you can. Return to me with 2 pieces of his corpse combined in that urn. Help us " .. e.other:GetCleanName() .. ", you MUST!'");
		e.other:Faction(430,5);  	--CoV
		e.other:Faction(436,1);  	-- Yelinak
		e.other:Faction(448,-2); 	-- Kromzek
		e.other:QuestReward(e.self,0,0,0,0,17050,5000); -- Dragon Craft Urn
	elseif(e.other:GetFaction(e.self) < 2 and item_lib.check_turn_in(e.trade, {item1 = 1887}, 0)) then -- Dragon Craft Urn (1st combined version)
		e.self:Say("Thank you, " .. e.other:GetCleanName() .. ". With this urn, our fears are confirmed. His spirit is split, each striving for its own desire. We've decided what must be done. Your help is key in the success of our plans. If you wish to continue what you have started, please take this urn to Eldriaks Fe`Dhar. He will make known to you our plan.");
		e.other:QuestReward(e.self,0,0,0,0,2053,5000); -- Dragon Craft Urn (2nd combined version)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
