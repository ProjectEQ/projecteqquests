-- items: 62629
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["ranger_epic"] == "5") then
		e.self:Say("Hello. I can tell that you are a great hunter and tracker. I wanted to pass on to you some information, act on it as you will. A group of adventurers stopped in here a while ago. They said that they had information about a particular member of the Muramite army, some general or something, that had enslaved some elemental spirits. They went looking for him but haven't returned. I would appreciate any information you can find out about them. For now I am going to have to assume that they have all been killed.");
		eq.set_global("ranger_epic","6",5,"F");
	else
		e.self:Emote("stands at attention. 'Greetings, ".. e.other:GetName() .. ".  You planning on heading to the Queen of Thorns?  The boat you need to catch arrives at the docks.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);			
	if(qglobals["ranger_epic"] == "6" and item_lib.check_turn_in(e.trade, {item1 = 62629})) then  
		e.self:Say("Ah, well, this is unfortunate. I shall inform their families. On their behalf I thank you for your efforts and for discovering their fate, however unpleasant.");
		eq.set_global("ranger_epic","7",5,"F");
		e.other:Message(15,"You feel words forming in your mind. They come from the Heartwood Blade. 'I sense it now, the one that put Siflu under the control of that Muramite is the same one that destroyed my body. It is too powerful for me to defeat if we encounter it directly. You will need to create a device that can harness and control the power of the elements. This will be difficult because I do not know exactly what you need. I can describe their function. You will need a container. It must be open to the elements but still hold the items you will put inside. You will be able to use that loadstone to focus the power on the right target, since it was made by the one we seek. Those horrible manacles will also serve to contain the energy and focus it. Then you will need a powerful segment of each element. You can use Earthcaller and Swiftwind to represent the spirit of Earth and Air, but you will need such a thing for Fire and Water as well. Without this item I will not be able to free any spirit directly under his control.");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
