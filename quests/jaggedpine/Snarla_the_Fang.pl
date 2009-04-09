sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Shhh. quiet! This is place of solitude and peace! You [respect temple] while you here if you know what good for you!");
}
if($text=~/i respect the temple/i){
quest::say("One way guests show respect is to bring the host [food]. Something really good would be nice.");
}
if($text=~/what food/i){
quest::say("Lessee. . . Dryad Pate is what I want. Bring me some [Dryad Pate] and then you be a good guest. Maybe then I return a favor for you.");
}
if($text=~/what dryad pate/i){
quest::say("I don't know how it made. Talk to the Braguss about it. He the cook.");
}
if($text=~/i respect temple/i){
quest::say("One way guests show respect is to bring the host [food]. Something really good would be nice."); }
}
#END of FILE Zone:jaggedpine  ID:181125 -- Snarla_the_Fang 

