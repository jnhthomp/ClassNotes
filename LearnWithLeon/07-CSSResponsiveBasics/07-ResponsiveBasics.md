# CSS - ResponsiveBasics
Slides: https://slides.com/leonnoel/100devs2-review-and-responsive
___
## Agenda
Questions?
Learn - How To Network (Part 1)
Review - CSS Fundamentals
Review - Box Model
Review - Float 😱
Review - Three Simple Layouts 
Learn - Responsive Basics
Learn - Flexbox 🎉
Homework - Flexbox Froggy + Movie
## Questions
About last class or life
## Checking In

Like and Retweet the Tweet
!checkin
## Friends?

Study Community Survey:
https://forms.gle/5qvnYVw3tA3Xaoye8
## CONGRATS! OCC (Jennifer)!
"I'm officially employed as a full-time software engineer... well, technically, the role is "consultant" and the position is "software engineer"!   I started my journey in Leon's last cohort as a single mom, an unemployed real estate agent during the pandemic, with two awesome kids, a noisy little dog, and a BIG DREAM.

Those of you on the other side of 40: you can do this. Listen to everything Leon tells you to do and then just do it. Those of you with family obligations: just keep going... take needed breaks, find support where you can get it. Those of you with mental health profiles: I hear you loud and clear (GAD/SAD, unmedicated). Neurodiverse folx: my peeps  we're all in it together and we've got this!

There are so many people who helped me keep going, I don't want to name names because I'm sure I'll forget super-important folx (I'm on a lunch break and have to do tons of stuff). But I mean this sincerely: I am eternally grateful for my cohort friends and our amazing, dedicated teacher @Leon."

https://discord.com/channels/735923219315425401/735936014832369687/938128809373339728
## Submitting Work

None Today
## Serious Money...

Thank you! 
## !unban

You may appeal your ban by filling out this form: https://bit.ly/100devs-unban
## Networking

3 Individuals Already In Tech
2 Coffee Chats
## Stranger > Acquaintance > Friend > Referral > Coworker
## How to talk good for folx who don't talk too good?

"How to win friends and influence people"
## How To Meet People
## Events

Start on Meetup.com and then find local boards
## Conferences

Google Interest + Conference or #100devs-events

(plenty are free or you can get a scholar/hard-ship)
## Community Groups

Local is always better
## Apps

Lunchclub

Bumble Bizz
## Friends & Family
## Normal Follow Up
Meet > Email > LinkedIn > Twitter
Next Day

Day 3

Day 6
## Want A Coffee Chat?
Email Follow Up 1 > Email Follow Up 2 > Last Email

1 Week

2 Weeks

1 Month
## USE THE SHEET!
Networking Google Sheet
https://docs.google.com/spreadsheets/d/1Be-6gYvrfi8l-M0RnObzdysRIG7N7Yyu6rIF0OHw0Q4/edit#gid=1771441293
## Pro Moves
https://www.google.com/alerts

RSS Feed
## Questions ?
Part 2 - Thursday w/ Examples
## TURN IT UP!
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
## ## CSS BREAK DOWN (Review)
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
## Let's Code (Review)
Simple Layouts
Use the templates to complete the layouts from the homework if you haven't completed them already
## Layout 1 (Review)
```
_____________________________
|                           |
|___________________________|
|         |      |          |
|_________|______|__________|
|             |             |
|_____________|_____________|
|                           |
|___________________________|
```

How could we do this?
We can guess that there is a header, a footer, and 5 sections in between
```html
<body>
  <header></header>
  <section></section>
  <section></section>
  <section></section>
  <section></section>
  <section></section>
  <footer></footer>
</body>
```

We know that all the sections are pretty much the same size except for the bottom sections
We can give them a different class to differentiate them
```html
<body>
  <header></header>
  <section></section>
  <section></section>
  <section></section>
  <section class="bigBottom"></section>
  <section class="bigBottom"></section>
  <footer></footer>
</body>
```

Now we just need to add css to add borders, position, and size
We can do our header and footer in one go since they are the same
```css
header, footer {
  height: 100px;
  border: 2px solid black;
}
```

Now we can do the sections we will define the smaller ones and then the larger ones will overwrite these styles for only the larger sections
Be sure to use `box-sizing: border-box` if you aren't using the template
```css
section {
  width: 33.333%;
  border: 2px solid black;
}
```

Now we want them all sitting next to each other so we need to float them
```css
section {
  width: 33.333%;
  border: 2px solid black;
  float: left;
}
```
This causes and issue because our footer isn't positioned correctly
We need the clearfix hack for this
```css
header, footer {
  height: 100px;
  border: 2px solid black;
  clear: both;
}
```

Then we can apply the sizing for the `bigBottom` sections
```css
.bigBottom {
  width: 50%;
}
```

The other two layouts will be done in office hours
## Layout 2 (Review)
```
_____________________________
|                           |
|___________________________|
|                           |
|___________________________|
|          |                |
|__________|________________|
|                           |
|___________________________|
```
## Layout 3 (Review)
```
_____________________________
|___________________________|
|     |            |     |  |
|     |            |     |  |
|     |            |     |  |
|_____|____________|_____|__|
|___________________________|
```
## Responsive Websites
Just hinting at this
To be responsive means a website looks good on all screens
This means it looks good when you look at it on a desktop/phone/tablet/smartfridge etc

A responsive website will add/remove/resize/rearrange content as the screen gets bigger or smaller
## Fixed Vs. Responsive

This is a example of how responsive design has changed
UPS from back in the day was not responsive at all 
UPS.com Wayback Machine


Boston.com
Has to be responsive because most people consume the news on their phones
## What makes a site responsive?
Fluid
Elastic
Content Decisions
## Fluid
Everything as a percentage
## Elastic
EMs & REM
```css
html{
  font-size: 62.5%;
}
section{
  font-size: 10px;
}

p{
  font-size: 1em  
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
## Content Decisions
## How do we make content decisions?
## Media Queries 
```css
@media screen and (max-width: 600px) {
    h1 {
        color: blue;
    }
}
```
## Let's Code
A Media Query
## Important Addition To The Template
```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```
## How can we make this responsive?
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
## The Magic Of Flexbox
## A One-dimensional Layout Model

css-tricks.com: Complete Guide To Flexbox https://css-tricks.com/snippets/css/a-guide-to-flexbox/
## Let's Code
A Flexbox Example
## Test CS:GO Server

24/7 Office
## Homework
Do: Responsive Layout

Read: The Complete Guide To Flexbox   

Do: http://flexboxfroggy.com/

Watch: Independence Day