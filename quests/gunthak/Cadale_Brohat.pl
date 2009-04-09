#zone: gunthak NPC: Cadale_Brohat (224209)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::emote("smiles widely at you. 'Welcome. You are brave to venture to Broken Skull Rock. Don't mind the others. Everyone is a bit touchy around here. If you are interested in dyes, feel free to peruse what I have to offer. Playing with them has given me hours of entertainment! Just be careful on this rock, and watch your back. Oh, before I forget, I'm looking for someone to help me with some [tasks] that I need to get done. All my time with the dyes has kept me from some of the more important things I need to take care of.'");
  # quest::say("Welcome. You are brave to venture to Broken Skull Rock. Don't mind the others. Everyone is a bit touchy around here. If you are interested in dyes, feel free to peruse what I have to offer. Playing with them has given me hours of entertainment! Just be careful on this rock, and watch your back. Oh, before I forget, I'm looking for someone to help me with some [tasks] that I need to get done. All my time with the dyes has kept me from some of the more important things I need to take care of.");
 }
}