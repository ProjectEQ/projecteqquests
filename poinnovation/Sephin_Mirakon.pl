sub EVENT_SAY {

if($text=~/Hail/i) {

quest::say("You there! Had enough yet? . . . Aah, never mind, just tell me when you want to [leave].");

}

if($text=~/leave/i) {

quest::movepc(206,221,555,-50,102);
 
}
}