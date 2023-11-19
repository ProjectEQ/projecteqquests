-- Nioti's Predicament

function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Yes, what is it? I am a bit occupied right now with quite the [predicament]. I swear things keep getting worse and worse around here.")
    elseif e.message:findi("predicament") then
        e.self:Say("Well simply put, we are overwhelmed with repairs. While we made it safely to the shores of the new continent, we suffered some damage to the ship. To make matters worse, we are running out of supplies to complete the needed repairs and I don't have time to return to the mainland to find more. I sure could use some [assistance]. I knew we should have never come here.");
    elseif e.message:findi("assistance") then
        e.self:Say("Well I cannot really believe someone would want to help me, but if you really could help, that would be great. I would need you to find four Branches of Sylvan Oak and return them to me. If you do this for me, I will find some way to reward you for your efforts.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if item_lib.check_turn_in(e.trade, {item1 = 19140, item2 = 19140, item3 = 19140, item4 = 19140}) then --Branch of Sylvian Oak x4
		e.self:Say("I don't think you would return. I appreciate your assistance. I hate to do this, but before I can convince my foreman to give you a reward, I am going to need to ask you to help me again. According to another adventurer that passed through here the other day, there is a golem graveyard of sorts in a temple somewhere on this continent. If you could find this place and gather one clay golem part that would help us greatly with repairs. Why do we need these golem parts you ask? I have no idea. Grumpy, our foreman said we needed them for some sort of repairs. Oh yeah, take this badge. It identifies you as part of the ship's maintenance crew. Just hand the badge to me when you hand in the golem parts.");
		e.other:QuestReward(e.self,0,0,0,0,55560,50000); -- Worker's Badge - Number one
    elseif item_lib.check_turn_in(e.trade, {item1 = 55566, item2 = 55560}) then -- Clay golem parts, Worker's Badge - Number one
        e.self:Say("Thanks. I hope that wasn't too much trouble. Seems we need more help. Grumby just informed me that some parts on the bridge have already been damaged by rust. That doesnt sound good at all. We will need your help to get some sort of anti rust agent. What? Hey, dont get mad at me. I am sorry I keep asking for help, but I am just following Grumby's orders. There is a gnomish tinker in Ak'anon named Gilipus that might have something to help us. Go there and hand him this note along with your badge so he knows you are working for Grumby. I promise to reward you for your time when you are done helping us. Take your badge back and give it to me again when you hand in the anti-rusting agent.");
        e.other:QuestReward(e.self,0,0,0,0,55561,60000); -- Worker's Badge - Number two
        e.other:SummonItem(55557); --Note to Gilipus
    elseif item_lib.check_turn_in(e.trade, {item1 = 55556, item2 = 55564}) then -- Vial of Anti-Rusting Agent, Worker's badge - number five
        e.self:Say("What took so long? Grumby has been breathing down my neck all day asking for this stuff. I am glad you were able to acquire it. It seems like everything around here is rusting away in this salty air. Your reward? Yes, yes. I will reward you. However it seems we need more help. Grumby has informed me that we need some ore. Think you could go and get some for us? Bring back three blocks of ore and your Worker's Badge.");
        e.other:QuestReward(e.self,0,0,0,0,55565,100000); -- Worker's badge - number six
    elseif item_lib.check_turn_in(e.trade, {item1 = 10503, item2 = 55565}) then -- Block of ore, Worker's badge - number six
        e.self:Say("Not the best quality but this ore should help a lot. Now don't get mad at me, but before we can reward you, Grumby has told me that you will need to go get him some food. He said he wants some Filleted Mammoth. Oh and he also wanted a Jumjum Cake. Bring me those food items along with your worker's badge.");
        e.other:QuestReward(e.self,0,0,0,0,55567,110000); -- Workers Badge - number seven
    elseif item_lib.check_turn_in(e.trade, {item1 = 9654, item2 = 9747, item3 = 55567}) then -- Jumjum Cake, Filleted Mammoth, Workers Badge - number seven
        e.self:Say("Looks like your work here is done. Grumby said I can reward you. Here you go. Thanks again and sorry for all the trouble.");
        e.other:QuestReward(e.self,0,0,0,2,55559,200000); -- Worker's Earring of Efficiency
    end

    item_lib.return_items(e.self, e.other, e.trade);
end