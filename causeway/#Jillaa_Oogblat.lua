-- items: 57012, 57051
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["beast_epic"] == "18" and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(303092)) then
		e.self:Say("Ah, you have the totem. Me call you friend. So friend, we gots big trouble here. Dem bazu are out of control. It not as dough dey weren't tough enough already! Dey gots da wrong spirits running in deir bodies. Dere is no way to calm dem eider. So we are going to have to kill them to get da spirits back. You must do dis. I tink dey know I'm here. Dey close by!");
		eq.spawn2(303092,0,0, 378.32,70.83 ,267.45 ,220 ); --#Bazu_Terror
		eq.spawn2(303093,0,0,410.5,62.8,262,256); --a_bazu_crusher (303093)
		eq.spawn2(303093,0,0,346,70.6,262,156); --a_bazu_crusher (303093)
		eq.spawn2(303093,0,0,361,112.6,262,168); --a_bazu_crusher (303093)
		eq.spawn2(303093,0,0,410,120,262,276); --a_bazu_crusher (303093)
	elseif(e.message:findi("keep") and qglobals["beast_epic"] == "19") then
		e.self:Say("Well, me sense dat dere something bad about dis wand. It not feel as powerful as it should really. Me sure it safe to keep with me. Take da dust back to Muada dough. He want to see dat.");
	end
end	

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["beast_epic"] == "18" and item_lib.check_turn_in(e.trade, {item1 = 57012})) then
		eq.set_global("beast_epic","19",5,"F");
		e.self:Say("Dat must be it! Da creature had da wand dat infected creatures. It must have tried to make an army. We done solved it! Me will wrap it and [" .. eq.say_link("keep") .. "] it until me see Muada soon. Me stay a bit to be sure dat dis not happen again.");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 57051})) then
		e.self:Say("Yes, yes, welcome back. Me so worried. Me gave dat wand to scout, an ogre friend, and now it gone! And so is da scout. Someone told me dey found a tattered tunic dat looked liked da scout may have worn it quite far from here! It covered in strange black hairs and a sharp claw was stuck in it. Me don't want to tink about dat too much. It make me sad. Please go find da scout. And hurry!");
		eq.set_global("beast_epic","20",5,"F");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
