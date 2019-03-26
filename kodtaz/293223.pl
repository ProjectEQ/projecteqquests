sub EVENT_DEATH_COMPLETE {
  quest::spawn2(293224,0,0,$x - 10,$y,$z,$h); # NPC: #Ageless_Relic_Protector
  quest::spawn2(293224,0,0,$x + 10,$y,$z,$h); # NPC: #Ageless_Relic_Protector
  quest::spawn2(293224,0,0,$x,$y - 10,$z,$h); # NPC: #Ageless_Relic_Protector
}