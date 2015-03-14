#Kizdean_Gix.pl
#Part of Thex Mallet

sub EVENT_SAY {
  if($text =~/hail/i) {
     quest::say("If you have business then out with it!! If not, then please be gone. I have little time to waste on chitchat!");
  }
  if($text =~/Utalk Adarev Otcin/i) {
     quest::say("You speak the words of the Dead. You must be the assistance Loveal was to send. You must work quickly! Inside Befallen are the three pieces to the [Thex Mallet] which are to be returned to Loveal. Find Hubard L'rodd. He was my assistant. Give him this note and he should have information.");
     quest::summonitem(18891);#A Tattered Cloth Note
  }
}

#Done