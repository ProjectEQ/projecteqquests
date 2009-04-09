#zone: tutorialb
#Revised Angelox

sub EVENT_SAY {
 $deity = $client->GetDeity();
  if ($text=~/hail/i){
  quest::say("Thank you for helping our rebellion. If you wish to [escape] at any time simply let me know.");
 }
  elsif (($text=~/escape/i&&$race eq 'Wood Elf')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(54,-197,27,-0.7);
}
  elsif (($text=~/escape/i&&$race eq 'Human'&&$class eq 'Enchanter')){
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(45,-343,189,-38.22);
}
  elsif (($text=~/escape/i&&$race eq 'Human'&&$class eq 'Cleric')){
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(45,-343,189,-38.22);
}
  elsif (($text=~/escape/i&&$race eq 'Human'&&$class eq 'Necromancer')){
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(45,-343,189,-38.22);
}
  elsif (($text=~/escape/i&&$race eq 'Human'&&$class eq 'Magician')){
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(45,-343,189,-38.22);
}
  elsif (($text=~/escape/i&&$race eq 'Human'&&$class eq 'Shadowknight')){
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(45,-343,189,-38.22);
}
  elsif (($text=~/escape/i&&$race eq 'Human')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(9,-60.9,-61.5,-24.9);
}
  elsif (($text=~/escape/i&&$race eq 'Erudite'&&$deity == 203)) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(75,200,800,3.39);
}
  elsif (($text=~/escape/i&&$race eq 'Erudite')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(24,-309.8,109.6,23.1);
}
  elsif (($text=~/escape/i&&$race eq 'High Elf')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(61,26.3,14.9,3.1);
}
  elsif (($text=~/escape/i&&$race eq 'Barbarian')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(29,12.2,-32.9,3.1);
}
  elsif (($text=~/escape/i&&$race eq 'Dark Elf')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(25,-965.3,2434.5,5.6);
}
  elsif (($text=~/escape/i&&$race eq 'Half Elf')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(9,-60.9,-61.5,-24.9);
}
  elsif (($text=~/escape/i&&$race eq 'Dwarf')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(68,-214.5,2940.1,0.1);
}
  elsif (($text=~/escape/i&&$race eq 'Troll')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(52,1.1,14.5,3.1);
}
  elsif (($text=~/escape/i&&$race eq 'Ogre')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(49,520.1,235.4,59.1);
}
  elsif (($text=~/escape/i&&$race eq 'Halfling')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(19,-98.4,11.5,3.1);
}
  elsif (($text=~/escape/i&&$race eq 'Gnome')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(55,7.6,489.0,-24.9);
}
  elsif (($text=~/escape/i&&$race eq 'Froglok')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(50,560,-2234,3);
}
  elsif (($text=~/escape/i&&$race eq 'Vah Shir')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(155,105.6,-850.8,-190.4);
}
  elsif (($text=~/escape/i&&$race eq 'Iksar')) {
  quest::say("Here I'll show you how to get out. Come and help us again!");
  quest::delglobal("$name");
  quest::movepc(106,-415.7,1276.6,3.1);
}else{
    quest::say("Ooops! Looks like the Boss-Man missed one! Please tell him.")
 }
}
