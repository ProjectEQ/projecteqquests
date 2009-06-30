sub EVENT_ENTERZONE {

  if(!defined $qglobals{tutbind} && $ulevel == 1) {
    quest::selfcast(2049);
    quest::setglobal("tutbind",1,1,"D30");
  }
  if(!defined $qglobals{tutpop}) {
  quest::popup("Join the revolution!", "<br>&nbsp;&nbsp; &nbsp;&nbsp;Welcome to the Mines of Gloomingdeep. Your fellow captives
                                        need your help to fight the kobolds.  When you are ready to leave the tutorial, talk to
                                        Arias and he will show you the way to your home city.  Should you decide to leave, you
                                        will be able to return to the tutorial from the character select screen until you are
                                        level ten.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;If you need to refresh your memory on topics
                                        that we have already covered, feel free to click on the question mark icon on the
                                        <c \"#00A000\">Toolbar</c> located at the top of your screen.
                                      <br ><br>&nbsp;&nbsp;&nbsp;&nbsp;<c \"#F07F00\">Click 'OK' to continue .</c>");
  quest::assigntask(22);
  quest::assigntask(23);
  quest::setglobal("tutpop",1,1,"D30");
  }
  if($ulevel > 15 && $status < 80){
   $client->Message(15,"You are too high in level to be in this zone.");
   quest::selfcast(2433);
}  
 }

sub EVENT_TASK_STAGE_COMPLETE {
   if ($task_id == 34)
   {
      quest::ze(15, "A cheer arises from the slaves as the last of the Kobold overseers fall.");
   }
} 

EVENT_CLICKDOOR {
 $deity = $client->GetDeity();
  if ($doorid == 11 || $doorid == 267 && $race eq 'Wood Elf') {
  quest::movepc(54,-197,27,-0.7);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Human' && $class eq 'Enchanter'){
  quest::movepc(45,-343,189,-38.22);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Human' && $class eq 'Cleric'){
  quest::movepc(45,-343,189,-38.22);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Human' && $class eq 'Necromancer'){
  quest::movepc(45,-343,189,-38.22);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Human' && $class eq 'Magician'){
  quest::movepc(45,-343,189,-38.22);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Human' && $class eq 'Shadowknight'){
  quest::movepc(45,-343,189,-38.22);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Human') {
  quest::movepc(9,-60.9,-61.5,-24.9);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Erudite' && $deity == 203) {
  quest::movepc(75,200,800,3.39);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Erudite') {
  quest::movepc(24,-309.8,109.6,23.1);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'High Elf') {
  quest::movepc(61,26.3,14.9,3.1);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Barbarian') {
  quest::movepc(29,12.2,-32.9,3.1);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Dark Elf') {
  quest::movepc(25,-965.3,2434.5,5.6);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Half Elf') {
  quest::movepc(9,-60.9,-61.5,-24.9);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Dwarf') {
  quest::movepc(68,-214.5,2940.1,0.1);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Troll') {
  quest::movepc(52,1.1,14.5,3.1);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Ogre') {
  quest::movepc(49,520.1,235.4,59.1);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Halfling') {
  quest::movepc(19,-98.4,11.5,3.1);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Gnome') {
  quest::movepc(55,7.6,489.0,-24.9);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Froglok') {
  quest::movepc(50,560,-2234,3);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Vah Shir') {
  quest::movepc(155,105.6,-850.8,-190.4);
}
  elsif ($doorid == 11 || $doorid == 267 && $race eq 'Iksar') {
  quest::movepc(106,-415.7,1276.6,3.1);
  
}else{
  quest::movepc(202,-55,44,-158.81);
 }
}