-- items: 11304
function event_trade(e)
   local item_lib = require("items");
   if item_lib.check_turn_in(e.trade, {item1 = 11304}) then -- Vial of Elemental Binding
      e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
           e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
      e.self:AddToHateList(e.other,1);
	  e.other:SummonItem(11304); -- Vial of Elemental Binding
   end
   item_lib.return_items(e.self, e.other, e.trade)
end
