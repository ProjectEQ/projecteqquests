-- items: 17859, 10908, 66175, 17869
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You have heard of the strange stones being recovered from ancient dungeons? It is true. Powerful stones of unknown origins have been discovered as of late in the newly discovered dungeons. I see you wield a warrior's most prized honor. Congratulations on your acquiring such a fine weapon. It holds great power. I worry however if you were to try to augment your new weapon with one of these new stones. I have done some research and it seems the Red Scabbard used to combine and uncombined your weapon, could potentially harm any augmentation you might add. However with the help of Wenden here, we have been able to successfully forge all three versions of your weapon! The scabbard no longer works with them, but we have achieved some nice results by adding various augmentations to them. We could perhaps craft you a new set of weapons if you are [interested].");
	elseif(e.message:findi("interested")) then
		e.self:Emote("pulls out a shining smithy's hammer. 'Hand me your Red Scabbard and your Jagged Blade of War. I will supply the rest of the metal since you helped out Kargek with the note from his brother and the gift you gave to him.'");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 17859,item2 = 10908})) then -- Red Scabbard (Old), Jagged Blade of War (Old)
		e.self:Emote("begins to furiously work the metal. Sparks fly and a faint magical aura seems to surround the immediate area. 'Ah, a fine job! Your new weapons, "..e.other:GetName().."! Good luck on your travels and if you find any of the augmentation stones, you can now use them to make these fine weapons ever finer!'");
		e.other:SummonItem(66175); -- Jagged Blade of War (New)
		e.other:SummonItem(17869); -- Red Scabbard (New)
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end