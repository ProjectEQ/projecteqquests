#216048 - Fake (But still aggressive) Corirnav_the_Avatar_of_Water

sub EVENT_SIGNAL {
    if($signal == 8) { #Signal rc'd when trash dies. If all trash is dead, then we can depop nameds and proceed to the last phase

quest::ze(0, "A trash mob has died."); 

        my $check_trash1 = $entity_list->GetMobByNpcTypeID(216071); # - Triloun Vapourfiend
        my $check_trash2 = $entity_list->GetMobByNpcTypeID(216076); # - Hraquis Icefiend
        my $check_trash3 = $entity_list->GetMobByNpcTypeID(216060); # - Regura Waterfiend

        if (!defined(check_trash1) && !defined(check_trash2) && !defined(check_trash3)) { #if all trash is down, start event
            quest::ze(0, "All trash - or one wave of trash - has been killed"); #DEBUG
            quest::signalwith(216107,4,0);
        }
    }
    if($signal == 1){ #First wave emote
        quest::shout("Those that violate my domain will pay. I call upon the power imbued to me by Povar! Come forth my minions of vapor and destroy these intruders.");
    }

    if($signal == 2){ #Second wave emote
        quest::shout("Those that violate my domain will pay. I call upon the power imbued to me by E`ci! Come forth my minions of ice and destroy these intruders.");
    }

    if($signal == 3){ #Third wave emote
        quest::shout("Those that violate my domain will pay. I call upon the power imbued to me by Tarew Marr! Come forth minions of water and destroy these intruders.");
    }

    if($signal == 4){ #Event kickout charge emote #1
        quest::ze(0, "Coirnav the Avatar of Water is suddenly surrounded by a slight glow. A low constant humming is heard in the background.");
    }
    if($signal == 5){ #Event kickout charge emote #2
        quest::ze(0, "Coirnav the Avatar of Water is now glowing noticeably brighter and the constant humming is getting louder.");
    }

    if($signal == 6){ #Event kickout charge emote #3
        quest::ze(0, "Coirnav the Avatar of Water glows to brilliant flash of light that suddenly fades. The constant humming suddenly becomes a deafening roar that also mysteriously fades away.");
    }

    if($signal == 7){ #Event kickout emote
        quest::shout("Violaters of this plane be banished from this domain!");
    }

}