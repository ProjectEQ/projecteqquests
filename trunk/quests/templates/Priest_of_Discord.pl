
##################################################
# ZONE: Multiple
# DATABASE: PEQ-Omens of War
# LAST EDIT DATE: April 25, 2009
# VERSION: 1.1
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Priest_of_Discord
# ID: Multiple
# TYPE: NPC
# RACE: Human
# LEVEL: 50
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Tome of Order and Discord ID-18700
# Discordant Crystal Shard ID-77765
# Rolled Discordant Parchment ID-77766
# Spell: Bloodfields Gate ID-77659
# Spell: Bloodfields Portal ID-77661
# Spell: Circle of Bloodfields ID-77662
# Spell: Ring of Bloodfields ID-77663
# Spell: Translocate: Bloodfields ID-77660
#
# *** QUESTS INVOLVED IN ***
#
# Become PvP
# Bloodfields Port Spells
#
# *** QUESTS AVAILABLE TO ***
#
# Become PvP - Anyone
# Bloodfields Port Spells - Wizards and Druids
#
##################################################

sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::say("Ah, another who admits that the path to glory and power lies in discord? Have we not always preached the truth?  We are the only ones that can give you passage to the new world of purest Discord.  Should you like to go there, tell me you [wish to go to Discord] and I will grant you passage.  If you wish to [know more] about this travel, I will tell you. And, of course, if you have come to seek the way of Discord in your life, then ask me about your [Tome of Order and Discord].");
    }

    if($text=~/know more/i) {
        quest::say("We have been given a unique magic to pass through realms and we believe it to be the influence of Discord itself granting this gift upon its faithful followers. Only we can send you back and forth to the realm touched by Discord, a world called Kuua. You will find priests on the other side that will send you directly back to me, where your travel originated.  And, if you are of the right ilk, I may be able to grant you [additional information].");
    }

    if($text=~/additional information/i) {
        quest::say("There is a magic in Kuua that is blessed with the power of Discord itself.  We have found we can use that magic to help those who help us.  If you return three [discordant crystal shards] and a [magic parchment], we will imbue it with our power so you may travel there alone.  Obviously, you must be a master of teleportation yourself -- a wizard or druid, is what I mean.");
    }

    if($text=~/shards/i) {
        quest::say("The crystal shards are very unique and bear a magic that brims with the power of Discord.  We found we can use them to create spells on a specific type of discordant parchment that allows wizards and druids to pass through to the other realm.");
    }

    if($text=~/magic parchment/i) {
        quest::say("We are not certain what the parchments were meant for, but they burn hot and cold and are imbued with a magic that protects it from destroying itself.  We need one of these parchments to make a travel spell to Kuua in the Realm of Discord.");
    }

    if($text=~/tome/i) {
        quest::say("The Tome of Order and Discord was penned by the seventh member of the Tribunal and has become the key to a life of Discord, in spite of the author's pitiful warnings.  Do you not have one, child of Order?  Would you [like to read] it?");
    }

    if($text=~/read/i) {
        quest::say("Very well.  Here you go.  Simply return it to me to be released from the chains of Order.");
        quest::summonitem("18700"); # Tome of Order and Discord
    }

    if($text=~/wish/i) {
        quest::say("Prepare yourself to cross into the depths of Discord!");
        quest::setglobal("OOW_PoD_Origin", $zoneid, 5, "F");
        quest::movepc(302, -1485.52, -1263.29, 222.0);
    }
}

sub EVENT_ITEM {
    # Tome of Order and Discord
    if(plugin::check_handin(\%itemcount, 18700 => 1)) {
        quest::say("I see you wish to join us in Discord! Welcome! By turning your back on the protection of Order you are now open to many more opportunities for glory and power. Remember that you can now be harmed by those who have also heard the call of Discord.");
        quest::pvp("on");
        quest::ding();
    }

    # Discordant Crystal Shards and Rolled Discordant Parchment
    if(plugin::check_handin(\%itemcount, 77765 => 3, 77766 => 1)) {
        quest::emote("wraps the crystals in the parchment and closes his eyes, chanting in a language you've never heard.  In moments, a burning parchment appears.");
        quest::say("You will now be able to teleport into the realm of discord, true power is at your fingertips!");
        if($class eq "Wizard") {
            quest::summonitem(77659);
            quest::summonitem(77660);
            quest::summonitem(77661);
        }
        if($class eq "Druid") {
            quest::summonitem(77662);
            quest::summonitem(77663);
        }
        quest::ding();
    }
    else {
      quest::say("I have no use for this, $name.");
      plugin::return_items(\%itemcount);
    }
}

#END of FILE Zone:Multiple  ID:Multiple -- Priest_of_Discord 