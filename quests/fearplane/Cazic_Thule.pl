# Call Dread, Fright & Terror to aid Cazic Thule if they're still alive
# code by mystic414
#
# Cazic Thule also administers the Whistling Fists quest for iksar monks

sub EVENT_SPAWN {
  quest::settimer("Shout",600);
}

sub EVENT_SAY {
 if($text=~/gandan has failed in his task/i) {
  quest::emote("'s thoughts begin to pervade your own, they creep into your mind with great force. You feel pressure as if your head will explode. You see his thoughts becoming your own. You see in these visions a tome bound in flesh dropped to the ground. You then open your eyes to see that same book, and take it knowing that it was meant for you.");
  quest::summonitem(18898);
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 8226 => 1, 18898 => 1, 18899 => 1)){
  quest::emote("seems pleased with the amount of pain that you have been able to inflict. Cazic Thule then grabs your hands and begins to infuse them with his power. Your hands burn like they were placed in lava for a moment, then feel cool as ice. You can feel the sheer power flowing through your new weapons of pain.");
  quest::summonitem(7836);
  quest::exp(100000);
  quest::ding();
 }
 else{ 
 plugin::return_items(\%itemcount);
 quest::emote("That is not what I sent you for, my child."); #Made this up
 }
}

sub EVENT_AGGRO {
  quest::shout("Denizens of Fear, your master commands you to come forth to his aid!!");
  quest::signalwith(72000,1,0);
  quest::signalwith(72004,1,0);
  quest::signalwith(72002,1,0);
  my $dread_mob = $entity_list->GetMobByNpcTypeID(72000);
  my $fright_mob = $entity_list->GetMobByNpcTypeID(72004);
  my $terror_mob = $entity_list->GetMobByNpcTypeID(72002);
  if ($dread_mob) {
    my $dread_mobnpc = $dread_mob->CastToNPC();
    $dread_mobnpc->AddToHateList($client, 1);
  }
  if ($fright_mob) {
    my $fright_mobnpc = $fright_mob->CastToNPC();
    $fright_mobnpc->AddToHateList($client, 1);
  }
  if ($terror_mob) {
    my $terror_mobnpc = $terror_mob->CastToNPC();
    $terror_mobnpc->AddToHateList($client, 1);
  }
}

sub EVENT_TIMER {
 if ($timer eq "Shout") {
  quest::shout("Beware all infidels who dare to taint my plane, for I shall rend your minds with fright, dread, and terror!");
  quest::signalwith(72000,0,0);
  quest::signalwith(72001,0,0);
  quest::signalwith(72002,0,0);
  quest::signalwith(72004,0,0);
  quest::signalwith(72005,0,0);
  quest::signalwith(72006,0,0);
  quest::signalwith(72007,0,0);
  quest::signalwith(72008,0,0);
  quest::signalwith(72009,0,0);
  quest::signalwith(72010,0,0);
  quest::signalwith(72011,0,0);
  quest::signalwith(72012,0,0);
  quest::signalwith(72013,0,0);
  quest::signalwith(72014,0,0);
  quest::signalwith(72015,0,0);
  quest::signalwith(72016,0,0);
  quest::signalwith(72017,0,0);
  quest::signalwith(72018,0,0);
  quest::signalwith(72019,0,0);
  quest::signalwith(72020,0,0);
  quest::signalwith(72021,0,0);
  quest::signalwith(72022,0,0);
  quest::signalwith(72023,0,0);
  quest::signalwith(72024,0,0);
  quest::signalwith(72025,0,0);
  quest::signalwith(72026,0,0);
  quest::signalwith(72027,0,0);
  quest::signalwith(72028,0,0);
  quest::signalwith(72029,0,0);
  quest::signalwith(72030,0,0);
  quest::signalwith(72031,0,0);
  quest::signalwith(72032,0,0);
  quest::signalwith(72033,0,0);
  quest::signalwith(72034,0,0);
  quest::signalwith(72035,0,0);
  quest::signalwith(72036,0,0);
  quest::signalwith(72037,0,0);
  quest::signalwith(72038,0,0);
  quest::signalwith(72039,0,0);
  quest::signalwith(72040,0,0);
  quest::signalwith(72041,0,0);
  quest::signalwith(72042,0,0);
  quest::signalwith(72043,0,0);
  quest::signalwith(72044,0,0);
  quest::signalwith(72045,0,0);
  quest::signalwith(72046,0,0);
  quest::signalwith(72047,0,0);
  quest::signalwith(72048,0,0);
  quest::signalwith(72049,0,0);
  quest::signalwith(72050,0,0);
  quest::signalwith(72051,0,0);
  quest::signalwith(72052,0,0);
  quest::signalwith(72053,0,0);
  quest::signalwith(72054,0,0);
  quest::signalwith(72055,0,0);
  quest::signalwith(72056,0,0);
  quest::signalwith(72057,0,0);
  quest::signalwith(72058,0,0);
  quest::signalwith(72059,0,0);
  quest::signalwith(72060,0,0);
  quest::signalwith(72061,0,0);
  quest::signalwith(72062,0,0);
  quest::signalwith(72063,0,0);
  quest::signalwith(72064,0,0);
  quest::signalwith(72065,0,0);
  quest::signalwith(72066,0,0);
  quest::signalwith(72067,0,0);
  quest::signalwith(72070,0,0);
  quest::signalwith(72071,0,0);
  quest::signalwith(72072,0,0);
  quest::signalwith(72073,0,0);
  quest::signalwith(72074,0,0);
  quest::signalwith(72075,0,0);
  quest::signalwith(72076,0,0);
  quest::signalwith(72077,0,0);
  quest::signalwith(72078,0,0);
  quest::signalwith(72079,0,0);
  quest::signalwith(72080,0,0);
  quest::signalwith(72081,0,0);
  quest::signalwith(72082,0,0);
  quest::signalwith(72083,0,0);
  quest::signalwith(72084,0,0);
  quest::signalwith(72085,0,0);
  quest::signalwith(72086,0,0);
  quest::signalwith(72087,0,0);
  quest::signalwith(72088,0,0);
  quest::signalwith(72089,0,0);
  quest::signalwith(72090,0,0);
  quest::signalwith(72091,0,0);
  quest::signalwith(72092,0,0);
  quest::signalwith(72093,0,0);
  quest::signalwith(72094,0,0);
  quest::signalwith(72095,0,0);
  quest::signalwith(72096,0,0);
  quest::signalwith(72102,0,0);
  quest::signalwith(72103,0,0);
  quest::signalwith(72107,0,0);
 }
}

#(Aggro) Created by Mystic414, (Say, Item, Spawn and Timer) Additions by Jim Mills