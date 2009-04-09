sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("A warm hello to you. $name! Please make yourself at home here in the serene locale of Sunset Home. Here you can forget about the [queue]. and enjoy the company of your fellow guides!");
}
if($text=~/What queue?/i){
quest::say("Queue? What queue? We don't need no stinkin' QUEUE!' Starzin glances around and giggles gleefully. then whispers. 'Just don't tell anyone else!"); }
}
#END of FILE Zone:cshome  ID:122380 -- Starzin_the_Sweet_One 

