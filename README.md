# Final_Project

http://countdowndietapp-env.eba-zjnpetvn.us-east-2.elasticbeanstalk.com use the app here

This is the final project we worked on in a 4-person collaborative effort over 2 weeks.  

It started as an extension of an idea I had back in college for controlling my diet, and the lack of both discipline and money.
I didn't have the time or inclination to keep up with the calories on a daily basis, but I bet that I could keep up with it once a week.  
So I took out a pen and pad, calculated what I needed daily, and multiplied that by 7 for a weekly shopping run because I had goals to hit.
It works by buying all of your macros at one time, and forcing yourself to eat only what you purchase during the interval. 
You meet your goals and waste nothing.  
In its earliest iteration, I consumed most of my protein and carbohydrates with whey powder and rice.  For months on end.  It... worked. Unpleasant as it was.

Users should not be put through that bland repetition, but the idea of timebinding the diet into small weekly commitments is a useful and effective one.  
So lets fix the bland repetition, shall we? 

Macronutrients have long been at the core of making any diet decision.  Therefore, they are what I wanted to be at the core of this application.
We allow users to create accounts for themselves that will hold their personal metrics like height, weight, activity level, and goals. Users 
pick from dates on a calender so they can plan ahead, or adjust interval if a week is too long of a commitment for them.  The Harris-Benedict equation is
what was chosen to calculate the daily energy requirements, and then it is separated out into a 30/30/40 ratio of protein/fats/carbohydrates.  
The information is stored in an SQL database, and the users are given their macronutrient numbers in a "Macro Wallet". 

So far, this is all just the pen and paper part that I had to do for myself.  Now others can do the same to find their macro targets quickly and easily.
Still haven't fixed that problem with bland repetition.  Can't very well go ask people to use this app and then eat only rice and whey powder like I did.  
We used the Spoonacular API to solve this issue.  It provides recipes, and the ability to query those recipes with macronutrient parameters.  If we got
people to search based on their macros, they could pick and choose what fits and sounds good to them without going "over-budget" on their wallet-limit. 
We limited the search form to reflect this.  Once users find recipes they like, they can add it to their recipe list. The RecipeList is saved to each user, 
and they can add, delete, and read their list whenever they want.
These recipes link to a third party with all the details and instructions, and we had a stretch goal of consolidating all the ingredients for an easy
shopping list printout.  

If you have any questions, feel free to ask me about the project.  
Email me: benchackerman@gmail.com
