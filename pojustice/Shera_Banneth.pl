#################################################
# Name:  Shera Banneth
# Zone:  Plane of Justice
# Author:  Andrew80k
#################################################
sub EVENT_SAY {
   if ($text =~ /Hail/i) {
      quest::say("I dun wanna talk to anyone, go away! Dun ask me [why]!");
   }
   if ($text =~ /why/i) {
      quest::say("My husband was Suili Banneth.  He was a foul drunk of the worst sorts, never an 'onest day o' work in his life.  Well I found a man worth my time so a lil hemlock in Suili's ale at night an he dinna wake up.  I guess his family was upset aboot tha, so they petitioned ta sen' me 'ere.");
   }
}