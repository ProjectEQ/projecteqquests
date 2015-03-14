############################################
# ZONE: Dranik's Scar
# DATABASE: PEQ-Omens of War
# LAST EDIT DATE: April 25, 2009
# VERSION: 1.1
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Priest_of_Discord
# ID: Dranik's Scar
# TYPE: NPC
# RACE: Human
# LEVEL: 50
#
# *** ITEMS GIVEN OR TAKEN ***
#
# *** QUESTS INVOLVED IN ***
#
# *** QUESTS AVAILABLE TO ***
#
############################################

sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::say("Should you wish to return from whence you came, tell me you wish to [go home] and I will send you.");
    }

    if($text=~/home/i) {
        if(defined $qglobals{OOW_PoD_Origin}) {
            quest::say("Very well.  You are now to return from whence you came.");
            if($qglobals{OOW_PoD_Origin} == 202) { # Plane of Knowledge
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(202, 582, 49, 4, 192);
            }
            elsif($qglobals{OOW_PoD_Origin} == 52) { # Grobb
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(52, 2, 13, 4, 180);
            }
            elsif($qglobals{OOW_PoD_Origin} == 24) { # Erudin
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(24, 30, -130, 40, 180);
            }
            elsif($qglobals{OOW_PoD_Origin} == 41) { # Neriak
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(41, -564, -43, -37, 192);
            }
            elsif($qglobals{OOW_PoD_Origin} == 10) { # East Freeport
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(10, -682, 146, -51, 192);
            }
            elsif($qglobals{OOW_PoD_Origin} == 61) { # Felwithe
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(61, -289, 10, 4, 192);
            }
            elsif($qglobals{OOW_PoD_Origin} == 54) { # Kelethin(Greater Faydark)
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(54, 215, 232, 2, 192);
            }
            elsif($qglobals{OOW_PoD_Origin} == 29) { # Halas
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(29, 47, 123, 4, 10);
            }
            elsif($qglobals{OOW_PoD_Origin} == 49) { # Oggok
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(49, 500, 220, 60, 10);
            }
            elsif($qglobals{OOW_PoD_Origin} == 2) { # Qeynos
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(2, 227, 22, 3, 10);
            }
            elsif($qglobals{OOW_PoD_Origin} == 19) { # Rivervale
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(19, -110, -16, 4, 192);
            }
            elsif($qglobals{OOW_PoD_Origin} == 55) { # Ak`Anon
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(55, -153, 500, -18, 66.1);
            }
            elsif($qglobals{OOW_PoD_Origin} == 60) { # Kaladim
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(60, 26, 38, 4, 65);
            }
            elsif($qglobals{OOW_PoD_Origin} == 155) { # Shar Vahl
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(155, 89, -849, -189, 180);
            }
            elsif($qglobals{OOW_PoD_Origin} == 50) { # Gukta(Rathe Mountains)
                quest::delglobal("OOW_PoD_Origin");
                quest::movepc(50, 653, -2217, 2, 100);
            }
        }
        else {
            quest::say("I do not know from whence you came."); # Text made up
            quest::movepc(202, 582, 49, 4, 192); # Plane of Knowledge
        }
    }
}

#END of FILE Zone:Dranik's Scar  ID:302044 -- Priest_of_Discord
