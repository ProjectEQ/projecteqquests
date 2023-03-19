-- Magician Spell Vendor
-- ClassID 13

local MESSAGE_COLOR = 15
local CLASS_ID = 13
local SPELL_CLASS_ID = CLASS_ID - 1
local SPELLS = { 93, 311, 331, 205, 313, 211, 50, 310, 288, 2230, 318, 315, 321, 232, 316, 317, 94, 36, 246, 58, 322, 323, 325, 398,
                 399, 332, 324, 1504, 613, 400, 42, 2233, 248, 397, 319, 48, 402, 330, 2242, 327, 403, 2531, 35, 328, 404, 305, 333,
                 401, 4255, 336, 614, 4279, 4267, 320, 100, 395, 334, 396, 7676, 309, 7674, 80, 2239, 7675, 2532, 335, 83, 4, 663, 
                 1505, 68, 497, 108, 498, 411, 3583, 4027, 102, 7687, 499, 7677, 7688, 2236, 101, 7689, 2231, 496, 55, 570, 56, 110,
                 189, 4256, 571, 113, 4280, 4268, 7690, 572, 65, 615, 81, 115, 2533, 569, 409, 574, 617, 2234, 575, 1286, 576, 479, 
                 664, 573, 106, 103, 2243, 1400, 7678, 618, 621, 1401, 120, 66, 49, 622, 69, 623, 616, 4257, 620, 4281, 4269, 7691, 
                 3584, 121, 104, 1285, 625, 626, 2240, 105, 627, 2534, 680, 624, 122, 7679, 114, 629, 82, 109, 4099, 2237, 630, 4082, 
                 1403, 67, 631, 111, 3699, 4028, 1503, 628, 7692, 1944, 412, 4079, 632, 70, 634, 107, 116, 635, 2535, 633, 410, 1402, 
                 7680, 2232, 1659, 112, 2235, 1680, 1671, 1666, 2536, 1660, 2244, 1673, 3700, 1681, 1682, 2241, 1526, 1674, 1668, 5133, 
                 1672, 7693, 3582, 2238, 1683, 2537, 1661, 1610, 2879, 4029, 4011, 1662, 1771, 1472, 8933, 7681, 1770, 1684, 1405, 1685,
                 1679, 1667, 3188, 1529, 2538, 1675, 1663, 1720, 4080, 2539, 4100, 1577, 1670, 1677, 1678, 1284, 7694, 1664, 1936, 1665,
                 1394, 7682, 1531, 2896, 1669, 1676, 2118, 1772, 4078, 2540, 1404, 2119, 3318, 3041, 3300, 4030, 3208, 3205, 6738, 3209, 
                 3329, 3206, 3317, 3040, 3207, 3198, 3237, 3045, 3319, 3042, 3031, 3320, 4110, 3352, 3486, 3387, 3322, 3483, 3043, 3210, 
                 3321, 3044, 3353, 3302, 4081, 3238, 3323, 3239, 7695, 4887, 3325, 4888, 7683, 3356, 3484, 4976, 3357, 4886, 3324, 5473, 
                 5470, 5467, 5464, 5474, 5471, 5468, 5475, 5472, 5469, 5466, 5479, 5480, 5477, 5489, 5465, 5486, 5476, 8038, 5484, 5492, 
                 5485, 5483, 5494, 5491, 7696, 8040, 5481, 5478, 5490, 6670, 5497, 8517, 5488, 5498, 8518, 5495, 6145, 5496, 7684, 8515, 
                 5493, 8037, 10696, 10693, 10710, 10730, 10685, 9981, 10702, 10697, 10694, 10715, 10731, 10686, 9982, 10698, 10695, 10692,
                 10729, 10684, 9980, 10717, 10714, 11817, 10706, 10718, 11818, 10712, 10707, 10716, 10713, 11816, 10708, 10705, 10700,
                 10736, 10733, 10727, 10721, 10740, 10737, 10734, 10728, 10704, 10719, 10738, 10735, 10732, 10726, 10720, 10739, 11820, 
                 10752, 10689, 10749, 10743, 11821, 10753, 7697, 10690, 10750, 10747, 10741, 11819, 10751, 10688, 10748, 10742, 7685, 10755,
                 10768, 10765, 10759, 11827, 10756, 10769, 10766, 10763, 10757, 11825, 10754, 10767, 10764, 10758, 11826 }


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
            local cost = getSpellCost(check_id)
            if unlocked == '' then
                if e.other:HasSpellScribed(check_id) and adapt_points >= cost then
                    e.other:SetBucket("Spell-" .. check_id .. "-unlocked", tostring(eq.get_spell(check_id):Classes(SPELL_CLASS_ID)))
                    e.other:SetBucket("SpellPoints-" .. CLASS_ID, tostring(adapt_points - cost))

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
                if (unlocked == '' and e.other:HasSpellScribed(SPELLS[i])) then
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