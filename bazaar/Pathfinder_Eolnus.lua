-- Ranger Spell Vendor
-- ClassID 4

local MESSAGE_COLOR = 15
local CLASS_ID = 4
local SPELL_CLASS_ID = CLASS_ID - 1
local SPELLS = { 9, 12, 15, 17, 26, 27, 28, 29, 34, 35, 36, 48, 49, 50, 57, 60, 61, 62, 63, 64, 76, 77, 78, 80, 86, 91, 92, 93, 95, 
                 96, 99, 115, 116, 129, 137, 138, 139, 140, 141, 142, 143, 144, 145, 169, 200, 203, 211, 213, 217, 220, 224, 225, 
                 226, 227, 228, 234, 237, 238, 239, 240, 241, 242, 245, 247, 248, 249, 250, 252, 253, 254, 255, 256, 257, 258, 259, 
                 260, 261, 262, 263, 264, 268, 273, 278, 356, 405, 406, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 
                 430, 432, 433, 490, 512, 513, 514, 515, 516, 517, 518, 519, 520, 530, 531, 532, 533, 534, 535, 536, 537, 538, 550, 
                 551, 552, 553, 554, 555, 556, 557, 558, 607, 608, 609, 610, 611, 663, 664, 665, 671, 753, 1285, 1290, 1291, 1326, 
                 1398, 1433, 1434, 1435, 1436, 1437, 1438, 1439, 1440, 1442, 1475, 1517, 1526, 1529, 1531, 1542, 1550, 1551, 1552, 
                 1553, 1554, 1555, 1556, 1557, 1558, 1559, 1560, 1561, 1562, 1563, 1564, 1565, 1566, 1567, 1568, 1569, 1600, 1601, 
                 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1719, 1725, 1727, 1736, 1737, 1740, 1767, 1800, 1888, 2020, 2021, 2029, 
                 2030, 2031, 2125, 2126, 2179, 2183, 2188, 2417, 2419, 2422, 2424, 2427, 2429, 2432, 2433, 2511, 2512, 2513, 2514, 
                 2515, 2516, 2517, 2518, 2519, 2520, 2591, 2877, 2880, 2881, 2887, 2894, 2946, 3182, 3184, 3185, 3192, 3232, 3234, 
                 3238, 3295, 3346, 3433, 3434, 3435, 3436, 3437, 3438, 3439, 3440, 3441, 3442, 3443, 3444, 3445, 3446, 3447, 3448, 
                 3449, 3450, 3451, 3452, 3453, 3473, 3579, 3580, 3583, 3601, 3693, 3792, 3794, 3834, 3998, 4004, 4054, 4055, 4056, 
                 4057, 4058, 4104, 4105, 4106, 4261, 4262, 4263, 4273, 4274, 4275, 4285, 4286, 4287, 4589, 4883, 4884, 4885, 4966, 
                 4967, 4974, 5342, 5343, 5345, 5346, 5347, 5348, 5349, 5350, 5351, 5352, 5353, 5354, 5355, 5356, 5357, 5358, 5359, 
                 5361, 5362, 5363, 5364, 5365, 5366, 5367, 5368, 5369, 5571, 5572, 5731, 5733, 6123, 6141, 6179, 6180, 6184, 6185, 
                 6665, 6733, 6873, 6876, 6998, 6999, 7000, 8008, 8010, 8011, 8235, 8237, 8497, 8498, 8499, 8929, 8965, 8967, 9700, 
                 9701, 9702, 9721, 9722, 9723, 9776, 9777, 9778, 9824, 9825, 9826, 9827, 9828, 9829, 9830, 9831, 9832, 9833, 9834, 
                 9835, 9845, 9846, 9847, 9851, 9852, 9853, 9857, 9858, 9859, 9863, 9864, 9865, 9866, 9867, 9868, 9869, 9870, 9871, 
                 9872, 9873, 9874, 9875, 9876, 9877, 9878, 9879, 9880, 9881, 9882, 9883, 9887, 9888, 9889, 9890, 9891, 9892, 9893, 
                 9894, 9895, 9902, 9903, 9904, 9905, 9906, 9907, 9911, 9912, 9913, 9917, 9918, 9919, 9920, 9921, 9922, 9923, 9924, 
                 9925, 9926, 9927, 9928, 9929, 9930, 9931, 9932, 9933, 9934, 9941, 9942, 9943, 9947, 9948, 9949, 9950, 9951, 9952, 
                 9953, 9954, 9955, 9956, 9957, 9958, 10735, 10736, 10737, 11766, 11767, 11768, 11770, 11771, 11772, 11980, 11981, 
                 11982, 15886, 15887, 15888, 21398, 21399, 21400, 24771, 24772, 24773, 24774, 24775, 24776, 25689, 25690, 25691, 
                 25692, 25693, 25694, 25695, 25696, 25697, 25698, 25699, 25700, 25898, 25899, 25900, 25901, 25902, 25903, 25904, 
                 25905, 25906, 27757, 27758, 27779, 27780, 27781, 27782, 27783, 27784, 33099, 40971, 41188
 }


function event_say(e)
    adapt_points = tonumber(e.other:GetBucket("SpellPoints-" .. CLASS_ID))
    if (adapt_points == nil) then
        adapt_points = 0
    end

    -- Sort spells array by level
    table.sort(SPELLS, function(a, b) return compareSpells(a, b) end)

    if e.other:GetClass() == CLASS_ID then
        if e.message:findi("Hail") then
            e.self:Say("Hail, " .. e.other:GetCleanName() .. ". I am " .. e.self:GetCleanName() .. ". You look like a " .. e.other:GetClassName() .. " to me, am I [" .. eq.say_link("class_resp_1", true, "right") .. "] about that?")
        elseif e.message:findi("class_resp_1") then
            e.self:Say("I knew it. I have all of the spells you could need on your adventures. I can also help you adapt your abilities to be useful while you are focusing another aspect in your soul, just talk to me when you are ready to [" .. eq.say_link("unlock", true) .. "] those adaptations.")
        elseif e.message:findi("unlock") then
            if adapt_points ~= nil and adapt_points > 0 then
                e.self:Say("Which spell were you interested in unlocking?")
                eq.message(MESSAGE_COLOR, "You have " .. e.other:GetBucket("SpellPoints-" .. CLASS_ID) .. " adaptation points available. [" .. eq.say_link("convert", true, "Convert 5 AA") .. "]") 
                eq.message(MESSAGE_COLOR, "Level [" .. eq.say_link("level_range_1", true, "1-10") .. "]")
                eq.message(MESSAGE_COLOR, "Level [" .. eq.say_link("level_range_2", true, "11-20") .. "]")
                eq.message(MESSAGE_COLOR, "Level [" .. eq.say_link("level_range_3", true, "21-30") .. "]")
                eq.message(MESSAGE_COLOR, "Level [" .. eq.say_link("level_range_4", true, "31-40") .. "]")
                eq.message(MESSAGE_COLOR, "Level [" .. eq.say_link("level_range_5", true, "41-50") .. "]")
                eq.message(MESSAGE_COLOR, "Level [" .. eq.say_link("level_range_6", true, "51-60") .. "]")
            else
                e.self:Say("In order to adapt your " .. e.other:GetClassName() .. " spells to be used by other classes, I'll need you to expend some of your alternate experience points. I can [" .. eq.say_link("convert", true) .. "] them for you, five at a time, as long as you have a surplus. This will earn you one hundred adaptation points for this class, which you can then spend on unlocking individual spells. I'll provide those spell formula to you for free whenever you have a different class equipped and are sufficiently skilled in that class.")
            end
        elseif e.message:findi("convert") then
            if e.other:GetAAPoints() >= 5 then
                e.other:SetAAPoints(e.other:GetAAPoints() - 5)
                e.other:SetBucket("SpellPoints-" .. CLASS_ID, tostring(adapt_points + 100))
                eq.message(MESSAGE_COLOR, "You have converted five AA to 100 adaptation points. Total: " .. e.other:GetBucket   ("SpellPoints-" .. CLASS_ID))
                eq.message(MESSAGE_COLOR, "You have " ..  e.other:GetAAPoints() .. " alternate advancement points remaining.")
            else
                e.self:Say("I'm sorry " .. e.other:GetCleanName() .. ", you don't have enough unspent AA points to convert.")
            end        
        elseif e.message:findi("level_range_1") then
            printSpellList(1,10,e)        
        elseif e.message:findi("level_range_2") then
            printSpellList(11,20,e)            
        elseif e.message:findi("level_range_3") then
            printSpellList(21,30,e)            
        elseif e.message:findi("level_range_4") then
            printSpellList(31,40,e)            
        elseif e.message:findi("level_range_5") then
            printSpellList(41,50,e)            
        elseif e.message:findi("level_range_6") then
            printSpellList(51,60,e)
        else
            local check_id = tonumber(e.message)
            local unlocked = e.other:GetBucket("Spell-" .. check_id .. "-unlocked")
            if unlocked == '' then
                if e.other:HasSpellScribed(check_id) then
                    e.other:SetBucket("Spell-" .. check_id .. "-unlocked", tostring(eq.get_spell(check_id):Classes(SPELL_CLASS_ID)))
                    e.other:SetBucket("SpellPoints-" .. CLASS_ID, tostring(adapt_points - getSpellCost(check_id)))

                    e.self:Say("You've unlocked access to the spell '" .. eq.get_spell(check_id):Name() .. ". Come talk to me while you have another class equipped to have it added to your spellbook.")
                    eq.message(MESSAGE_COLOR, "You have spent " .. getSpellCost(check_id) .. " adaptation points unlocking a spell. You have " .. e.other:GetBucket("SpellPoints-" .. CLASS_ID) .. " adaptation points available.")
                else
                    e.self:Say("You don't know that spell at all. Ask me again once you've learned it.")
                end
            else
                e.self:Say("How droll.")
            end
        end
    else
        if e.message:findi("Hail") then
            if e.other:GetBucket("class-" .. CLASS_ID .. "-unlocked") then
                e.self:Say("Hail, " .. e.other:GetCleanName() .. ". You look like you have quite a bit of experience as a " .. eq.get_class_name(CLASS_ID) .. ", am I [" .. eq.say_link("offclass_resp_1", true, "right") .. "] about that?") 
            end           
        elseif e.message:findi("offclass_resp_1") then
                e.self:Say("I knew it. I have all of the spells you could need on your adventures. If you have opened up your " .. eq.get_class_name(CLASS_ID) .. " spells with me in the past, I can [" .. eq.say_link("scribe", true) .. "] them in your spellbook.")            
        elseif e.message:findi("scribe") then            
            local count = 0
            for i = 1, #SPELLS do
                local spell_info = eq.get_spell(SPELLS[i])
                local unlocked = 0
                
                if e.other:GetBucket("Spell-" .. SPELLS[i] .. "-unlocked") ~= '' then
                    unlocked = tonumber(e.other:GetBucket("Spell-" .. SPELLS[i] .. "-unlocked"))
                end

                if unlocked <= e.other:GetLevel() and unlocked > 0 and e.other:HasSpellScribed(SPELLS[i]) ~= true then
                    count = count + 1
                    if (count == 1) then
                        e.self:Say("Which spell would you like for me to copy into your spellbook?")
                    end
                    eq.message(MESSAGE_COLOR, "-[" .. eq.say_link(tostring(spell_info:ID()),true,spell_info:Name()) .. "]-")
                end
            end
            if count == 0 then
                e.self:Say("I don't think that you've adapted any " .. eq.get_class_name(CLASS_ID) .. " spells that you don't already know. Visit me in your guise as a "  .. eq.get_class_name(CLASS_ID) .. ", and I can unlock more of them for you.")
            end 
        else 
            local spell_id = tonumber(e.message)
            if e.other:GetBucket("Spell-" .. spell_id .. "-unlocked") and e.other:HasSpellScribed(spell_id) ~= true then
                e.other:ScribeSpell(spell_id, e.other:GetNextAvailableSpellBookSlot())
            end
        end
    end
end

function printSpellList(low, high, e)
    local count = 0

    -- Fail Early
    if (e.other:GetLevel() < low) then
        eq.message(MESSAGE_COLOR, "You must gain more experience before attempting to adapt those spells.")    
    else 
        for i = 1, #SPELLS do
            local spell_info = eq.get_spell(SPELLS[i])
            if spell_info:Classes(SPELL_CLASS_ID) >= low and spell_info:Classes(SPELL_CLASS_ID) <= high then            
                local unlocked = e.other:GetBucket("Spell-" .. SPELLS[i] .. "-unlocked")
                -- This doesn't fucking work for whitespace wtf?
                if (unlocked == '' and (e.other:HasSpellScribed(SPELLS[i]) or e.other:GetGM())) then
                    eq.message(MESSAGE_COLOR, string.format("Cost: %d - Spell:[", getSpellCost(SPELLS[i])) .. eq.say_link(tostring(spell_info:ID()),true,spell_info:Name()) .. "]")
                    count = count + 1
                end
            end
        end
        if count == 0 then
            eq.message(MESSAGE_COLOR, "You have unlocked all spells that you currently know in this level range.")
        end
    end
end

function getSpellCost(spellID)

    local spell_info = eq.get_spell(spellID)
    local spell_level = spell_info:Classes(SPELL_CLASS_ID)

    if (spell_level <= 50) then
        return math.floor(spell_level)
    elseif (spell_level <= 60) then
        return math.floor(spell_level * 2)
    elseif (spell_level <= 65) then
        return math.floor(spell_level * 4)
    elseif (spell_level <= 70) then
        return math.floor(spell_level * 8)
    elseif (spell_level <= 75) then
        return math.floor(spell_level * 16)
    end
end

-- Define the function that will be used to compare two spells
function compareSpells(spellId1, spellId2, spellClassId)
    local spell1 = eq.get_spell(spellId1)
    local spell2 = eq.get_spell(spellId2)
  
    -- Get the class value for each spell
    local classValue1 = spell1:Classes(SPELL_CLASS_ID) or 0
    local classValue2 = spell2:Classes(SPELL_CLASS_ID) or 0
  
    -- Compare the class values
    if classValue1 == classValue2 then
      -- If the class values are the same, use the spell IDs to break ties
      return spell1:Name() < spell2:Name()
    else
      -- Sort spells with higher class values first
      return classValue1 < classValue2
    end
  end