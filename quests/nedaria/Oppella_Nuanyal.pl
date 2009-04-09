# Gather skins
# created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

quest::say("Greetings, fair $name. I need a bit of help collecting some cove frog skins if you have a bit of time. I can't talk too long as there is much to do, so if you're willing to give me a [hand], just let me know. If you help me, I might have a secret for you too."); 
}

if($text=~/hand/i){

quest::say("Wonderful! If you could hunt down four cove frog skins from around here, I can start producing a lot more material for the brotherhood."); 
}
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 66188 => 4)) { # cave frog skin

quest::say("This is superb, $name! I was running low. I suppose I can tell you what my job is. I'm here to make riggings for the ship. It turns out that the cove frog skins are strong components for the riggings I'm working on. Who would've thought, huh?"); 
quest::exp(10000);
quest::givecash(5,11,8,0);

}
}

#END of FILE zone:nedaria ID:182038 -- Oppella_Nuanyal.pl

