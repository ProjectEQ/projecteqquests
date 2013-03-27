############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 6, 2010
# VERSION: 1.1
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON, Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Puab_Closk
# ID: 9086
# TYPE: Monk Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Puab's Token ID-12369
# A tattered note ID-18746
# Torn Cloth Tunic ID-13507
# Tattered Parchment ID-28055
# Treant Fists ID-12344
#
# *** QUESTS INVOLVED IN ***
#
# Newbie Note Hand-in
# Treant Fists
#
# *** QUESTS AVAILABLE TO ***
#
# New Freeport Monks
# Monks with good Ashen Order Faction
#
############################################

sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

sub EVENT_ENTER {
    if ($ulevel == 1) {
        quest::echo(15, "As you get your bearings, a lightly armored man that appears to be in incredible shape turns to greet you. 'Welcome traveller. I am Puab Closk. If you wish to learn the ways of the Ashen Order, read the note in your inventory and hand it to me to begin your training.'");
    }
}

sub EVENT_SAY
{
    if($text=~/Hail/i)
    {
        quest::say("Greetings. I am Puab Closk, Master of the Ashen Order.  Our home is your home, friend. Feel free to stay as long as you like.  Learn our ways as many have done in the past.  To fight like the tiger and strike like the cobra are your goals.");
    }

    if($faction < 4)
    {
        if($text=~/treant fists/i)
        {
            quest::say("You desire the treant fists?  I have them and I will offer them to any [skilled monk of the Ashen House].");
        }
    
        if($text=~/skilled monk of the Ashen House/i)
        {
            quest::say("Then you shall aid our family. My former pupil [Clawfist] has been banished by his people. You will go to him and hand him this token as proof of your origin. He shall be expecting you.");
            # Puab's Token ID-12369
            quest::summonitem("12369");
        }
    
        if($text=~/Clawfist/i)
        {
            quest::say("Clawfist is a Kerran, a catman. He braved the dangers of Norrath to reach the Ashen Order. He sought knowledge of our disiples. He learned well.");
        }
    
        if($text=~/Where is Clawfist/i)
        {
            quest::say("Clawfist has been banished by the Kerrans of Odus. Where they have sent him I am unsure");
        }
    }
}

sub EVENT_ITEM
{
    # A tattered note ID-18746
    if (plugin::check_handin(\%itemcount, 18746 => 1))
    {
        quest::say("Welcome to the house of the Ashen Order. We are a small guild of monks who have devoted our lives to refining our minds, souls, and physical beings to their maximum potential. Please see Brother Torresk as soon as you get a chance. He is in charge of helping our newer members begin their training. Good luck, $name.");
        # Torn Cloth Tunic ID-13507
        quest::summonitem("13507");
        # Ashen Order Faction ID-12
        quest::faction("12","300");
        # Knights of Truth Faction ID-184
        quest::faction("184","2");
        # Silent Fist Clan Faction ID-300
        quest::faction("300","2");
        quest::exp("100");
    }
    # Tattered Parchment ID-28055
    if (plugin::check_handin(\%itemcount, 28055 => 1))
    {
        quest::ding();
        quest::say("You have performed a great service to one who is your brother. Your loyalty shines brightly, as does your skill. Take the treant fists. They are yours now.");
        # Treant Fists ID-12344
        quest::summonitem("12344");
        quest::exp("100");
        # Ashen Order Faction ID-12
        quest::faction("12","10");
        # Knights of Truth Faction ID-184
        quest::faction("184","10");
        # Silent Fist Clan Faction ID-300
        quest::faction("300","10");
    }
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Monk');
    plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportw  ID:9086 -- Puab_Closk


