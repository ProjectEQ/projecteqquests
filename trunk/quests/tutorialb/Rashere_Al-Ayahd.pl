#zone: tutorialb
#Revised Angelox

sub EVENT_SAY
{
 if ($text=~ /Hail/i){quest::say("Did you know that when you die your soul can be recalled to your last bind spot? Well it can , and that is exactly my purpose on this world. I can [bind] your soul so that after death you will be brought to life again in this spot.");
}
 if ($text=~ /bind/i){quest::selfcast(35);}
}
