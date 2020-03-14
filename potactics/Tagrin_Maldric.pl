#Tagrin Maldric is the blacksmith of the Zeks, and is part of obtaining Black Insanity (Zek bane) weapons. When aggro'd, he spawns 5 animated swords, who drop the actual ore for the bane weapons.

sub EVENT_COMBAT { 
  if ($combat_state == 1 && !$entity_list->IsMobSpawnedByNpcTypeID(214119)){
    quest::spawn2(214119,0,0,$x-15,$y-15,$z,$h); # NPC: Animated_Decorin_Blade
    quest::spawn2(214119,0,0,$x+15,$y-15,$z,$h); # NPC: Animated_Decorin_Blade
    quest::spawn2(214119,0,0,$x-15,$y+10,$z,$h); # NPC: Animated_Decorin_Blade
    quest::spawn2(214119,0,0,$x+15,$y+10,$z,$h); # NPC: Animated_Decorin_Blade
    quest::spawn2(214119,0,0,$x,$y-15,$z,$h); # NPC: Animated_Decorin_Blade
  }
}
