--[[

##Color Reference guide##
<c \"#83f07a\"> Light Green
<c \"#F07F00\"> Dark Orange

--]]


function event_say(e)
  if e.message:findi("hail") then
    eq.popup("Hotbars & Hotkeys", "<br><c \"#CCFF99\">Hotbars</c> are the primary tools for playing EverQuest. You use the <c \"#CCFF99\">Hotkeys</c> assigned to activate different types of abilities, alternate advancement abilities, and custom and pre-defined actions. <br><br><c \"#F07F00\">Click 'OK' to learn managing your Hotbars.</c>", 6);
    e.self:QuestSay(e.other, "Most important part of battle is preparation! Ya gonna get killed out there if ya don't. Dat's the first thing ya need to learn. I can shows you.");
    eq.task_selector({8804}); -- Task: Hotbars
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade);
end
