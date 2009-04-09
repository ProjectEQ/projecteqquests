sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Fleshy mortal, can you not see that I am cursed to live in eternal anguish? What is it that you seek from me?");
}
if($text=~/Where is Vex Thal/i){
quest::say("The city of shadow is sealed by powerful magic. Only one that wears the talisman of Akelha Ra can pass through the seals on the gate. I have not been beyond the gates but rumors of dark prophets that possess great power have been heard throughout the ages.");
}
if($text=~/What dark prophets/i){
quest::say("Only legends and rumors have circulated about the dark prophets in Vex Thal. I suspect that they are the reason for my eternally cursed state. If you could find someway to defeat the dark prophet leading those in Vex Thal and bring me back proof of the deed, I shall reward you with an ancient relic that I possess.");
}
}

sub EVENT_ITEM {
if($itemcount{8365} == 1) {
quest::say("$name, you have done more than was ever expected. Take this and my blessing will be with you always.");
quest::exp(670);
quest::summonitem(8364);
}
}
#END of FILE Zone:umbral ID:176013 -- remains_of_Vah_Kerrath 