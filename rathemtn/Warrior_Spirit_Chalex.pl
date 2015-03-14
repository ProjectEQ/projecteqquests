# Warrior Spirit Chalex
# Illusion: Guktan, good quest: http://everquest.allakhazam.com/db/quest.html?quest=2605
# added 2009 BWstripes - because we can!
#
# Mob info: http://eqbeastiary.allakhazam.com/search.shtml?id=12808
# L50 Undead Froglok (old) wielding quest item Marr's Retribution
# spawns after handing the Marr's Retribution to "a pile of froglok remains."

sub EVENT_SPAWN {
  quest::emote("appears emanating a powerful yet ghastly aura."); #Text modified as quest::echo not working
  quest::say("Your kindness has given me a chance to finish that which I started. While I thank thee for restoring my blade and bringing it to me, I am not worthy to wield it until I have destroyed the one who killed me. Please hold my sword until I have redeemed myself by vanquishing the vile Troll Captain Krignok.");
  quest::settimer(5,600); # 10 minute timer, then just depop
  quest::settimer(1,4); # 4s break for the text
  quest::settimer(2,10); # 15s break for the shouts
  quest::settimer(3,15); # 25s break for the chaos
}


sub EVENT_TIMER {

  if ($timer == 1) {
    quest::say("Now, I must ask that you protect me, I can feel his presence close by and once again he is not alone.");
    quest::moveto(-1950.1,2713.3,3.3); # Wander over to spawnpoint This is slightly improvised as there is no mob location data.
    quest::stoptimer(1);
  }

  if ($timer == 2) {
    quest::shout("Come forth coward, this time we fight on equal terms!");
    my $entid = quest::spawn2(50331,0,0,-1960.1,2713.3,3.3,149.0); # Spawn Troll Captain Krignok - even whilst writing this, "unmatched paladin", lol. I had to nerf Krignok so Chalek would win.
    my $mob = $entity_list->GetMobID($entid); # This little section adds Warrior_spirit_chalex to the hatelist - thanks, Itchy for the example.
    my $mobnpc = $mob->CastToNPC(); # Shamelessly lifted from iceclad/a_lost_pirate.pl
    $mobnpc->AddToHateList($npc, 1);
    quest::stoptimer(2);
  }

  if ($timer == 3) {
    quest::shout("Give it up Krignok, you are outmatched when facing a paladin of Mithaniel Marr!");
    quest::stoptimer(3);
  }

  if ($timer == 5) {
    quest::stoptimer(5);
    quest::depop();
  }
}

sub EVENT_COMBAT {
  if ($combat_state == 0) {
  quest::stoptimer(5);
  quest::depop();
  quest::spawn2(50330,0,0,$x,$y,$z,$h); # Spawn Chalex_the_Redeemed
  }
}