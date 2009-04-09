sub EVENT_SAY { 
if($text=~/what new spells/i){
quest::say("Within this lost land could lie the knowledge of extinct civilizations.  I am ordered to seek out this knowledge for the empire of Neriak.  So far. all I have discovered is a way to create a spell of my own design.  I call it [Brain Bite].");
}
if($text=~/what brain bite/i){
quest::say("If you wish to own a copy of MY spell. Brain Bite. I would be glad to give you one.  All I ask is that you [gather a few souls] for me.");
}
if($text=~/who interlopers/i){
quest::say("The garrison report was sloppy. to say the least.  They informed me that Hampton was slain near some ruins within a jungle infested by raptors.  Mardon was slain in an ancient city found deep in a jungle.  Ryla was killed in a hidden fortress guarded by fierce armored wolves who walked on their hind legs.");
}
if($text=~/i will take the bottles/i){
quest::say("The bottles also require a gem.  You will fetch me the three gems and I will prepare the bottles and give them to you to finish the job.  I need an onyx. a peridot and a star rose quartz."); }
}
#END of FILE Zone:overthere  ID:93106 -- Dyth_X`Teria 

