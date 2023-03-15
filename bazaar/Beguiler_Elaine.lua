-- Enchanter Spell Vendor
-- ClassID 14

local MESSAGE_COLOR = 15
local CLASS_ID = 14
local SPELL_CLASS_ID = CLASS_ID - 1
local SPELLS = { 10, 21, 24, 25, 33, 35, 36, 39, 40, 41, 42, 45, 46, 47, 48, 49, 64, 65, 66, 67, 71, 72, 73, 74, 80, 84, 86, 127, 131, 132, 
                 133, 162, 163, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 190, 191, 
                 192, 193, 194, 195, 205, 208, 228, 229, 230, 235, 243, 246, 261, 276, 281, 285, 286, 287, 288, 289, 290, 291, 292, 293, 
                 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 309, 331, 350, 390, 407, 408, 439, 450, 481, 482, 
                 483, 484, 489, 500, 501, 521, 540, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 
                 598, 599, 600, 601, 619, 645, 646, 647, 648, 650, 651, 652, 653, 654, 667, 668, 669, 670, 673, 676, 677, 678, 681, 682, 
                 683, 684, 685, 686, 687, 688, 689, 690, 695, 696, 697, 1285, 1359, 1406, 1407, 1408, 1409, 1410, 1474, 1527, 1541, 1592, 
                 1610, 1633, 1686, 1687, 1688, 1689, 1690, 1691, 1692, 1693, 1694, 1695, 1696, 1697, 1698, 1699, 1700, 1701, 1702, 1703, 
                 1704, 1705, 1707, 1708, 1709, 1710, 1711, 1712, 1713, 1714, 1715, 1723, 1729, 1797, 1889, 1890, 1892, 1893, 2016, 2120, 
                 2121, 2561, 2562, 2563, 2564, 2565, 2566, 2567, 2568, 2569, 2570, 2826, 2881, 2894, 2895, 3034, 3063, 3178, 3194, 3197, 
                 3199, 3229, 3240, 3241, 3242, 3300, 3302, 3341, 3342, 3343, 3344, 3345, 3346, 3347, 3348, 3349, 3350, 3351, 3352, 3353, 
                 3354, 3355, 3356, 3357, 3358, 3359, 3360, 3583, 3585, 3586, 3591, 3592, 3593, 3594, 3595, 3696, 3697, 3981, 3982, 3983, 
                 3984, 3985, 3986, 3987, 3988, 3989, 3990, 3991, 3992, 3993, 4009, 4010, 4017, 4073, 4074, 4075, 4076, 4077, 4099, 4100, 
                 4255, 4256, 4257, 4267, 4268, 4269, 4279, 4280, 4281, 4408, 4418, 4877, 4878, 4879, 4975, 5499, 5500, 5502, 5503, 5504, 
                 5505, 5506, 5507, 5509, 5510, 5511, 5513, 5514, 5515, 5516, 5517, 5518, 5519, 5520, 5521, 5522, 5523, 6122, 6144, 6671, 
                 6739, 6826, 6983, 6984, 6985, 7003, 7674, 7675, 7676, 7677, 7678, 7679, 7680, 7681, 7682, 7683, 7684, 7685, 7686, 7687, 
                 7688, 7689, 7690, 7691, 7692, 7693, 7694, 7695, 7696, 7697, 7698, 7985, 7986, 7987, 7988, 7989, 8032, 8034, 8035, 8036, 
                 8506, 8508, 8509, 8931, 10577, 10578, 10579, 10580, 10581, 10582, 10583, 10584, 10585, 10586, 10596, 10597, 10598, 10599, 
                 10600, 10601, 10602, 10603, 10604, 10605, 10606, 10607, 10608, 10609, 10610, 10614, 10615, 10616, 10617, 10618, 10619, 
                 10620, 10621, 10622, 10623, 10624, 10625, 10629, 10630, 10631, 10635, 10636, 10637, 10638, 10639, 10640, 10641, 10642,
                 10643, 10644, 10645, 10646, 10647, 10648, 10649, 10650, 10651, 10652, 10653, 10654, 10655, 10656, 10657, 10658, 10659,
                 10660, 10661, 10662, 10663, 10664, 10666, 10674, 10675, 10676, 11885, 11886, 11887, 11891, 11892, 11893, 11897, 11898, 
                 11899, 11903, 11904, 11905, 11909, 11910, 11911, 12322, 12329, 12330, 12335, 12337, 12401, 12402, 12492, 27701, 27702, 
                 27703, 27704, 27705, 27706, 27707, 27708, 27709, 27710, 27711, 27712, 27713, 27714, 27715, 27716, 27717, 27718, 27719, 
                 27720, 27721, 27722, 27723, 27724, 27725, 27726, 27727, 27728, 27729, 27730, 27731, 27732, 27733, 27734, 27735, 27736, 
                 27737, 27740, 27742, 27743, 27744, 27745, 27746, 27747, 31003, 32200, 32201, 32202, 32203, 33999, 37869, 37974, 37975, 
                 37976, 38811, 39280, 39282, 39283, 39284, 39285, 39286, 39287, 39288, 39289, 39290, 39291, 39292, 39293, 39855, 40971, 
                 42282 }


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