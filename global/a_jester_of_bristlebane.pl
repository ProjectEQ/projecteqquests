# quests/templates/a_jester_of_bristlebane.pl
#
# Quest file for Chaotic Jester Veteran AA
#
# The GetRandomClient code posted by Kayen on EQEmu forums.
#
sub GetRandomClient {

        my $ListCheck = 0;
        my $LastClient = 0;

        for ($ListCheck = 0; $ListCheck < 2000; $ListCheck++) {

                $ClientSearch = $entity_list->GetClientByID($ListCheck);

                if ($ClientSearch) {
                        my $DistanceCheck = $ClientSearch->CalculateDistance($x, $y, $z);
                        if ($DistanceCheck <= 100) {
                                my $ChooseClient = quest::ChooseRandom(1,2);
                                if ($ChooseClient == 2) {
                                        return $ClientSearch->GetID();
                                }
                                else {
                                        $LastClient = $ClientSearch;
                                }
                        }
                }

        }
        return $npc->GetFollowID();
}

sub EVENT_SPAWN {
        quest::settimer("RandomAction", 30);
        quest::settimer("Depop", 900);
}

sub EVENT_TIMER {

        if($timer eq "Depop") {
                quest::depop();
        }

        my $action = quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10,11,12,13,14);

        if($action == 1) {
                $ClientID = GetRandomClient();
                if($ClientID > 0) {
                        $c = $entity_list->GetClientByID($ClientID);
                        if($c) {
                                quest::say("How about a little wine to quench your thirst?");
                                $c->SummonItem(quest::ChooseRandom(64046, 64047), 10);
                        }
                }
        }
        elsif($action == 2) {
                quest::say("I used to work nights as an entertainer for Fennin Ro. . .then he fired me.");
        }
        elsif($action == 3) {
                quest::say("My puns seem to get worse the older I get.  I guess I'm groaning up.");
        }
        elsif($action == 4) {
                $ClientID = GetRandomClient();
                if($ClientID > 0) {
                        quest::say("You need to be more down to earth.");
                        $npc->CastSpell(345, $ClientID);
                }
        }
        elsif($action == 5) {
                quest::say("You have the life expectancy of a blind elf in Kelethin.");
        }
        elsif($action == 6) {
                quest::say("What do you call an angry Berserker?  Anything they want you to!");
        }
        elsif($action == 7) {
                quest::say("What did one ranger say to the other ranger at the local pub?  Bind here often?");
        }
        elsif($action == 8) {
                $ClientID = GetRandomClient();
                if($ClientID > 0) {
                        quest::say("How's the weather up there?");
                        $npc->CastSpell(2522, $ClientID);
                }
        }
        elsif($action == 9) {
                $c = GetRandomClient();
                if($c > 0) {
                        quest::say("You look exhausted.");
                        $npc->CastSpell(6897, $c, 10, 0);
                }
        }
        elsif($action == 10) {
                $ClientID = GetRandomClient();
                if($ClientID > 0) {
                        $c = $entity_list->GetClientByID($ClientID);
                        if($c) {
                                quest::say("Try a bite of my tasty bread.  I make it myself.");
                                $c->SummonItem(quest::ChooseRandom(64044, 64045), 10);
                        }
                }
        }
        elsif($action == 11) {
                quest::say("This place really needs to lighten up.");
                $npc->CastSpell(30, 0, 10, 0);
        }
        elsif($action == 12) {
                quest::say("I've always heard that change must come from within but this is ridiculous.");
                $ClientID = GetRandomClient();
                if($ClientID > 0) {
                        $c = $entity_list->GetClientByID($ClientID);
                        if($c) {
                                $c->BuffFadeByEffect(58);
                                $IllusionSpell = quest::ChooseRandom(586, 590, 591, 587, 1731, 3063, 595, 583, 594, 589, 582, 243, 593);
                                $c->CastSpell($IllusionSpell, $ClientID, 10, 0);
                        }
                }
        }
        elsif($action == 13) {
                quest::say("I think monks use that 'weight thing' as an excuse to make me carry their bags.");
        }
        elsif($action == 14) {
                quest::say("Next time you visit the Plane of Mischief, say hello to the merry mushroom men for me.  Fun guys, all of them.");
        }
        else {
        }

}