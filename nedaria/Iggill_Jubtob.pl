# Gather Claws
# created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

quest::say("Ahoy dere, $name! Me been making special goo for hull. Me goo protect boat from bad tings in da waters. Me needs help getting parts. You [help] Iggill?"); 
}

if($text=~/help/i){

quest::say("Good newz! Gets me four panther claws from doze animals in da hills. Bring dem and me give you sumting and maybe story too!"); 
}
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 66185 => 4)) { # panther claws

quest::say("Dats a big help for Iggill. Take dis as reward."); 
quest::exp(10000);
quest::givecash(15,8,10,6);

}
}

#END of FILE zone:nedaria ID:182037 -- Iggill_Jubtob.pl

