sub EVENT_AGGRO {
  quest::say("I shall pluck you limb from limb!!");
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Me hear dat dere are humans, elves and other weaklings hunting in da swamp."); }
}

sub EVENT_SLAY {
  quest::say("Those who play with da Basher always gets bashed good!!");
}

#END of FILE Zone:innothule  ID:228 -- Basher_Sklama 

