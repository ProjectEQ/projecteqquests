-- Golsodix Biroboddle for Find Xoomix quest in Ak'Anon

-- say block
function event_say(e)
    if e.message:findi("Hail") then
        e.self:Say("Hello there " .. e.other:GetName() .. ". I must admit that I am not in the highest of spirits on this day. So unless you know something about [" .. eq.say_link("Who is Xoomix?", false, "Xoomix") .. "], please leave me alone.");
    elseif e.message:findi("find") then
        e.self:Say("You are quite the likeable fellow " .. e.other:GetName() .. ". I do appreciate you willing to help me locate where my friend has gone, even if he has passed I would like some proof so that I may sleep easy at night knowing he is at peace. I can begin your search by telling you where our [" .. eq.say_link("Where had your journey taken you?", false, "journey had taken us") .. "].");
    elseif e.message:findi("Xoomix") then
        e.self:Say("Xoomix is a very dear friend of mine that was .. gulp. lost at sea. We were separated when the dastardly Broken Skull Clan overtook our boat. I was the only one that was able to escape but I fear the worst for my friend. Would you be willing to [" .. eq.say_link("I will help you find Xoomix", false, "help me find Xoomix") .. "]");
    elseif e.message:findi("journey") then
        e.self:Say("Well you see, we were setting sail for the city of Freeport. Xoomix received a few telegrams about some tinkering supplies that were available to him should we be able to travel to Freeport and pick them up. Xoomix was a fantastic Tinkerer, he could just about build anything out of nothing. If he should be alive I am sure that he has used his skills to survive. The first place I could ask you to look is around the area of Butcherblock dock. That is where our ship was [" .. eq.say_link("Who overtook your ship?", false, "overtaken") .. "].");
    elseif e.message:findi("overtook") or e.message:findi("overtaken") then
        e.self:Say("I do not remember that much from the incident, it happened ever so fast. I do remember how there were many trolls that chanted 'Glory to the Rok!' repeatedly. Perhaps this will aid you in your search. Please return to me with some good news. And please give this clockwork eye to Xoomix should you find him alive, I imagine it will lift his spirits. We used to collect them as children.");
        e.other:SummonItem(21979); -- Clockwork Eye
    end
end

function event_trade(e)
    local item_lib = require("items");
    if item_lib.check_turn_in(e.trade, {item1 = 21984}) then -- Tinkered Contraption
        e.self:Say("A contraption from Xoomix! I knew he was still alive. This also says that he needs his gearbox to make his compass so he can return home. I must have it here somewhere let me take a look . . . Ah, here it is. Please take this to Xoomix so he can return home and thank you for all your kind deeds to help a lost gnome. Brell certainly smiles down upon you!");
        e.other:SummonItem(21985); -- Xoomix's Gearbox
    end

    item_lib.return_items(e.self, e.other, e.trade)
end
