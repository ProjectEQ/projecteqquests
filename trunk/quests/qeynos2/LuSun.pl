############################################
# ZONE: North Qeynos (qeynos2)
# DATABASE: PEQ-LDoN
# LAST EDIT DATE: May 6, 2010
# VERSION: 1.1
# BASE QUEST BY: PEQ Team
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: LuSun
# ID: 2077
# TYPE: Monk Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A tattered note ID-18712
# Torn Cloth Tunic ID-13507
#
# *** QUESTS INVOLVED IN ***
#
# Newbie Note Hand-in
#
# *** QUESTS AVAILABLE TO ***
#
# New Qeynos Monks
#
############################################

sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

sub EVENT_ENTER {
    if ($ulevel == 1) {
        quest::echo(15, "As you get your bearings, a lightly armored man that appears to be in incredible shape turns to greet you. 'Welcome traveller. I am LuSun. If you wish to learn the ways of the Silent Fist, read the note in your inventory and hand it to me to begin your training.'");
    }
}

sub EVENT_SAY {
    if ($text=~/Hail/i) {
        quest::say("Ah.. Greetings.. I am Lu'Sun, Guild Master of the Silent Fist Clan. Here, our goal is to train our body, mind, and soul to the peak of perfection.");
    }
    if ($text=~/Tomer Instogle/i) {
        quest::say("Tomer? I think Seta needs someone to go find him.. Go ask her.");
    }
}

sub EVENT_DEATH { 
    quest::summonitem("10116");
}

sub EVENT_ITEM {
    if ($item1=="18712") {
        quest::say("Greetings, and welcome to the Silent Fist Clan. Don our guild tunic, purge your mind and soul, and begin your lifelong devotion to the Clan. Brother Esrinap will introduce you to our lifestyle and begin your training. Be sound, allow your spirit to open up and guide you.");
        quest::summonitem("13507");
        # Silent Fist Clan faction
        quest::faction("300","2");
        # Guards of Qeynos faction
        quest::faction("135","2");
        # Ashen Order faction
        quest::faction("12","2");
        quest::exp("100");
    }
    else {
        #do all other handins first with plugin, then let it do disciplines
        plugin::try_tome_handins(\%itemcount, $class, 'Monk');
        plugin::return_items(\%itemcount);
    }
}
#END of FILE Zone:qeynos2  ID:2077 -- LuSun


