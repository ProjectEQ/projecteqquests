sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to Shar Vahl's North Gate District.  If you're looking to relax. you may want to grab a drink at the Trail's End.  It's right behind me on the left.  Take care."); }
}


sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 5550 =>1 )) {
  quest::say("You must think you're pretty tough wearin a buckler like that, eh? Well well... Perhaps you're looking to hunt some bigger game, eh? Earn a little scruff on your ears like Kuash? I thought so. I know a good place for you to start... and it's part of your civil duty. Our scouts have always had trouble with the wolves in the moor. I'm thinkin that you can start there. Maybe break in a few of the younger wolves' paws, eh? I thought so. Put your buckler back on and take this bag. Fill it with wolf paws and bring it back to me. Maybe then I'll give you a real challenge.");
    quest::summonitem(5550);
    quest::summonitem(17114);
  }
  if (plugin::check_handin(\%itemcount, 6217 =>1 )) {
  quest::say("Well, you're beginning to scare me you're so tough! Just pullin your tail. Those were some scary beasts, eh? I thought so. I've got a dagger that helps me to deal with them. It's made in a special way to hurt the wolves more than usual. If you want one, you're going to need to make your own. I still got the molds that I used when I was craftin blades for people. If you run this status report to Bookkeeper Leaha in the Grunt Forest outpost for me, I'll go by my house and get the molds for you. Sound like a deal? I thought so.");
  quest::summonitem(6219);
  quest::faction( 132,10 );
  quest::exp(1000);
      }
      
      if (plugin::check_handin(\%itemcount, 6221 =>1 )) {
      quest::say("Thank you very much. I see you got it all filled out. I gathered up all of those molds for you while you were gone. You can even have this old hilt that I found with them. Make sure you keep them in a safe place. You're going to need them and the books that the book fellow Qua sells. He's got a bunch of them and a kit that you'll need. When you get done with makin your dagger, bring it back by here with your cloak and I'll show you a surprise!");
       quest::summonitem(6141); 
       quest::summonitem(6142);
       quest::summonitem(6148);
       quest::exp(1000);
       quest::faction(132,10);
      }
  if (plugin::check_handin(\%itemcount, 5557 =>1,6158 =>1 )) {
    quest::say("You have done well #name.  Wear this cloak with pride and enjoy the benefits of being a Khala Dun Journeyman.");
    quest::summonitem(6222);
    quest::summonitem(6158);
    quest::exp(10000);
      }
      plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155295 -- Khala_Dun_Kuash 

