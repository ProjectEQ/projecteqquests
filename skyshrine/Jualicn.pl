# items: 1908, 17061
sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Why hello there, $name. I do not see many that pass through these chambers unless they are trusted. What brings you before me today?");
  }
  #Hsagra's Wrath
  elsif($text=~/Teachings of Relinar/i){
    quest::say("In order to receive the teachings, you need to gather four runes from the [descendants of Relinar]. Each descendant of Relinar has one of the four runes. You will find them where they stand six abreast in the wasteland. However in order to know that you have my blessing you must present them with a [treasure] that they would know came from me.");
  }
  #Hsagra's Wrath
  elsif($text=~/treasure/i){
    quest::say("I do have an ancient token that I have carried with me for quite some time. It is very special to me, but if you have been sent here by Lawyla then you must be worthy, for she is quick to see through the lies that some believe will gain them admittance to our halls. Please take this and present it to each of the descendants so that they will know you are truthful when you say that you were sent by me");
   #Summon: Jualicn's Token 
   quest::summonitem(1908); # Item: Jualicn's Token
  }
  #Hsagra's Wrath
  elsif($text=~/descendants of Relinar/i){
    quest::say("Another wizard joining our ranks? Excellent. Listen closely, $name. I will give you the Lexicon of Relinar, a great and well remembered sorcerer whose teachings are necessary in constructing a spell that is very powerful against the giants. I will give you his ancient lexicon which can harness his teachings if you can carry this large tome. You may need to rearrange your belongings. Are you [ready to receive the lexicon]?");
  }
  #Hsagra's Wrath
  elsif($text=~/I am ready to receive the lexicon/i){
    quest::say("Combine the four runes in this lexicon and you will then have the teachings of Relinar. After you have done this, you are required to speak again with Lawyla about the [problems] we are having [with Kromzek spies].");
   #Summon: Lexicon of Relinar  
   quest::summonitem(17061); # Item: Lexicon of Relinar
  }
}


#NpcID: 114004 - NpcName: Jualicn - Zone: skyshrine