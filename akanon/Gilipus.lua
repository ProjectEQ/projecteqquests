-- Nioti's Predicament

function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("I had a wrench around here somewhere.");
    elseif e.message:findi("predicament") then
        e.self:Say("Well simply put, we are overwhelmed with repairs. While we made it safely to the shores of the new continent, we suffered some damage to the ship. To make matters worse, we are running out of supplies to complete the needed repairs and I don't have time to return to the mainland to find more. I sure could use some [assistance]. I knew we should have never come here.");
    elseif e.message:findi("assistance") then
        e.self:Say("Well I cannot really believe someone would want to help me, but if you really could help, that would be great. I would need you to find four Branches of Sylvan Oak and return them to me. If you do this for me, I will find some way to reward you for your efforts.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if item_lib.check_turn_in(e.trade, {item1 = 55557, item2 = 55561}) then -- Note to Gilipus, Worker's Badge - Number two
        e.self:Say("Yes, what is it? Just a moment, I cannot read without my glasses.");
        e.self:Emote("rummages through his numerous pockets looking for his reading glasses. 'Oh this is most embarrassing. Seems I have lost my reading glasses. Oh wait, I know where they are. They are on this bench here.' Just as Gilipus reaches for his glasses, a small mechanical rat snatches them and hurriedly scuttles away. 'Oh drat. This isn't good at all. That defective cleaner just took my reading glasses! Think you could go get them? What defective cleaner you ask? I don't know for certain. I couldn't make out the serial number. If you can find my glasses, I will read this note you brought me.");
		e.other:QuestReward(e.self,0,0,0,0,55562,70000); -- Worker's Badge - Number three
    elseif item_lib.check_turn_in(e.trade, {item1 = 55555, item2 = 55562}) then -- Gilipus's Reading Glasses, Worker's Badge - Number three
        e.self:Say("Thank you. That is much better.' Gilipus begins to read the note. 'You need something to remove rust? Yes, I do believe I have just the thing for you. Just bring me some rubbing alcohol and I can make what you need. Now where are my tools?");
        e.other:QuestReward(e.self,0,0,0,0,55563,80000); -- Worker's badge - number four
    elseif item_lib.check_turn_in(e.trade, {item1 = 12418, item2 = 55563}) then -- Rubbing Alcohol, Worker's badge - number four
        e.self:Say("Hello what can I do for you? Oh yes, you needed something to remove rust. This rubbing alcohol should help you. Good thing you thought to bring it.' Gilipus begins to mix some different chemicals together in a small vial. 'Here you go. This should work. I think. By the way, have you seen a small notebook? It was green with a picture of a lovely cog on it.");
        e.other:QuestReward(e.self,0,0,0,0,55564,90000); -- Worker's badge - number five
        e.other:SummonItem(55556); --Vial of Anti-Rusting Agent
    end
    item_lib.return_items(e.self, e.other, e.trade);
end