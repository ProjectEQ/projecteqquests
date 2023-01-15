-- items: 67551
local riddles = {
  {
    item = 54068, -- Coffin
    loc = { -347, 2046, 631.96 },
    text = "Who makes it, has no need of it. Who buys it, has no use for it. Who uses it can neither see nor feel it."
  },
  { -- todo: verify live text
    item = 54069, -- Right Hand
    loc = { -332, 2051, 632.89 },
    text = "What can be held in the left hand, but not in the right hand."
  },
  { -- todo: verify live text
    item = 54070, -- Gold
    loc = { -321, 2056, 633.08 },
    text = "I drive men mad for love of me, Easily beaten, Never free."
  },
  {
    item = 54071, -- Fire
    loc = { -306, 2063, 631.00 },
    text = "I am always hungry. I must always be fed. The finger I lick will soon turn red."
  },
  {
    item = 54072, -- Candle
    loc = { -301, 2083, 631.00 },
    text = "My life can be measured in hours. I serve by being devoured. Thin, I am quick. Fat, I am slow. Wind is my foe."
  },
  {
    item = 54073, -- Catfish
    loc = { -306, 2090, 631.00 },
    text = "My mouth bears whiskers, but no teeth. I have scales, but I do not weigh. You can bait me with delicious food, but please, no drink today."
  },
  { -- todo: verify live text
    item = 54074, -- Pearl
    loc = { -317, 2087, 631.82 },
    text = "Lovely and round, I shine with pale light, grown in darkness, a lady's delight."
  },
  { -- todo: verify live text
    item = 54075, -- Rose
    loc = { -339, 2078, 631.58 },
    text = "I'm offered to the loved, and also to the dead. I come in many varied hues, most notably red. My pricks are known to pierce the skin, often resulting in wounds that bled."
  },
  { -- todo: verify live text
    item = 54076, -- Glove
    loc = { -355, 2059, 633.07 },
    text = "When I am filled I can point the way, When I am empty Nothing moves me, I have two skins One without and one within."
  },
  {
    item = 54077, -- Cork
    loc = { -367, 2049, 632.33 },
    text = "I help to mature your spirits. When moistened, I fulfill my purpose. Should I dry out, my task will fail and my quarry may be worthless."
  },
  {
    item = 54078, -- Sand
    loc = { -379, 2054, 631.95 },
    text = "I build up castles. I tear down mountains. I make some men blind. I help others to see."
  },
  { -- todo: verify live text
    item = 54079, -- Wine
    loc = { -388, 2048, 632.96 },
    text = "When young, I am sweet in the sun. When middle-aged, I make you happy. When old, I am valued more than ever."
  },
  {
    item = 54080, -- Feather
    loc = { -401, 2056, 631.96 },
    text = "I scribble forms of the finest letter, and repel elements of the harshest weather. I am an arrow-aimer and a dust-breaker."
  },
  { -- todo: verify live text
    item = 54081, -- Firework
    loc = { -416, 2044, 632.89 },
    text = "Searing 'cross the pitch-black skies, I scream in celebration, yet moments later, my outburst through, I am naught but imagination."
  },
  {
    item = 54082, -- Bubble
    loc = { -434, 2048, 631.76 },
    text = "It floats on water, light as can be. A thousand men can't lift it free."
  },
}

local active_riddle_index = math.random(#riddles) -- choose on init
local is_riddle_given = false
local is_riddle_answered = false

local riddle_items = {}
for i=1,#riddles do
  riddle_items[riddles[i].item] = i -- mapped to riddles index if we need it later
end

local function spawn_riddle_items()
  -- only create for items that aren't already spawned
  local spawned_items = {}
  local object_list = eq.get_entity_list():GetObjectList()
  for object in object_list.entries do
    if object.valid then
      spawned_items[object:GetItemID()] = true
    end
  end

  for _,riddle in pairs(riddles) do
    if not spawned_items[riddle.item] then
      eq.create_ground_object(riddle.item, riddle.loc[1], riddle.loc[2], riddle.loc[3], 0.0, 0)
    end
  end
end

local function spawn_devastating_pookas()
  eq.spawn2(289037, 0, 0, -264, 2105, 635, 336) -- a_devastating_pooka
  eq.spawn2(289037, 0, 0, -243, 2089, 634, 371) -- a_devastating_pooka
  eq.spawn2(289037, 0, 0, -249, 2075, 635, 387) -- a_devastating_pooka
  eq.spawn2(289037, 0, 0, -254, 2053, 635, 434) -- a_devastating_pooka
  eq.spawn2(289037, 0, 0, -230, 2053, 634, 419) -- a_devastating_pooka
  eq.spawn2(289037, 0, 0, -213, 2080, 635, 379) -- a_devastating_pooka
  eq.spawn2(289037, 0, 0, -215, 2104, 634, 355) -- a_devastating_pooka
  eq.spawn2(289037, 0, 0, -233, 2112, 634, 341) -- a_devastating_pooka
end

local function get_riddle_items_turned_in(trade)
  local count = 0
  for i=1,4 do
    local trade_item = trade["item" .. i]
    if trade_item.valid and riddle_items[trade_item:GetID()] ~= nil then
      count = count + 1
    end
  end
  return count
end

local function does_any_client_have_key()
  local invWherePersonal = 2
  local client_list = eq.get_entity_list():GetClientList()
  for client in client_list.entries do
    if client.valid then
      local inv = client:GetInventory()
      if inv:HasItem(54083, 1, invWherePersonal) ~= -1 then -- Harshly Spiked Key
        eq.debug(string.format("Client [%s] has key", client:GetName()))
        return true
      end
    end
  end
  return false
end

local function check_bic(client)
  local qglobals = eq.get_qglobals(client)
  if qglobals.bic and qglobals.bic == "11" then
    client:SummonItem(67551) -- Vaifan's Temporary Power Cell D
    client:Message(MT.NPCQuestSay, "Rikabi the Riddler says 'I sense you have come here seeking something besides passage. Please take this it was left here by one of your people's constructs.'")
  end
end

function event_say(e)
  -- the events can be skipped on live. all that's required is a player in zone
  -- has the Harshly Spiked Key to get conversations and open the last gate

  if e.message:findi("hail") or e.message:findi("mountain") or e.message:findi("test") or e.message:findi("ready") then
    if not does_any_client_have_key() then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Rikabi the Riddler says, 'It appears that you have somehow found your way to me, but I sense that you are not yet ready to continue. Please, return when you have found that which is yet unfound.'")
      return
    end
  end

  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Rikabi the Riddler says, 'So, another band of treasure-seekers desire to plunder the abomination that our fair temple has become.   There was a time when those that wandered sought to do good in the fields they trampled, repair the trails they followed, and to help those in need they met along their way.  Alas, these times are distant, dusty memories, and so now here I sit and judge.  This [" .. eq.say_link("mountain") .. "] pass was once fertile and virtuous, can the same be said of you?  Bah, true nobility is hidden in the heart. Today, your cunning and valor of mind shall be tested!  Step forth, and hear my riddles. Plan to go no further than the grave if your mind and heart are weak!'")
  elseif e.message:findi("mountain") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Rikabi the Riddler says, 'This mountain pass was once a holy place. It was a passage to a higher place as well as frame of mind. Everything here inspired the utmost respect of our people. Unfortunately, those days are gone and all that remains is broken or corrupted.  I [" .. eq.say_link("test") .. "] all of those who wish to pass now.'")
  elseif e.message:findi("test") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Rikabi the Riddler says, 'The test is... riddles! I have many of those. Take time to gather your wits about you and let me know when you are ready. Bear in mind that a wrong answer could lead to dire consequences. Tell me when you are [" .. eq.say_link("ready") .. "], and you shall have your riddle. The answer to any of my riddles can be found in the road behind you. Bring me an example of what you believe the answer to be, and you may pass freely.'")
    spawn_riddle_items()
  elseif e.message:findi("ready") then
    if is_riddle_given then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Rikabi the Riddler says, 'Your riddle has already been given. My responsibility lies not in giving second chances to those short of memory.'")
    else
      is_riddle_given = true
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Rikabi the Riddler says, '" .. riddles[active_riddle_index].text .. "'")
      eq.debug(string.format("Summon riddle answer: [%s]", eq.say_link("#si " ..riddles[active_riddle_index].item)))
    end
  end
end

function event_trade(e)
  local item_lib = require("items")

  -- turning in more than one riddle item fails. non-riddle items are ignored
  local riddle_item_count = get_riddle_items_turned_in(e.trade)

  -- door is unlocked for any riddle item turn in (right or wrong). the key is
  -- NOT required here. items from another expedition can be turned in to open
  -- door but it's still needed for gate to last area and wrong item spawns pookas
  if riddle_item_count > 0 then
    eq.zone_emote(15, "You hear the grinding of stone as the door unlocks before you.")
    eq.get_entity_list():FindDoor(4):SetLockPick(0)

    if not is_riddle_answered then
      -- hypothetically riddle doesn't need given for success. never guessed right
      -- to confirm so for now having key IS required for success (can still open door)
      local riddle = riddles[active_riddle_index]
      if is_riddle_given and riddle_item_count == 1 and item_lib.check_turn_in(e.trade, {item1 = riddle.item}) then
        check_bic(e.other)
        e.other:SummonItem(riddle.item) -- correct riddle item is returned
        e.self:Say(string.format("I have no need for this, %s. You can have it back.", e.other:GetCleanName())) -- msg id: 1105
      else
        spawn_devastating_pookas()
      end
      is_riddle_answered = true
    end
  end

  item_lib.return_items(e.self, e.other, e.trade)
end
