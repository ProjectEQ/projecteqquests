#Quests covered in this file:
#Shaman Skull Quest 8

sub EVENT_ITEM
{
    #Turn in the Iksar Relics
   if(plugin::check_handin(\%itemcount, 30994 => 1) && $shmskullquest >= 13)
   {
   quest::depop();
   quest::unique_spawn(105182,0,0,$x,$y,$z); #spawn Venril Sathir (Charasis mode)
   quest::unique_spawn(105186,0,0,$x + 5,$y,$z - 5); #spawn an Arisen Disciple
   quest::unique_spawn(105183,0,0,$x + 5,$y,$z + 5); #spawn an Arisen Priest
   quest::unique_spawn(105184,0,0,$x - 5,$y,$z + 5); #spawn an Arisen Necromancer
   quest::unique_spawn(105185,0,0,$x - 5,$y,$z - 5); #spawn an Arisen Acolyt
   }
}