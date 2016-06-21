--fungusgrove/Lupot_Nukla.lua NPCID 157117
--Shaman Epic 1.5 and 2.0
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("elder spirit sent me") and qglobals["shaman_epic"] == "1") then
		e.self:Say("Shhh! You'll scare them away, fool! Darnit! Do you have any idea at all how rare this fungus is? Any idea at all?");
	elseif(e.message:findi("idea") and qglobals["shaman_epic"] == "1") then
		e.self:Say("No kidding. The way you ran up here like a herd of elephants was a dead giveaway. You make enough noise and this fungus disappears into thin air and then I have to wait for it to show itself again. Odd plant really, but very reactive, so keep it down. The spirit must have two pieces of this fungus for its potion and it only grows here. I'd like to see you prove your ability. If by a miracle you should collect two, come and speak to me.");
		--not a triggered spawn anymore	
	elseif(e.message:findi("hail") and qglobals["shaman_epic"] == "1" and e.other:HasItem(57620)) then
		e.self:Say("Surprising. Didn't think you'd be up to the task and be able to muster the knowledge to figure it out. If you have both with you, hurry along. The spirit is in great need of the potion.");		
	elseif(e.message:findi("hail") and qglobals["shaman_epic"] == "7") then
		e.self:Say("Welcome back. I received word that you were ready to continue the journey. Word travels fast when we have brave spirits like you on our side. As we proceed, our tasks become more difficult. We feel you are ready to take on the charge of aiding the spirits we've lost. We must recover some items that were [taken by force].");
	elseif(e.message:findi("taken by force") and qglobals["shaman_epic"] == "7") then
		e.self:Say("Over in Taelosia, the peaceful folk there found themselves overcome by the Muramites. They had stolen much of what had meaning to them. If you can track down Undari Perunea she can tell you how to find a sacred necklace of perseverance that was created by her own people, though Norrath's spirits did charm it. You will find Undari near the temples, hiding, and waiting for you. Return the talisman to me.");
	elseif(e.message:findi("protected") and qglobals["shaman_epic"] == "8") then
		e.self:Say("When Undari was a young, peaceful Taelosian, she chose to defy the trusik -- the religious fanatics -- who called for the hurt and torture of her people. You see, once, all Taelosians lived in Nihilia, but something changed. One sly and corrupt Taelosian found a path to power and preached about a false god. He convinced many to follow him and they became the [trusik] who worshipped Trushar, an ocean god. They would torture those who didn't believe as they did.");
	elseif(e.message:findi("trusik") and qglobals["shaman_epic"] == "8") then
		e.self:Say("The trusik were eventually forced into exile in the temples of the highest mountains. The Taelosians who resisted the beliefs and rhetoric of the trusik became known as the nihil -- and Undari was one of them. She believed in nature, the ebb and flow of a greater consciousness, and that if she kept her hopes high, she would overcome the horror of the zealots. And she [prevailed].");
	elseif(e.message:findi("prevailed") and qglobals["shaman_epic"] == "8") then
		e.self:Say("Undari's unwavering regard and respect for nature gained the attention of the spirit world, particularly that of the Spirit of Perseverance. The spirit would watch over her and time after time would [see] her bring more of her kind into spiritual awareness.");
	elseif(e.message:findi("see") and qglobals["shaman_epic"] == "8") then
		e.self:Say("The spirit saw that Undari always wore a beautiful necklace made of polished stone that her mother gave her. Her mother was taken by the trusik long ago because she refused to accept Trushar into her heart. She was taken down to the shores of Natimbi and shackled, sentenced to hang over the sea until she died. It was then that the spirit chose to bestow a [great gift] on Undari, as thanks and reward for her steadfast faith in the spirit world.");
	elseif(e.message:findi("great gift") and qglobals["shaman_epic"] == "8") then
		e.self:Say("'The spirit appeared before Undari, who was overcome with humility. The spirit cast a mighty spell and it rained upon Undari and was imbued into her necklace. The necklace would henceforth protect the young Undari from those who held dark beliefs and would try to corrupt her mind. Now you see why we had need of this necklace. But we are not done yet. We still need to make a [talisman].");
	elseif(e.message:findi("talisman") and qglobals["shaman_epic"] == "8") then
		e.self:Say("Yes, we need to complete a talisman to perform the Ruchu and it is up to us to finish this part of the task. We need a particular type of wood and it is rather unusual. You shall only find this material in an ethereal plane where the woods are imbued with spirits. I am counting on you to hunt down a sample of this wood and show it to me when you've acquired it.");
		
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 57401}) and qglobals["shaman_epic"] == "7") then --hand in Necklace of Perseverance (looted from Ikaav Spiritstealer in KT)
		e.self:Say("You have traveled far, my friend. This necklace is more powerful than those foolish Muramites knew. Undari has been holding a key to the spirit world around her neck for many years. How do you think she remained [protected] near those temples and beasts?");
		eq.set_global("shaman_epic","8",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 57401}) and qglobals["shaman_epic"] == "8") then -- hand in Piece of Moaning Timber (looted from a Darkened Chanting Woodspirit in Plane of Storms)
		e.self:Say("You have done well," .. e.other:GetName() .. ". We are drawing nearer to being fully prepared for the Ruchu. I've put the bark and the necklace into this satchel that is protected by a spell. The only one who may open it is the Spirit of Enlightenment. Go and give that to it.");
		e.other:SummonItem(57551); --Impervious Medicine Bag
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	