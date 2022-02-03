# CSS - CSS Responsive Review
Slides: https://slides.com/leonnoel/100devs2-css-responsive-review
___
## Agenda
Questions?
Review - How To Network
Review - CSS Basics
Review - CSS Layout
Learn - Responsive Basics
Build - Responsive Website
Homework - Layouts
## Questions
About last class or life
## Checking In
https://twitter.com/leonnoel/status/1489365690217754628
Like and Retweet the Tweet
!checkin

## Friends?

Study Community Join Form:
https://forms.gle/fX4fNt7wmutvxjEQ6
## Submitting Work
15 minutes of pain responsive in codepen.io
Submit URLs here: https://forms.gle/AaoHzDEXm3Hjc7JL8
## Networking (Review)
3 Individuals Already In Tech
2 Coffee Chats

Just applying to jobs will not get you a job
Networking is the thing that will get you a job
Next week we have to start our networking

We are going to discuss how to network, find things that work for you, and do it at a good pace
It is important to start exploring and figuring out what does and does not work for you

Next week we need to connect with 3 individuals that are already in tech
Then have 2 coffee chats with two individuals already in tech

They don't have to be software engineers but they should be in tech (but ideally software engineers)

Coffee chats should be a sit down, longer form conversation with them

In resilient coders they ask people to find 5 people and do 3 coffee chats
The reason this is important is because by the time you are done you have over 100 people that have met them, know them, and could be a referal for them

Most places don't include networking and is a huge missed opportunity since that is MOST likely where your job will come from

Right now is the best time in the history of networking to network so use that to your advantage

The techniques for networking discussed today aren't a silver bullet but are more like techiques and tips for how to network
If you struggle with anxiety/social disorders this advice may not be what works for you and you may need to speak with a therapist to come up with a plan

Most people probably think that they can't network but you can, you just probably won't like it
## Stranger > Acquaintance > Friend > Referral > Coworker (Review)
What do you mean by networking?
The goal of networking is to turn a stranger into a coworker
But the first step is to turn a stranger into a friend

This process can take a short time or a long time but the goal is to make a friend
Friends are likely to refer each other for jobs
Most companies if you are refered there are a few perks
- You might skip a first round interview and go straight to a technical
- A lot of companies pay referal bonuses (sometimes up to $20,000)
- Once you have a referal you can have a champion, or someone who will make sure you get an interview
  - This person can follow up with HR after you apply to be sure you get seen

Where people do it wrong is that they just blast someone who is in a position to give a referal with messages begging
Instead you should take the opportunity to actually form a friendship with them rather than try to get something from them

LinkedIn is similar in that you can add thousands of people on LinkedIn but none of them know you and so none of them would refer you

If you are not making friends you are networking wrong
## Normal Follow Up (Review)
This is a guidline for the process you should follow for meeting people
```
Meet > Email    > LinkedIn > Twitter
     | Next Day | Day 3    | Day 6
```
In your email make sure you provide value
This just means show you were engaged in the conversation
(Bring up something from the conversation)

Then when you add them on LinkedIn make sure you also send them a message
DO NOT ADD SOMEONE ON LINKEDIN WITHOUT SENDING A MESSAGE
This is double helpful because it reminds you how you know each other

Finally add them on twitter day 6

By spacing it out like this we are doing spaced repetition to them
It will help them remember who you are!

Next time they see you they will have a much better idea who you are and at least be an acquaintance
## Normal Follow Up Example 
Hi Leon,

 

It was a pleasure meeting you last night! The event was so well done and it was exciting meeting such an amazing group of people - I hope you are enjoying a well deserved break after pulling it all together!

 

Also, I don't know if you saw this yet, but someone just bought a $375k first edition pokemon booster box and it wound up being fake! The Gaurdian covered it and I remember you mentioned being a big fan. Hope you have a great rest of the week!

 

Cheers,

Bob
## Want A Coffee Chat? (Review)
Coffee chats used to be in person but are not necessarily right now
When we say coffee chat we just mean talk 1 on 1

```
Email Follow Up 1 > Email Follow Up 2 > Last Email
1 Week            | 2 Weeks           | 1 Month
```
So to get a coffee chat you should send them an initial email just asking for 15-20 minutes asking to discuss how they got to where they are
Follow up 2 weeks later and 1 month later
If they haven't responded just drop it and don't worry about it

Most people will be happy to have a coffee chat with you and share their experience with you

Pro tip: If you are going to meet in person and go to an actual coffee shop, go early and buy the smallest coffee they have and sit down with it
Then when they show up you are already sat with your drink and there is no awkward situation where someone thinks they need to buy coffee for the other

## Coffee Chat Example
Hi Leon,

It was a pleasure meeting you last night! The event was so well done and it was exciting meeting such an amazing group of people - I hope you are enjoying a well deserved break after pulling it all together!

 

As I mentioned last night, I'm just starting my engineering career and would love to learn from successful people such as yourself. Please let me know if there might be a time you are free to grab a virtual coffee over the next week or two. Before 9am or after 5pm tends to work best for me, but happy to accommodate what works for you. Thanks!

 

Also, I don't know if you saw this yet, but someone just bought a $375k first edition pokemon booster box and it wound up being fake! The Gaurdian covered it and I remember you mentioned being a big fan. Have a great rest of the week!

 

Cheers,

Bob
## USE THE SHEET! (Review)
Networking Google Sheet
https://docs.google.com/spreadsheets/d/1Be-6gYvrfi8l-M0RnObzdysRIG7N7Yyu6rIF0OHw0Q4/edit#gid=1771441293

Using a spreadsheet when you network is helpful
This sheet has a place to keep networking information in one place

The spark is one of the most important things to write, the thing you remember about that person the most
## Questions ?
## Just because...
## The Golden Rule SEPERATION OF CONCERNS (Review)
SEPERATION OF CONCERNS
HTML = Content / Structure
CSS = Style
JS = Behavior / Interaction

The idea here is that we want to keep tasks seperate and these should not mix
If we were to go to a website and add an extra paragraph you would use html
If you wanted to make something pink you would use css
If you wanted something to move when you clicked it you would use js

This is important so that it organizes all of the work so it is easier to work on or change something
You know exactly where to go when you want to make a change
## Progressive Enhancement (Review)

According to the United States Department of Commerce, about 22 million Americans--roughly 35% of the nation's rural residents--lack access to broadband.

(2017)

This is an important concept for our users because the core of our content should be html
We will take that html and then add our styling and css
Then we will add our js on top of that
The idea is that the core and most important part is the html and css and js build on that

This is because not everyone has access to super fast internet or high quality devices
This can cause a bad experience for users

See motherfuckingwebsite.com
## CSS (Review)
Where does CSS go?
There are three places that CSS CAN go but only 1 place that it SHOULD go
- Inline
  - The only time css should go here is when creating emails
    They are written in html and do not have access to external style sheets so they only way to style them is inline (being worked on)
- In the head
  - The only time css should go here is if you work at amazon
    They said they lose 1 million dollars a day for every second the website takes to load
    There is something called 'critical path' css that is the bare minimum css for the page to load
    What amazon does is put a little css in the head that loads above where the page renders and everything else is in an external css file
    That way the stuff that users can't see will use the external css and improve load times
    These load times are not necessary for us to save right now
- In a separate file
  - To keep our code seperate we keep css in a seperate file and link it to our css

It is best practice to put CSS in it's own file and link to it from the `<head>`!

To link a stylesheet in the head:
```
<link rel="stylesheet" href="css/style.css">
```
This will tell your html to go to the 'css' folder and look for a file called 'style.css' and use it as a stylesheet
## CSS BREAK DOWN (Review)
When thinking of each part of css think of the whole declaration block as a rule that your html must follow
The whole thing is called a rule.
The `p` is called a selector and picks which part of the html the rules applies to.
It is followed by a set of declarations in a declaration block which define how that html element should look

The selector, p in this case, species what parts of the HTML document should be styled by the declaration.
This selector will style all p elements on the page.

```
p{
  color: red;
  font-weight: bold;
}
```
The declaration block is here:
```
{
  color: red;
  font-weight: bold;
}
```
Declarations go inside curly braces

This example has two declarations.
Here is the first:
```
color: red;
```

This example has two declarations.
Here is the second:
```
font-weight: bold;
```

What is this?
Practice identifying the different parts of this css snippet
```
p{
  color: red;
  font-weight: bold;
}
```

CSS is read top to bottom
Rules that are written above can be overwritten by rules that come below
This is called the Cascade
Hence CASCADING Style Sheets (CSS)
```
p{
  color: red;
  font-weight: bold;
}
p{
  color: blue;
}
```
If we do this then all of our `<p>` tag content will be blue but also be blue 
We never overwrote the font weight, we only rewrote the color

Why might we want to link to a separate CSS file?
Seperation of concerns, organization, re-usability etc.
## Selecting By Relationship (Review)
Sometimes  we need to select specific html tags in order to apply styling and be more specific about which one we are targetting
To select an element that is the direct descendent of another element use
parent > child
```
<section>
  <p>Hello, Twitch!</p>
</section>

<div>
  <p>This isn't styled</p>
</div>
```
If we just wanted to target the paragraph that is the child of the `<section>` element we can use:
```
section > p {
  color: red;
}
```
This will style paragraphs that are inside of that section tag red but leave other paragraph tags alone


We can also select and element that is inside of another element without being directly descended use parent element 
It can have other wrapping elements around it and still receive that style rule
It doesn't matter how nested the `<p>` tag is, it will receive the styling if it exists within a `<section>`

parent child
```
<section>
  <article>
    <p>Hello, Twitch!</p>
  </article>
  <p>This is also styled</p>
</section>

<div>
  <p>This isn't styled</p>
</div>
```
```
section p {
  color: red;
}
```

To select an element that is the next sibling use
previous sibling + next sibling
This will not apply the style to the previous sibling only the next one
However if you had a list of 3 since 2 of them have previous sibling that match the requirement two of them would be styled
```
<section>
  <p>This is not styled</p>
  <p>This is styled</p>
  <p>This is styled</p>
</section>
```
```
p + p {
  color: red;
}
```
Another example since this may be confusing
```
<section>
  <span>This is not styled</span>
  <p>This is styled because it is the only one with a span tag above it</p>
  <p>This is not styled</p>
</section>
```
```
span + p {
  color: red;
}
```
## IDs & Classes (Review)
These are identifiers that allow you to target elements and give the highest specificity score to elements that are targetted by it

## IDs (Review)
IDs are used for selecting distinct elements
Only one id with the same value per document

This is a way of uniquely identifing an element

Here we assign an id with the 'id' property and assigning it a value of 'zebra'
Then we can target it in css by using: #idname or in this case #zebra
```
<section>
  <p>Hello, Twitch!</p>
  <p id="zebra">Hello, Youtube!</p>
</section>
```
```
#zebra {
  color: red;
}
```

## Classes (Review)
Classes are for selecting multiple elements
Multiple with same value allowed per document

They are kind of like ID's in that they add an identifier to an element
However you can have multiple elements with the same class name
This is so you can group elements and give them common rules to share between them
For example you could assign a specific font to paragraphs with a certain class while leaving other paragraphs untouched
This prevents you from having to write many different rules that do the same thing while target different elements
Instead we can just write one rule and target all the elements we want to follow that rule
You can have multiple classes per element as well

Here we assign a class name with the 'class' property 
Then we can use a rule that these classes must follow in css with .className or in this case '.bob'
```
<section>
  <p class="robot">Hello, Twitch!</p>
  <p id="zebra" class="bob">Hello, Youtube!</p>
  <p class="bob">Goodbye, Mixer!</p>
</section>
```
```
.bob {
  color: red;
}
```

## Specificity (Review)
Specificity decides how important a rule is
This determines if a rule that is written can overwrite a rule that was written before it
Just like in the example we did earlier
```
article > h2 {
  color: red;
}

section > article > h2 {
  color: orange;
}
```
Both of these rules are applicable to the element containing the word unicorn
However the specificity in the second rule is higher
This is because instead of using only 2 orders to define which element we are using 3 orders to define it and unicorn qualifies for all 3

There is a certain weight we give each type of selector
So far we have element selectors, class selectors, and id selectors but there are two others that can give even more weight
That is inline styles and `!important`
- inline styles and `!important` have the highest weight: 1000 points
- ID selectors get the next highest weight: 100 points
- Class selectors get the second lowest weight: 10 points
- Element selectors get the lowest weight: 1 point

So a specificity score for a given rule holds all three of these values in a number
Like this:
```
0-0-0-0
inline/important-id-class-element
```
If a rule is made it will look at what is targetted if element(s) are targetted then it will increase the score in the element area, if class(es) are targetted the middle area will increase in score, and if id is targetted the first area will see a score increase
For example for our previous rules:
```
/*Two elements selected
  specificity: 0-0-0-2 */
article > h2 {
  color: red;
}

/*Three elements selected
  specificity: 0-0-0-3*/
section > article > h2 {
  color: orange;
}
```
If an element qualifies for two rules then it will accept whatever rules it can from the one with the lower specificity score
However if there is a conflic between the two rules (like a different color being assigned) then the rule with the higher specificity score takes precedence
If they have the same number of points then the rule that is written lower in the css document will take precedence

There is a way to increase the first column specificity score for a property within a rule and that is to add `!important` after 
So if we were to use the previous example but use `!important` on the rule with a lower score the color red will be assigned
This is still the case if you put the rule that previously had a lower score below the rule that had a higher score

```
/*Three elements selected
  specificity: 0-0-3*/
section > article > h2 {
  color: orange;
}

/*Two elements selected AND !important
  specificity: 1-0-0-2 */
article > h2 {
  color: red !important;
}
```

You would need 10 classes of specificity to overwrite an id if you assigned an id wit rules to an element

We can use the cascade and this score to our advantage
Say we wanted to make a rule that targetted all of our h2 tags that are direct children of articles be red, bold, and font size of 30px
We can easily make a rule to do this
```
article > h2 {
  color: red;
  font-weight: bold;
  font-size: 30px;
}
```
But then if that h2 is in a section we want it to be orange but keep the other styling
We can do that by simply taking advantage of the cascade and this score
```
section > article > h2 {
  color: orange;
}
```
Since this rule has a higher specificity it will assign the color orange and overwrite the red value that was given to it earlier however the other rules that were assigned previously will still be kept

But we can overwrite that rule the other way and force it to show red by using the `!important` to raise its score
```
article > h2 {
  color: red !important;
  font-weight: bold;
  font-size: 30px;
}

section > article > h2 {
  color: orange;
}
```
Now the red color will be applied even though it had a lower score than the rule below because `!important` adds so much to the specificity score

## The Box Model (Review)
The box model is used to determine where elements are and where items inside of them are
Say you have a `<section>` and it has a height of 100px and a width of 100px
```
___________
|          |
|          |
|  100x100 |
|          |
|__________|
```
If we had an article we wanted to put these sections inside of that was 300px wide how many could we fit inside?
3 makes sense so far

With the box model there are three important things to consider
Horizontal we have width, padding, border
Vertically we have height, padding, border

These are the three things that we can control that take up size
Lets say we gave our box a border of 5px
```
 ______________
| ___________  |
| |          | |
| |          | |
| | 110x110  | |
| |          | |
| |__________| |
|______________|
```
By adding a border we have increased the size of the box even though our height and width is still set to both be 100 in our css 
Our css in this case would look like this:
```css
section {
  height: 100px;
  width: 100px;
  border: 5px solid red;
}
```

Now we can adding padding into the mix
What it does is increase the distance between the element and its border
If we were to add padding to just the right hand side
```
5_________________5
| ___________     |
| |          |    |
| |          |    |
| | 100x100  |20px|
| |          |    |
| |__________|    |
|_________________|
```
This now gives us 130 pixels of width even though we only set the size of our section to 100
Now if we were to ask if we had an article holding all of these sections that was 3 secions wide how many could we hold?
Now we would only be able to hold 2 of them

Margin is kind of related to the box model but isn't actually part of the element
It keeps elements from coming within a certain distance of other elements but isn't necessarily part of the element itself
## Let's Code
The Box Model
## Time For Some Layouts
## 🚨 Let's Talk About Floats 🚨 (Review)
Flexbox and grid are far superior and floats aren't as common to use when developing new applications
However it is important to know about floats because floats is how it was always done before
You will need to know this when working on existing projects

The biggest thing to keep in mind is that it is all about percentages
Many people are able to pick up floats fairly quickly and be better with it than flexbox
Eventually we will be moving to flex and grid but for now we will get used to floats
## Floats (Review)
The biggest thing about floats is that when you float an element it will try to get into a corner
If you float something left it will try as hard as it can to go up and to the left as much as it can 
Same goes for the right
If you float something right it will try as hard as it can to go up as far as it can and to the right as far as it can

When you use floats you are using a side effect
If stuff tries to get into a corner they will sit next to each other
## 🚨 WARNING 🚨
## Let's Write BADD CODE
Real Layouts
## Layout 1
TechCrunch Website
## Layout 2
Khan Academy
## Layout 3
BBC Website
## Responsive Websites (Review)
Just hinting at this
To be responsive means a website looks good on all screens
This means it looks good when you look at it on a desktop/phone/tablet/smartfridge etc

A responsive website will add/remove/resize/rearrange content as the screen gets bigger or smaller
## Fixed Vs. Responsive (Review)
This is a example of how responsive design has changed
UPS from back in the day was not responsive at all 
UPS.com Wayback Machine


Boston.com
Has to be responsive because most people consume the news on their phones
## Fluid (Review)
Everything as a percentage
When things are set as a percentage they respond fluidly and takes up the same proportional amount of space
Fluidity scales down until the content changes are made and looks nice
## Elastic (Review)
Elasticity is setting fonts and texts to use a responsive unit of measure
em's and rem's are the responsive form of text sizes

Imagine you are building a website and you write 5000 lines of css
You show it to your boss and they wanted all the fonts double the size

If that were the case you would need to find everywhere a font size was set and find the pixel values
Then do the math to double it
If you use em or rem you only have to make one change on one line

Below we have a section
Inside there is a paragraph
We set a font size to the section and then set the font size to 1em

The font size of em are responsive and look at the font of their parents
So if we change the value of section to 20px then the size of p will change because it is proportionate to

The issue is if someone adds another containing element and adds a font size it will mess up the size of your em values
Like if we added a div inside of section and set a font size there

This is where REM comes into play
They only get their font size from the `<html>` element
Whatever size you assign to `<html>` is where rem will get its styling from

Where rems get really helpful is that it also helps when people have accessibility concerns
The default font size for most browsers is 16px
What you can do is set the font size in html to 62.5%
This is because 62.5% of 16 you will get 10px
Now it is easier to adjust how big each rem is
But if someone sets a default font size to something bigger ALL of our fonts will respect that change
If you were to hardcode the pixel values or font size it won't respond when people request larger font

EMs & REM
```css
html{
  font-size: 62.5%;
}
section{
  font-size: 10px;
}

p{
  font-size: 1em  // 1 em equals size of parent
}
```
vs.
```css
p{
  font-size: 1rem;
}
<section>
  <p>Spam dominos in chat</p>
</section>
```

"Font size of the parent, in the case of typographical properties like font-size, and font size of the element itself, in the case of other properties like width."
- mdn
## Content Decisions (Review)
To have a responsive website you have to make decisions about what content you show
On a mobile device you don't have as much room and can only show important items 
You need to decide what is the most important and make sure it is given plenty of space

## How do we make content decisions? (Review)
We use media queries to make these content decisions
What gets, removed, changed, or moved

## Media Queries (Review)
These say 'at this screen size' set these css rules
```css
@media screen and (max-width: 600px) {
    h1 {
        color: blue;
    }
}
```

There are two schools of thought when it comes to making these content decisions

The first is to take your design, shrink it until it doesn't look good - that is your media query
Arrange it and repeat

The other idea is mobile first
You start with minimum content and as you get a bigger screen you add more content
This helps decide what content is the most important

It is up to you what approach to take and it may be dependent on the project
Try both ways

## Let's Code
A Media Query

## Important Addition To The Template (Review)
For media queries to work we need to add the following to our template
```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

What this does is interesting because media-queries don't actually work on mobile
What this meta tag does is take the width of the screen and make media queries work on phones and tablets

One other really important thing is there is another value we can add
This is called `user-scaleable` which can be set to no
Don't do this
It prevents people from trying to change the size of their website and is crucial to accessibility
## How can we make this responsive? (Review)
```
_____________________________
|___________________________|
|        |         |        |
|        |         |        |
|        |         |        |
|________|_________|________|
|___________________________|
```
Minimum Of 3 Media Queries
## Let's Code
Make It Responsive
## Homework
Do: Code Homework Layout Photos - HTML & CSS (3 layouts)
Read Go Deep On Things That Don't Make Sense
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 