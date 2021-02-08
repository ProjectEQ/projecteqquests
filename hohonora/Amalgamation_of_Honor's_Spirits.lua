-- items: 28710, 28709, 28724, 28725, 28730, 32064, 32065
function event_spawn(e)
eq.zone_emote(0,"The spirits of Honor's fallen Heroes begin to coalesce in front of you.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("echoes in your mind, 'We are the spirits that reside in these halls. Within us are all the great victories we knew while we still resided in our corporeal forms. We have fought great battles throughout these Planes. You may know the Honor of the battles we have fought. Do you wish to [test your skill in battle]?");
	elseif(e.message:findi("test")) then
    e.self:Emote("echoes in your mind, 'Very well. Our tasks are not simple, not by any means. If you succeed, then you will have proven your Honor. Should you fail, and fall against the Foes of Virtue, perhaps one day your soul will join us in these halls. Come back when you have gathered from a Nightmare Hoof and a lock of Banshee hair from the realm of Nightmares, and from Bertoxxulous' diseased plane, the tattered clothing of a Leperoth as well as the wings of a Malarian.");
  elseif(e.message:findi("continue")) then
    e.self:Emote("echoes in your mind, 'Excellent. Many Eons ago three of our greatest Ducee were sent out to battle. One went to battle the Heroes of Bertoxxulous, one went to fight the Minions of Zek, and one went to wage war in the Realm of Torment. All three Ducee vanished without a trace; their souls never joined the rest of the warriors of Marr so we fear that their spirits may be bound to their battlefields. By returning to us the Symbols worn by the Sergeants of the Ducee we will be able to summon the souls of the fallen here so they may rest with us where they belong.");
  end
end

function event_trade(e)
	local item_lib = require("items");
		
	if(item_lib.check_turn_in(e.trade, {item1 = 28710,item2 = 28709,item3 = 28724,item4 = 28725})) then  -- Lock of Tangled Banshee Hair, Nightmare Hoof, Malarian Wing, Tattered Leperoth Clothing
		-- e.other:SummonItem(??????); need to summon Battlecloak of the Ferocious when item imported
		e.self:Emote("echoes in your mind, 'Well done, you have proven yourself to us. Here is your reward. You may continue our tasks, if you are willing. You have already succeeded where few dare to try, you may [continue your service] to us, if you wish; however do not lose the trinket we gave you, you will need it to proceed.");
	elseif (item_lib.check_turn_in(e.trade, {item1 = 28730,item2 = 32064,item3 = 32065})) then -- Symbol of Ducee Imperon, Symbol of Ducee Cupidon, Symbol of Ducee Fideson
		-- e.other:SummonItem(?????); need to summon Cloak of Ethereal Symbols when item imported
		e.other:Message(15, "A warm breeze blows through your body, and the Amalgam glows in a warm light. The Amalgam echoes in your mind, 'You have done quite well. Their souls are now part of us. We thank you. This is a small token of our gratitude. Wear it with pride as you have earned it. The battle rages on, remember that your Honor is reflected in what you do as well as what you have done. Farewell " .. e.other:GetName() .. ".");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
