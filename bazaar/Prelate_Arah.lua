-- Cleric Spell Vendor
-- ClassID 2

local MESSAGE_COLOR = 15
local CLASS_ID = 2
local SPELL_CLASS_ID = CLASS_ID - 1
local SPELLS = { 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 35, 36, 37, 43, 44, 45, 47, 48, 49, 50, 52, 53, 59, 60, 61, 62, 63, 64, 89,
                 95, 96, 97, 115, 116, 117, 118, 123, 124, 125, 126, 127, 128, 130, 131, 132, 133, 134, 135, 136, 200, 201, 202, 203, 205,
                 207, 208, 209, 210, 211, 212, 213, 215, 216, 218, 219, 221, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234,
                 235, 244, 248, 312, 314, 329, 368, 388, 391, 392, 405, 406, 413, 414, 415, 416, 480, 485, 486, 487, 488, 501, 504, 560,
                 662, 663, 664, 672, 675, 1342, 1344, 1345, 1411, 1443, 1444, 1445, 1446, 1447, 1518, 1519, 1520, 1521, 1522, 1523, 1524, 
                 1525, 1526, 1527, 1528, 1530, 1532, 1533, 1534, 1535, 1536, 1537, 1538, 1539, 1540, 1541, 1542, 1543, 1544, 1545, 1546, 
                 1547, 1548, 1721, 1726, 1774, 1798, 1799, 1800, 1885, 1886, 1887, 1888, 1894, 1895, 1896, 1897, 1898, 2109, 2122, 2168, 
                 2169, 2170, 2171, 2172, 2175, 2180, 2181, 2182, 2326, 2462, 2501, 2502, 2503, 2504, 2505, 2506, 2507, 2508, 2509, 2510, 
                 2880, 2893, 2946, 3047, 3135, 3136, 3186, 3187, 3195, 3196, 3197, 3296, 3464, 3465, 3466, 3467, 3468, 3469, 3470, 3471, 
                 3472, 3473, 3474, 3475, 3476, 3477, 3478, 3479, 3480, 3481, 3482, 3575, 3576, 3592, 3692, 3693, 3994, 3995, 3996, 3997, 
                 3998, 4002, 4003, 4004, 4005, 4006, 4007, 4008, 4053, 4056, 4057, 4088, 4089, 4090, 4091, 4108, 4258, 4259, 4260, 4270, 
                 4271, 4272, 4282, 4283, 4284, 4880, 4881, 4882, 4973, 5250, 5251, 5252, 5253, 5254, 5255, 5256, 5257, 5258, 5259, 5260, 
                 5261, 5264, 5265, 5266, 5268, 5269, 5270, 5271, 5272, 5273, 5274, 5275, 5276, 5277, 5278, 5279, 6125, 6140, 6662, 6730, 
                 6875, 6878, 6902, 6903, 6977, 6978, 6979, 6989, 6990, 6991, 8004, 8006, 8007, 8493, 8494, 8495, 8928, 9703, 9704, 9705, 
                 9706, 9707, 9708, 9709, 9710, 9711, 9712, 9713, 9714, 9715, 9716, 9717, 9721, 9722, 9723, 9730, 9731, 9732, 9736, 9737, 
                 9738, 9739, 9740, 9741, 9742, 9743, 9744, 9746, 9747, 9748, 9749, 9750, 9751, 9755, 9756, 9757, 9764, 9765, 9766, 9773, 
                 9774, 9775, 9776, 9777, 9778, 9779, 9780, 9781, 9782, 9783, 9784, 9785, 9786, 9787, 9791, 9792, 9793, 9794, 9795, 9796, 
                 9797, 9798, 9799, 9800, 9801, 9802, 9803, 9804, 9805, 9806, 9807, 9808, 9809, 9810, 9811, 9812, 9813, 9814, 9818, 9819, 
                 9820, 11750, 11751, 11752, 11753, 11754, 11755, 11756, 11757, 11758, 11763, 11764, 11765, 21398, 21399, 21400, 31991, 
                 33000, 40971 }


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