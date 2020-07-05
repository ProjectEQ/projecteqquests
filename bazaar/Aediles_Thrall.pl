############################################
# ZONE: Bazaar
# DATABASE: PEQ PoP-LoY
# LAST EDIT DATE: July 10, 2009
# VERSION: 1.0
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Aediles Thrall
# TYPE: NPC
# RACE: Dwarf
# LEVEL: 71
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Fish Rolls ID-13475
# Gnomish Spirits ID-13037
# Small Bowl ID-16939
# Studded Tunics ID-2204
# Banded Bracer ID-3061
# Class 4 Ceramic Hooked Arrows ID-8689
# Flag updates for quest global bot_spawn_limit
#
#
# *** QUESTS INVOLVED IN ***
#
# 1 - Custom Quest - Buying Slaves(bots)
#
#
# *** QUESTS AVAILABLE TO ***
#
# 1 - Anyone meeting level requirements
#
#
############################################
# items: 13475, 13037, 16939, 2204, 3061, 8689

# Some global settings for the quest.  Set them to your preferred levels and plat costs
# Level options for when a character can acquire more slaves(bots)
my $firstbotlevel  = 10;
my $firstbotcost   = 100;
my $secondbotlevel = 15;
my $secondbotcost  = 200;
my $thirdbotlevel  = 20;
my $thirdbotcost   = 300;
my $fourthbotlevel = 25;
my $fourthbotcost  = 400;
my $fifthbotlevel  = 30;
my $fifthbotcost   = 500;

# They have enough for one group, now they start creating raid bots up to the quest::spawnbotcount() limit.
# A rule setting EQOffline:SpawnBotCount of 11 is two full groups including you.
my $nextbotlevel   = 45;
my $nextbotcost    = 1000;
my $nextextracost  = 1500;

sub EVENT_SAY {
   if(defined $qglobals{bot_spawn_limit} && (quest::spawnbotcount() > $qglobals{bot_spawn_limit})) {
      if(($ulevel >= $firstbotlevel) && ($qglobals{bot_spawn_limit} <= 0)) {
         quest::settimer("face", 25);
         if($text=~/Hail/i) {
            quest::say("Hey der youngster.  Lookin' fer a bit o' [help] with yer adventurin'?");
         }
         if($text=~/Help/i) {
            quest::emote("looks around the room and pauses a few seconds");
            quest::say("Well, I kin sell ye a [product] ye can't find no place else.");
         }
         if($text=~/Product/i) {
            quest::emote("looks around the room again");
            quest::say("Shhh, i'm involved in wut I like ta call A.I.D., I kin [AID] ye in yer adventurin'");
         }
         if($text=~/AID/i) {
            quest::emote("looks around the room again");
            quest::say("It be 'Acquired Individuals Delivery' and it means I kin supply ye with [Individuals].");
         }
         if($text=~/Individuals/i) {
            quest::emote("looks around the room again");
            quest::say("Shhh, not too loud... I kin deliver ye an Individual if yer [interested]?");
         }
         if($text=~/Interested/i) {
            quest::say("Let me tell ye, keepin' up a supply o' Individuals can be a costly endeavor and so's I kin feed 'em I need ye ta be collectin' up sum [supplies] fer me.");
         }
         if($text=~/Supplies/i) {
            quest::say("The Individual will cost ye $firstbotcost platinum pieces an' 4 o' dem Fish Rolls.");
         }
      }
      elsif(($ulevel >= $secondbotlevel) && ($qglobals{bot_spawn_limit} <= 1)) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $secondbotcost platinum an' 4 o' dem Gnomish Spirits... heh, dey gets thirsty ya knows.");
         }
      }
      elsif(($ulevel >= $thirdbotlevel) && ($qglobals{bot_spawn_limit} <= 2)) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $thirdbotcost platinum an' 4 o' dem Small Bowls... heh, dey needs ta eat outta sumtin' ya knows.");
         }
      }
      elsif(($ulevel >= $fourthbotlevel) && ($qglobals{bot_spawn_limit} <= 3)) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $fourthbotcost platinum an' 4 o' dem Studded Tunics ta keeps da Individuals warm.");
         }
      }
      elsif(($ulevel >= $fifthbotlevel) && ($qglobals{bot_spawn_limit} <= 4)) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $fifthbotcost platinum an' 4 o' dem Banded Bracers ta keeps da Individuals protected.");
         }
      }
      elsif(($ulevel >= $nextbotlevel) && ($qglobals{bot_spawn_limit} <= 5)) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $nextbotcost platinum an' 4 o' dem Small Nock Class 4 Ceramic Hooked Arrows for shootin' at dem runaway Individuals.");
         }
      }
      elsif(($ulevel >= $nextbotlevel) && ($qglobals{bot_spawn_limit} >= 6)) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $nextbotcost platinum an' 4 o' dem Small Nock Class 4 Ceramic Hooked Arrows for shootin' at dem runaway Individuals.");
            quest::say("If ye dun have dem arrows, ye can just pay me $nextextracost platinum.");
         }
      }
      else {
         if($text=~/Hail/i) {
            quest::say("eh? Come back when yer a bit older. I kin help ye then.");
            quest::settimer("face", 5);
         }
      }
   }
   else {
      if($text=~/Hail/i) {
         quest::say("eh? Mind yer own business, go away!");
         quest::settimer("face", 5);
         my $sbcount = quest::spawnbotcount();
         $client->Message(6,"You have $qglobals{bot_spawn_limit} out of $sbcount possible Individuals.");
      }
   }
}

sub EVENT_TIMER {
  if($timer eq "face") {
     my $facemob = $entity_list->GetMobByNpcTypeID(151071);
     $npc->FaceTarget($facemob);
     quest::stoptimer("face");
  }
}

sub EVENT_ITEM {
   if(defined $qglobals{bot_spawn_limit} && (quest::spawnbotcount() > $qglobals{bot_spawn_limit})) {
      my $success = 0;
      if(($ulevel >= $firstbotlevel) && ($qglobals{bot_spawn_limit} <= 0)) {
         if(($platinum == $firstbotcost) && plugin::check_handin(\%itemcount, 13475 => 4)) { #baking
            $success = $qglobals{bot_spawn_limit}+1;
         }
      }
      elsif(($ulevel >= $secondbotlevel) && ($qglobals{bot_spawn_limit} <= 1)) {
         if(($platinum == $secondbotcost) && plugin::check_handin(\%itemcount, 13037 => 4)) { #brewing
            $success = $qglobals{bot_spawn_limit}+1;
         }
      }
      elsif(($ulevel >= $thirdbotlevel) && ($qglobals{bot_spawn_limit} <= 2)) {
         if(($platinum == $thirdbotcost) && plugin::check_handin(\%itemcount, 16939 => 4)) { #pottery
            $success = $qglobals{bot_spawn_limit}+1;
         }
      }
      elsif(($ulevel >= $fourthbotlevel) && ($qglobals{bot_spawn_limit} <= 3)) {
         if(($platinum == $fourthbotcost) && plugin::check_handin(\%itemcount, 2204 => 4)) { #tailoring/smithing
            $success = $qglobals{bot_spawn_limit}+1;
         }
      }
      elsif(($ulevel >= $fifthbotlevel) && ($qglobals{bot_spawn_limit} <= 4)) {
         if(($platinum == $fifthbotcost) && plugin::check_handin(\%itemcount, 3061 => 4)) { #smithing
            $success = $qglobals{bot_spawn_limit}+1;
         }
      }
      elsif(($ulevel >= $nextbotlevel) && ($qglobals{bot_spawn_limit} <= 5)) {
         if(($platinum == $nextbotcost) && plugin::check_handin(\%itemcount, 8689 => 4)) { #fletching
            $success = $qglobals{bot_spawn_limit}+1;
         }
      }
      elsif(($ulevel >= $nextbotlevel) && ($qglobals{bot_spawn_limit} >= 6)) {
         if(($platinum == $nextextracost) || (($platinum == $nextbotcost) && plugin::check_handin(\%itemcount, 8689 => 4))) {
            $success = $qglobals{bot_spawn_limit}+1;
         }
      }
      if($success > 0) {
         quest::say("Thanks $name!");
         quest::setglobal("bot_spawn_limit", $success, 5, "F");
         $client->Message(6,"You receive a character flag!");
         $client->Message(6,"You can now create and spawn an Individual! See: '#bot help create' and '#bot spawn' commands.");
         my $sbcount = quest::spawnbotcount();
         $client->Message(6,"You have $success out of $sbcount possible Individuals.");
         $success = 0;
      }
      else {
         if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
         }
      }
   }
   else {
      if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
         quest::givecash($copper, $silver, $gold, $platinum);
      }
   }
   plugin::return_items(\%itemcount);
   quest::settimer("face", 45);
}

sub EVENT_SPAWN {
   quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
   if(quest::botquest()) {
      if(!defined $qglobals{bot_spawn_limit}) {
         quest::setglobal("bot_spawn_limit", 0, 5, "F");
      }
   }
}

sub EVENT_SIGNAL {
   if($signal == 1) {
      if((defined $qglobals{bot_spawn_limit}) && ($qglobals{bot_spawn_limit} > 0)) {
         quest::say("Hey! No talkin' to da merchandise!");
      }
   }
}
# END of FILE Zone:bazaar -- Aediles_Thrall.pl

