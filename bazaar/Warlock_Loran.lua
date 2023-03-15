-- Necromancer Spell Vendor
-- ClassID 11

local MESSAGE_COLOR = 15
local CLASS_ID = 11
local SPELL_CLASS_ID = CLASS_ID - 1
local SPELLS = { 3, 6, 31, 32, 35, 36, 48, 49, 59, 61, 63, 65, 66, 67, 90, 96, 117, 118, 127, 131, 132, 133, 196, 197, 198, 199, 204, 
                 205, 209, 213, 218, 221, 225, 226, 229, 230, 233, 235, 236, 246, 288, 305, 309, 331, 338, 339, 340, 341, 342, 343, 
                 344, 346, 347, 348, 351, 352, 353, 354, 355, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 
                 371, 387, 393, 394, 413, 414, 415, 435, 436, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 451, 452, 453, 454, 
                 455, 456, 457, 478, 491, 492, 493, 494, 495, 502, 522, 524, 525, 549, 559, 641, 642, 643, 644, 661, 662, 694, 698, 
                 699, 1285, 1391, 1393, 1411, 1412, 1413, 1414, 1415, 1416, 1460, 1508, 1509, 1510, 1511, 1512, 1513, 1514, 1515, 
                 1526, 1527, 1528, 1530, 1532, 1609, 1610, 1611, 1612, 1613, 1614, 1615, 1616, 1617, 1618, 1619, 1620, 1621, 1622, 
                 1623, 1624, 1625, 1626, 1629, 1630, 1716, 1717, 1718, 1733, 1734, 1735, 1768, 1773, 2014, 2015, 2114, 2115, 2213, 
                 2541, 2542, 2543, 2544, 2545, 2546, 2547, 2548, 2549, 2550, 2885, 3032, 3035, 3195, 3196, 3300, 3301, 3302, 3303, 
                 3304, 3305, 3306, 3308, 3309, 3310, 3311, 3312, 3314, 3315, 3316, 3344, 3468, 3571, 3572, 3583, 3591, 3594, 3685, 
                 3702, 4079, 4080, 4081, 4096, 4097, 4098, 4099, 4100, 4255, 4256, 4257, 4261, 4262, 4263, 4267, 4268, 4269, 4273, 
                 4274, 4275, 4279, 4280, 4281, 4285, 4286, 4287, 4889, 4890, 4891, 4978, 5419, 5420, 5421, 5423, 5424, 5425, 5426, 
                 5427, 5428, 5429, 5430, 5431, 5432, 5433, 5434, 5435, 5436, 5437, 5438, 5439, 5440, 5441, 6124, 6143, 6668, 6736, 
                 6980, 6981, 6982, 6992, 6993, 6994, 7674, 7675, 7676, 7677, 7678, 7679, 7680, 7681, 7682, 7683, 7684, 7685, 7687, 
                 7688, 7689, 7690, 7691, 7692, 7693, 7694, 7695, 7696, 7697, 7994, 7995, 7999, 8520, 8522, 8523, 8934, 9987, 9988, 
                 9989, 9990, 9991, 10042, 10470, 10471, 10472, 10476, 10477, 10478, 10479, 10480, 10481, 10482, 10483, 10484, 10488, 
                 10489, 10490, 10494, 10495, 10496, 10503, 10504, 10505, 10506, 10507, 10508, 10509, 10510, 10511, 10512, 10516, 
                 10517, 10518, 10519, 10520, 10521, 10522, 10523, 10524, 10525, 10526, 10527, 10528, 10529, 10530, 10531, 10532, 
                 10533, 10534, 10535, 10536, 10537, 10538, 10539, 10543, 10544, 10545, 10546, 10547, 10548, 10555, 10556, 10557, 
                 10558, 10559, 10560, 10561, 10562, 10563, 10564, 10565, 10566, 10567, 10741, 10742, 10743, 11789, 11790, 11791, 
                 11792, 11793, 11794, 11798, 11799, 11800, 11804, 11805, 11806, 11810, 11811, 11812, 21399, 32397, 40971 }


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