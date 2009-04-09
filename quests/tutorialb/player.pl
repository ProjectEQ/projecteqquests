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
  quest::setglobal("tutpop",1,1,"D30");
  }
  if($ulevel > 10 && $status < 80){
   $client->Message(15,"You are too high in level to be in this zone.");
   quest::selfcast(2433);
}  
 }