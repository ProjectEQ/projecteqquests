#Quests covered in this file:
#Shaman Skull Quest 8

sub EVENT_ITEM {
  if((defined($qglobals{shmskullquest}) && ($qglobals{shmskullquest} >= 13)) && plugin::check_handin(\%itemcount, 30994 => 1)) { #Iksar Relics
    quest::unique_spawn(105182,0,0,$x,$y,$z); #Venril Sathir
    quest::unique_spawn(105186,0,0,$x+5,$y-5,$z); #an Arisen Disciple
    quest::unique_spawn(105183,0,0,$x+5,$y+5,$z); #an Arisen Priest
    quest::unique_spawn(105184,0,0,$x-5,$y+5,$z); #an Arisen Necromancer
    quest::unique_spawn(105185,0,0,$x-5,$y-5,$z); #an Arisen Acolyte
    quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}