sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome to the Everhot Forges! Home of the finest smiths in all of Kaladim! I teach experienced smiths how to work [brellium ore] and craft the finest dwarven [battle shields] and [dwarven plate].");
  }
  if ($text=~/dwarven plate/i) {
    quest::say("So ye're interested in crafting dwarven plate, are ye? In order to successfully craft yerself some dwarven plate, ye'll need ta go to the Stormguard forge with the appropriate small plate section mold, some earthen temper, yer dwarven smithy hammer, some leather padding, brellium chain jointing, and the correct amount of metal ye need fer the piece ye are planning on crafting. Visors, collars, bracers, and boots require one folded sheet of brellium. Helms, pauldrons, girdles, vambraces, and gauntlets require two folded sheets of brellium. Breastplates, cloaks, and greaves require three folded sheets of brellium. Ye can also have a cleric imbue a ruby for ye ta forge inta the plate if ye be a friend ta our father Brell.");
  }
}
#END of FILE Zone:kaladimb  ID:67047 -- Tortuk_Everhot
