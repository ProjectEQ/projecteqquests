sub EVENT_SIGNAL {

$pumpkin=$pumpkin+1;

if($signal == 33)
   {
   $pumpkin=undef;
   quest::stoptimer(4);
   quest::stoptimer(5);
   quest::stoptimer(6);
   quest::stoptimer(7);
   quest::stoptimer(8);
   quest::stoptimer(9);
   quest::stoptimer(10);
   quest::stoptimer(11);
   quest::stoptimer(12);
   quest::stoptimer(13);
   quest::stoptimer(25);
   }

if($pumpkin == 1)
   {
   quest::settimer(3,1);
   quest::settimer(4,10);
   $pumpkin=$pumpkin+1;
   quest::settimer(8,8);
   }
if($pumpkin == 3)
   {quest::spawn2(201424,46,0,232,-1048,74,360);}
if($pumpkin == 4)
   {quest::spawn2(201424,46,0,232,-1048,74,360);}
if($pumpkin == 5)
   {quest::spawn2(201424,46,0,232,-1048,74,360);}
if($pumpkin == 6)
   {

   quest::stoptimer(4);
   quest::settimer(5,25);
   quest::settimer(6,23);
    }
if($pumpkin == 7)
   {quest::spawn2(201424,46,0,232,-1048,74,360);}
if($pumpkin == 8)
   {quest::spawn2(201424,46,0,232,-1048,74,360);}
if($pumpkin == 9)
   {quest::spawn2(201424,46,0,232,-1048,74,360);}
if($pumpkin == 10)
   {
 
   quest::stoptimer(5);
   quest::settimer(7,30);
   quest::settimer(9,27);
   }
if($pumpkin == 11)
   {quest::spawn2(201424,46,0,232,-1048,74,360);}
if($pumpkin == 12)
   {quest::spawn2(201424,46,0,232,-1048,74,360);}
if($pumpkin == 13)
   {quest::spawn2(201424,46,0,232,-1048,74,360);}
if($pumpkin == 14)
   {
 
   quest::stoptimer(7);
   quest::settimer(11,30);
   quest::settimer(10,27);
   }
if($pumpkin == 15)
   {quest::spawn2(201424,46,0,232,-1048,74,360);}
if($pumpkin == 16)
   {quest::spawn2(201424,46,0,232,-1048,74,360);}
if($pumpkin == 17)
   {quest::spawn2(201424,46,0,232,-1048,74,360);}
if($pumpkin == 18)
   {
 
   quest::stoptimer(7);
   quest::settimer(13,7);
   }

}
sub EVENT_TIMER

   
   {   if($timer == 3)
            {
         $random_number=int(rand(100));
         $random_number2=int(rand(100));
         $random_number3=int(rand(100));
         $random_number4=int(rand(100));
            }

   
   {   if($timer == 4 && $random_number > 96)
            {
            quest::spawn2(201432,0,0,224,-1071,73,360); # NPC: herald_of_destruction
            }
      else

   
      {   if($timer == 4 && ($random_number <= 96 && $random_number > 91))
               {
               quest::spawn2(201431,0,0,224,-1071,73,360); # NPC: priest_of_doom
               }

         else

         {   if($timer == 4 && ($random_number <= 91 && $random_number > 65))
                  {
                  quest::spawn2(201428,0,0,224,-1071,73,360); # NPC: a_dark_nemesis
                  }

            else

            {   if($timer == 4 && ($random_number <= 65 && $random_number > 40))
                     {
                     quest::spawn2(201430,0,0,224,-1071,73,360); # NPC: a_fierce_nemesis
                     }

               else

               {   if($timer == 4 && ($random_number <= 40 && $random_number > 20))
                        {
                        quest::spawn2(201429,0,0,224,-1071,73,360); # NPC: a_fierce_nemesis
                        }   

                  else

                  {   if($timer == 4 && ($random_number <= 20 && $random_number >= 0))
                           {
                           quest::spawn2(201427,0,0,224,-1071,73,360); # NPC: a_dark_nemesis
                           }
   }
      }   
         }
            }
               }
                  }

   {   if($timer == 4 && $random_number2 > 96)
            {
            quest::spawn2(201432,0,0,168,-1071,73,360); # NPC: herald_of_destruction
            }
      else

   
      {   if($timer == 4 && ($random_number2 <= 96 && $random_number2 > 91))
               {
               quest::spawn2(201431,0,0,168,-1071,73,360); # NPC: priest_of_doom
               }

         else

         {   if($timer == 4 && ($random_number2 <= 91 && $random_number2 > 65))
                  {
                  quest::spawn2(201428,0,0,168,-1071,73,360); # NPC: a_dark_nemesis
                  }

            else

            {   if($timer == 4 && ($random_number2 <= 65 && $random_number2 > 40))
                     {
                     quest::spawn2(201430,0,0,168,-1071,73,360); # NPC: a_fierce_nemesis
                     }

               else

               {   if($timer == 4 && ($random_number2 <= 40 && $random_number2 > 20))
                        {
                        quest::spawn2(201429,0,0,168,-1071,73,360); # NPC: a_fierce_nemesis
                        }   

                  else

                  {   if($timer == 4 && ($random_number2 <= 20 && $random_number2 >= 0))
                           {
                           quest::spawn2(201427,0,0,168,-1071,73,360); # NPC: a_dark_nemesis
                           }
   }
      }   
         }
            }
               }
                  }

{   if($timer == 4 && $random_number3 > 96)
            {
            quest::spawn2(201432,0,0,168,-1121,73,360); # NPC: herald_of_destruction
            }
      else

   
      {   if($timer == 4 && ($random_number3 <= 96 && $random_number3 > 91))
               {
               quest::spawn2(201431,0,0,168,-1121,73,360); # NPC: priest_of_doom
               }

         else

         {   if($timer == 4 && ($random_number3 <= 90 && $random_number3 > 65))
                  {
                  quest::spawn2(201428,0,0,168,-1121,73,360); # NPC: a_dark_nemesis
                  }

            else

            {   if($timer == 4 && ($random_number3 <= 65 && $random_number3 > 40))
                     {
                     quest::spawn2(201430,0,0,168,-1121,73,360); # NPC: a_fierce_nemesis
                     }

               else

               {   if($timer == 4 && ($random_number3 <= 40 && $random_number3 > 20))
                        {
                        quest::spawn2(201429,0,0,168,-1121,73,360); # NPC: a_fierce_nemesis
                        }   

                  else

                  {   if($timer == 4 && ($random_number3 <= 20 && $random_number3 >= 0))
                           {
                           quest::spawn2(201427,0,0,168,-1121,73,360); # NPC: a_dark_nemesis
                           }
   }
      }   
         }
            }
               }
                  }

{   if($timer == 4 && $random_number4 > 96)
            {
            quest::spawn2(201432,0,0,224,-1121,73,360); # NPC: herald_of_destruction
            quest::stoptimer(4);
            }
      else

   
      {   if($timer == 4 && ($random_number4 <= 96 && $random_number4 > 91))
               {
               quest::spawn2(201431,0,0,224,-1121,73,360); # NPC: priest_of_doom
               quest::stoptimer(4);
               }

         else

         {   if($timer == 4 && ($random_number4 <= 91 && $random_number4 > 65))
                  {
                  quest::spawn2(201428,0,0,224,-1121,73,360); # NPC: a_dark_nemesis
                  quest::stoptimer(4);      
                  }

            else

            {   if($timer == 4 && ($random_number4 <= 65 && $random_number4 > 40))
                     {
                     quest::spawn2(201430,0,0,224,-1121,73,360); # NPC: a_fierce_nemesis
                     quest::stoptimer(4);      
                     }

               else

               {   if($timer == 4 && ($random_number4 <= 40 && $random_number4 > 20))
                        {
                        quest::spawn2(201430,0,0,224,-1121,73,360); # NPC: a_fierce_nemesis
                        quest::stoptimer(4);      
                        }   

                  else

                  {   if($timer == 4 && ($random_number4 <= 20 && $random_number4 >= 0))
                           {
                           quest::spawn2(201430,0,0,224,-1121,73,360); # NPC: a_fierce_nemesis
                           quest::stoptimer(4);      
                           }
   }
      }   
         }
            }
               }
                  }

{   if($timer == 5 && $random_number > 96)
            {
            quest::spawn2(201432,0,0,224,-1071,73,360); # NPC: herald_of_destruction
            }
      else

   
      {   if($timer == 5 && ($random_number <= 96 && $random_number > 91))
               {
               quest::spawn2(201431,0,0,224,-1071,73,360); # NPC: priest_of_doom
               }

         else

         {   if($timer == 5 && ($random_number <= 91 && $random_number > 65))
                  {
                  quest::spawn2(201428,0,0,224,-1071,73,360); # NPC: a_dark_nemesis
                  }

            else

            {   if($timer == 5 && ($random_number <= 65 && $random_number > 40))
                     {
                     quest::spawn2(201430,0,0,224,-1071,73,360); # NPC: a_fierce_nemesis
                     }

               else

               {   if($timer == 5 && ($random_number <= 40 && $random_number > 20))
                        {
                        quest::spawn2(201429,0,0,224,-1071,73,360); # NPC: a_fierce_nemesis
                        }   

                  else

                  {   if($timer == 5 && ($random_number <= 20 && $random_number >= 0))
                           {
                           quest::spawn2(201427,0,0,224,-1071,73,360); # NPC: a_dark_nemesis
                           }
   }
      }   
         }
            }
               }
                  }

   {   if($timer == 5 && $random_number2 > 96)
            {
            quest::spawn2(201432,0,0,168,-1071,73,360); # NPC: herald_of_destruction
            }
      else

   
      {   if($timer == 5 && ($random_number2 <= 96 && $random_number2 > 91))
               {
               quest::spawn2(201431,0,0,168,-1071,73,360); # NPC: priest_of_doom
               }

         else

         {   if($timer == 5 && ($random_number2 <= 91 && $random_number2 > 65))
                  {
                  quest::spawn2(201428,0,0,168,-1071,73,360); # NPC: a_dark_nemesis
                  }

            else

            {   if($timer == 5 && ($random_number2 <= 65 && $random_number2 > 40))
                     {
                     quest::spawn2(201430,0,0,168,-1071,73,360); # NPC: a_fierce_nemesis
                     }

               else

               {   if($timer == 5 && ($random_number2 <= 40 && $random_number2 > 20))
                        {
                        quest::spawn2(201429,0,0,168,-1071,73,360); # NPC: a_fierce_nemesis
                        }   

                  else

                  {   if($timer == 5 && ($random_number2 <= 20 && $random_number2 >= 0))
                           {
                           quest::spawn2(201427,0,0,168,-1071,73,360); # NPC: a_dark_nemesis
                           }
   }
      }   
         }
            }
               }
                  }

{   if($timer == 5 && $random_number3 > 96)
            {
            quest::spawn2(201432,0,0,168,-1121,73,360); # NPC: herald_of_destruction
            }
      else

   
      {   if($timer == 5 && ($random_number3 <= 96 && $random_number3 > 91))
               {
               quest::spawn2(201431,0,0,168,-1121,73,360); # NPC: priest_of_doom
               }

         else

         {   if($timer == 5 && ($random_number3 <= 90 && $random_number3 > 65))
                  {
                  quest::spawn2(201428,0,0,168,-1121,73,360); # NPC: a_dark_nemesis
                  }

            else

            {   if($timer == 5 && ($random_number3 <= 65 && $random_number3 > 40))
                     {
                     quest::spawn2(201430,0,0,168,-1121,73,360); # NPC: a_fierce_nemesis
                     }

               else

               {   if($timer == 5 && ($random_number3 <= 40 && $random_number3 > 20))
                        {
                        quest::spawn2(201429,0,0,168,-1121,73,360); # NPC: a_fierce_nemesis
                        }   

                  else

                  {   if($timer == 5 && ($random_number3 <= 20 && $random_number3 >= 0))
                           {
                           quest::spawn2(201427,0,0,168,-1121,73,360); # NPC: a_dark_nemesis
                           }
   }
      }   
         }
            }
               }
                  }

{   if($timer == 5 && $random_number4 > 96)
            {
            quest::spawn2(201432,0,0,224,-1121,73,360); # NPC: herald_of_destruction
            quest::stoptimer(5);
            }
      else

   
      {   if($timer == 5 && ($random_number4 <= 96 && $random_number4 > 91))
               {
               quest::spawn2(201431,0,0,224,-1121,73,360); # NPC: priest_of_doom
               quest::stoptimer(5);
               }

         else

         {   if($timer == 5 && ($random_number4 <= 91 && $random_number4 > 65))
                  {
                  quest::spawn2(201428,0,0,224,-1121,73,360); # NPC: a_dark_nemesis
                  quest::stoptimer(5);      
                  }

            else

            {   if($timer == 5 && ($random_number4 <= 65 && $random_number4 > 40))
                     {
                     quest::spawn2(201430,0,0,224,-1121,73,360); # NPC: a_fierce_nemesis
                     quest::stoptimer(5);      
                     }

               else

               {   if($timer == 5 && ($random_number4 <= 40 && $random_number4 > 20))
                        {
                        quest::spawn2(201430,0,0,224,-1121,73,360); # NPC: a_fierce_nemesis
                        quest::stoptimer(5);      
                        }   

                  else

                  {   if($timer == 5 && ($random_number4 <= 20 && $random_number4 >= 0))
                           {
                           quest::spawn2(201430,0,0,224,-1121,73,360); # NPC: a_fierce_nemesis
                           quest::stoptimer(5);      
                           }
   }
      }   
         }
            }
               }
                  }

{   if($timer == 7 && $random_number > 96)
            {
            quest::spawn2(201432,0,0,224,-1071,73,360); # NPC: herald_of_destruction
            }
      else

   
      {   if($timer == 7 && ($random_number <= 96 && $random_number > 91))
               {
               quest::spawn2(201431,0,0,224,-1071,73,360); # NPC: priest_of_doom
               }

         else

         {   if($timer == 7 && ($random_number <= 91 && $random_number > 65))
                  {
                  quest::spawn2(201428,0,0,224,-1071,73,360); # NPC: a_dark_nemesis
                  }

            else

            {   if($timer == 7 && ($random_number <= 65 && $random_number > 40))
                     {
                     quest::spawn2(201430,0,0,224,-1071,73,360); # NPC: a_fierce_nemesis
                     }

               else

               {   if($timer == 7 && ($random_number <= 40 && $random_number > 20))
                        {
                        quest::spawn2(201429,0,0,224,-1071,73,360); # NPC: a_fierce_nemesis
                        }   

                  else

                  {   if($timer == 7 && ($random_number <= 20 && $random_number >= 0))
                           {
                           quest::spawn2(201429,0,0,224,-1071,73,360); # NPC: a_fierce_nemesis
                           }
   }
      }   
         }
            }
               }
                  }

   {   if($timer == 7 && $random_number2 > 96)
            {
            quest::spawn2(201432,0,0,168,-1071,73,360); # NPC: herald_of_destruction
            }
      else

   
      {   if($timer == 7 && ($random_number2 <= 96 && $random_number2 > 91))
               {
               quest::spawn2(201431,0,0,168,-1071,73,360); # NPC: priest_of_doom
               }

         else

         {   if($timer == 7 && ($random_number2 <= 91 && $random_number2 > 65))
                  {
                  quest::spawn2(201428,0,0,168,-1071,73,360); # NPC: a_dark_nemesis
                  }

            else

            {   if($timer == 7 && ($random_number2 <= 65 && $random_number2 > 40))
                     {
                     quest::spawn2(201430,0,0,168,-1071,73,360); # NPC: a_fierce_nemesis
                     }

               else

               {   if($timer == 7 && ($random_number2 <= 40 && $random_number2 > 20))
                        {
                        quest::spawn2(201429,0,0,168,-1071,73,360); # NPC: a_fierce_nemesis
                        }   

                  else

                  {   if($timer == 7 && ($random_number2 <= 20 && $random_number2 >= 0))
                           {
                           quest::spawn2(201427,0,0,168,-1071,73,360); # NPC: a_dark_nemesis
                           }
   }
      }   
         }
            }
               }
                  }

{   if($timer == 7 && $random_number3 > 96)
            {
            quest::spawn2(201432,0,0,168,-1121,73,360); # NPC: herald_of_destruction
            }
      else

   
      {   if($timer == 7 && ($random_number3 <= 96 && $random_number3 > 91))
               {
               quest::spawn2(201431,0,0,168,-1121,73,360); # NPC: priest_of_doom
               }

         else

         {   if($timer == 7 && ($random_number3 <= 90 && $random_number3 > 65))
                  {
                  quest::spawn2(201428,0,0,168,-1121,73,360); # NPC: a_dark_nemesis
                  }

            else

            {   if($timer == 7 && ($random_number3 <= 65 && $random_number3 > 40))
                     {
                     quest::spawn2(201430,0,0,168,-1121,73,360); # NPC: a_fierce_nemesis
                     }

               else

               {   if($timer == 7 && ($random_number3 <= 40 && $random_number3 > 20))
                        {
                        quest::spawn2(201429,0,0,168,-1121,73,360); # NPC: a_fierce_nemesis
                        }   

                  else

                  {   if($timer == 7 && ($random_number3 <= 20 && $random_number3 >= 0))
                           {
                           quest::spawn2(201427,0,0,168,-1121,73,360); # NPC: a_dark_nemesis
                           }
   }
      }   
         }
            }
               }
                  }

{   if($timer == 7 && $random_number4 > 96)
            {
            quest::spawn2(201432,0,0,224,-1121,73,360); # NPC: herald_of_destruction
            quest::stoptimer(7);
            }
      else

   
      {   if($timer == 7 && ($random_number4 <= 96 && $random_number4 > 91))
               {
               quest::spawn2(201431,0,0,224,-1121,73,360); # NPC: priest_of_doom
               quest::stoptimer(7);
               }

         else

         {   if($timer == 7 && ($random_number4 <= 91 && $random_number4 > 65))
                  {
                  quest::spawn2(201428,0,0,224,-1121,73,360); # NPC: a_dark_nemesis
                  quest::stoptimer(7);      
                  }

            else

            {   if($timer == 7 && ($random_number4 <= 65 && $random_number4 > 40))
                     {
                     quest::spawn2(201430,0,0,224,-1121,73,360); # NPC: a_fierce_nemesis
                     quest::stoptimer(7);      
                     }

               else

               {   if($timer == 7 && ($random_number4 <= 40 && $random_number4 > 20))
                        {
                        quest::spawn2(201430,0,0,224,-1121,73,360); # NPC: a_fierce_nemesis
                        quest::stoptimer(7);      
                        }   

                  else

                  {   if($timer == 7 && ($random_number4 <= 20 && $random_number4 >= 0))
                           {
                           quest::spawn2(201430,0,0,224,-1121,73,360); # NPC: a_fierce_nemesis
                           quest::stoptimer(7);      
                           }
   }
      }   
         }
            }
               }
                  }

{   if($timer == 11 && $random_number > 96)
            {
            quest::spawn2(201432,0,0,224,-1071,73,360); # NPC: herald_of_destruction
            }
      else

   
      {   if($timer == 11 && ($random_number <= 96 && $random_number > 91))
               {
               quest::spawn2(201431,0,0,224,-1071,73,360); # NPC: priest_of_doom
               }

         else

         {   if($timer == 11 && ($random_number <= 91 && $random_number > 65))
                  {
                  quest::spawn2(201428,0,0,224,-1071,73,360); # NPC: a_dark_nemesis
                  }

            else

            {   if($timer == 11 && ($random_number <= 65 && $random_number > 40))
                     {
                     quest::spawn2(201430,0,0,224,-1071,73,360); # NPC: a_fierce_nemesis
                     }

               else

               {   if($timer == 11 && ($random_number <= 40 && $random_number > 20))
                        {
                        quest::spawn2(201429,0,0,224,-1071,73,360); # NPC: a_fierce_nemesis
                        }   

                  else

                  {   if($timer == 11 && ($random_number <= 20 && $random_number >= 0))
                           {
                           quest::spawn2(201427,0,0,224,-1071,73,360); # NPC: a_dark_nemesis
                           }
   }
      }   
         }
            }
               }
                  }

   {   if($timer == 11 && $random_number2 > 96)
            {
            quest::spawn2(201432,0,0,168,-1071,73,360); # NPC: herald_of_destruction
            }
      else

   
      {   if($timer == 11 && ($random_number2 <= 96 && $random_number2 > 91))
               {
               quest::spawn2(201431,0,0,168,-1071,73,360); # NPC: priest_of_doom
               }

         else

         {   if($timer == 11 && ($random_number2 <= 91 && $random_number2 > 65))
                  {
                  quest::spawn2(201428,0,0,168,-1071,73,360); # NPC: a_dark_nemesis
                  }

            else

            {   if($timer == 11 && ($random_number2 <= 65 && $random_number2 > 40))
                     {
                     quest::spawn2(201430,0,0,168,-1071,73,360); # NPC: a_fierce_nemesis
                     }

               else

               {   if($timer == 11 && ($random_number2 <= 40 && $random_number2 > 20))
                        {
                        quest::spawn2(201429,0,0,168,-1071,73,360); # NPC: a_fierce_nemesis
                        }   

                  else

                  {   if($timer == 11 && ($random_number2 <= 20 && $random_number2 >= 0))
                           {
                           quest::spawn2(201427,0,0,168,-1071,73,360); # NPC: a_dark_nemesis
                           }
   }
      }   
         }
            }
               }
                  }

{   if($timer == 11 && $random_number3 > 96)
            {
            quest::spawn2(201432,0,0,168,-1121,73,360); # NPC: herald_of_destruction
            }
      else

   
      {   if($timer == 11 && ($random_number3 <= 96 && $random_number3 > 91))
               {
               quest::spawn2(201431,0,0,168,-1121,73,360); # NPC: priest_of_doom
               }

         else

         {   if($timer == 11 && ($random_number3 <= 90 && $random_number3 > 65))
                  {
                  quest::spawn2(201428,0,0,168,-1121,73,360); # NPC: a_dark_nemesis
                  }

            else

            {   if($timer == 11 && ($random_number3 <= 65 && $random_number3 > 40))
                     {
                     quest::spawn2(201430,0,0,168,-1121,73,360); # NPC: a_fierce_nemesis
                     }

               else

               {   if($timer == 11 && ($random_number3 <= 40 && $random_number3 > 20))
                        {
                        quest::spawn2(201429,0,0,168,-1121,73,360); # NPC: a_fierce_nemesis
                        }   

                  else

                  {   if($timer == 11 && ($random_number3 <= 20 && $random_number3 >= 0))
                           {
                           quest::spawn2(201427,0,0,168,-1121,73,360); # NPC: a_dark_nemesis
                           }
   }
      }   
         }
            }
               }
                  }

{   if($timer == 11 && $random_number4 > 96)
            {
            quest::spawn2(201432,0,0,224,-1121,73,360); # NPC: herald_of_destruction
            quest::stoptimer(11);
            }
      else

   
      {   if($timer == 11 && ($random_number4 <= 96 && $random_number4 > 91))
               {
               quest::spawn2(201431,0,0,224,-1121,73,360); # NPC: priest_of_doom
               quest::stoptimer(11);
               }

         else

         {   if($timer == 11 && ($random_number4 <= 91 && $random_number4 > 65))
                  {
                  quest::spawn2(201428,0,0,224,-1121,73,360); # NPC: a_dark_nemesis
                  quest::stoptimer(11);      
                  }

            else

            {   if($timer == 11 && ($random_number4 <= 65 && $random_number4 > 40))
                     {
                     quest::spawn2(201430,0,0,224,-1121,73,360); # NPC: a_fierce_nemesis
                     quest::stoptimer(11);      
                     }

               else

               {   if($timer == 11 && ($random_number4 <= 40 && $random_number4 > 20))
                        {
                        quest::spawn2(201430,0,0,224,-1121,73,360); # NPC: a_fierce_nemesis
                        quest::stoptimer(11);      
                        }   

                  else

                  {   if($timer == 11 && ($random_number4 <= 20 && $random_number4 >= 0))
                           {
                           quest::spawn2(201430,0,0,224,-1121,73,360); # NPC: a_fierce_nemesis
                           quest::stoptimer(11);      
                           }
   }
      }   
         }
            }
               }
                  }


   {if($timer == 6){
      quest::spawn2(201424,46,0,232,-1048,74,360); # NPC: a_sentenced_prisoner
      quest::stoptimer(6);
      }
   }
   {if($timer == 8){
      quest::spawn2(201424,46,0,232,-1048,74,360); # NPC: a_sentenced_prisoner
      quest::stoptimer(8);
      }
   }
   {if($timer == 9){
      quest::spawn2(201424,46,0,232,-1048,74,360); # NPC: a_sentenced_prisoner
      quest::stoptimer(9);
      }
   }
   {if($timer == 10){
      quest::spawn2(201424,46,0,232,-1048,74,360); # NPC: a_sentenced_prisoner
      quest::stoptimer(10);
      }
   }


   {if($timer == 13){
      quest::spawn2(201433,0,0,195,-1134,74,0); # NPC: Prime_Executioner_Vathoch
      quest::stoptimer(13);
      quest::stoptimer(3);
      $pumpkin=undef;
      }
   }
 
}


sub EVENT_SAY {

   if($text=~/Hail/i)
      {
      quest::say("Do you wish to [return]?");
      }
   
   {if($text=~/return/i && !defined $pumpkin)
      {
      quest::say("The trial is currently underway.");
      }

   {if($text=~/return/i && !defined $pumpkin)
      {
      quest::say("Very well.");
      quest::movepc(201,456,825,9); # Zone: pojustice
      }
   }}} 
