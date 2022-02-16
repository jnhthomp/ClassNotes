# CSS - CSS Practice And Flexbox
Slides: https://slides.com/leonnoel/100devs2-css-review-flexbox
___
## Agenda
Questions?
Review - Network Reminder
Review - CSS Basics
Practice - Box Model
Review - Responsive Basics
Practice - EM / REM
Practice - Media Queries
Build - Using Flexbox
Homework - Layouts
## Questions
About last class or life

Q: How long will should you spend on a layout?
A: Don't get stuck for longer than 20 minutes, if you do move on or walk away and come back later

## Checking In
https://twitter.com/leonnoel/status/1493714553649041408
Like and Retweet the Tweet
!checkin

## Friends (Almost Done)?

Missed Out:
https://forms.gle/KuTBcouadvaJtUVz6
## Submitting Work

 Nothing due today!
Please keep putting work into those layouts!
## Homework
## Networking

1 Individuals Already In Tech
Push? 1 Coffee Chat
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
## USE THE SHEET! (Review)
Networking Google Sheet
https://docs.google.com/spreadsheets/d/1Be-6gYvrfi8l-M0RnObzdysRIG7N7Yyu6rIF0OHw0Q4/edit#gid=1771441293

Using a spreadsheet when you network is helpful
This sheet has a place to keep networking information in one place

The spark is one of the most important things to write, the thing you remember 
## Coding Challenges
Daily - Starting Thursday (Class 12)
We will start having daily code challenges next week
They will start fairly simple and easy but will get progressively more difficult
## Paid Client
Due by Mar. 29th
We will have a class on how to obtain clients and how to freelance
Must be $200 or more - no friends or family
## Celebrations
I started my first job as a Software Engineer on Feb 1st :)))  So I’m two weeks in, and yeah, doesn’t feel real, but the dream as a reality is slowly starting to sink in…
It seems silly to put it this way, but it really feels like a prize (a HARD WON prize!), and so if I could “dedicate” this celebration it would be to all of 100Devs; especially those folks feeling your first struggles with The Trough; and ESPECIALLY those folks who have been in that Trough for some time.  I really really really wasn’t sure I’d make it through—so many points where I doubted if I had accomplished anything at all.

I wish I could express how “un-ready” I felt, even after more than one official offer.  I wish I could tell you how many times I got myself GOT along the way!  With Imposter Syndrome!  With networking anxiety (networking got me this job)!  Slipping on my Anki (using it now on the job)!  I wish I could share the depths, the level I felt GOT…because I want to share this view from the other side   I’m sending all of my very best thoughts, wishes, and encouragement to the folks who feel the farthest away from the light: we go GET  

 You’re gonna need a crew for those boats and logs though.  LISTEN TO LEON, help others, ask for help (can be hard to learn how to do!).  I was helped by so many people, would never have made it without the community  Especially my teams (Automagics! Project Team! ) I’ve thanked you, but I can’t thank you enough  - Rel.Speedwagon

Hey all, I'm really excited to share that I accepted an offer from Amazon! I'll be starting as a Front End Engineer with Amazon Robotics in March!

Huge thanks to @Dabolical (James)  for your encouragement and support, and to @Leon  for giving me the tools and strategies for success (PREP/CAR were gold!), as well as the confidence to use them and go get! I am also extremely grateful for everyone here - I am honored to be part of such supportive and uplifting community. Thank you for letting me lurk, ask questions, and give support and advice when I'm able!

 

-Jeffn12
https://discord.com/channels/735923219315425401/735936014832369687/942824704333467758
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
Box Model Practice
See `class11-materials/box-model-practice`
```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Blank Template</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300&family=Roboto:wght@700&display=swap"
      rel="stylesheet">
		<!-- external CSS link -->
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<h1>This is an h1</h1>
		<h2>This is an h2</h2>
		<p>This is a paragraph with some <span>spans</span> inside of <span>the</span> paragraph</p>
		<section>
			<h2>This is an h2 <span>inside</span> of a section</h2>
		</section>

		<ol>
			<li>Please give the h1 some padding on two sides and zero on others, margin on the sides with no padding, thin purple border on sides without margin, gold background but the gold must be the exact color from the hufflepuff crest</li>
			<li>Please give the h2 significant padding on the left and right, a red border on the left and right but the red must be the same from the mighty morphin power rangers logo, and an orange background, and the roboto font </li>
			<li>Please give the section a thick magenta border on the left, 100px of padding on the top and bottom, and 200px of margin on every side without padding or border</li>
			<li>Please make the spans have thin Dodger Blue borders, padding on the bottom and right, and light red background </li>
		</ol>

	</body>
</html>
```

Lets follow the instructions
```css
/* Please give the h1 some padding on two sides and zero on others, 
margin on the sides with no padding, 
thin purple border on sides without margin, 
gold background but the gold must be the exact color from the hufflepuff crest */
h1 {
  padding: 10px 0;
  margin: 0 10px;
  border-top: 2px solid purple;
  border-bottom: 2px solid purple;
  background: rgb(248, 215, 62);
}
```

```css
/* Please give the h2 significant padding on the left and right, 
a red border on the left and right but the red must be the same from the mighty morphin power rangers logo, 
and an orange background, and the roboto font */
h2 {
  padding: 0 30px;
  border-left: 5px solid rgb(237, 48, 55);
  border-right: 5px solid rgb(237, 48, 55);
  background-color: orange;
  font-family: 'Roboto', sans-serif; ;
}
```
Remember for the roboto font you will need to get it from google and add the link to the head in your html
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
```

```css
/* Please give the section a thick magenta border on the left, 
100px of padding on the top and bottom, 
and 200px of margin on every side without padding or border */
section {
  border-left: 20px solid magenta;
  padding: 100px 0;
  margin: 0 200px 0 0;
}
```
Last one
```css
/* Please make the spans have thin Dodger Blue borders, 
padding on the bottom and right, and light red background */
span {
  border: 2px solid dodgerblue;
  padding: 0 10px 10px 0;
  background-color: rgb(155, 92, 92);
}
```


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

## Let's Code
Em/Rem Practice
Use the class11-materials/rem-practice file
```html
<!DOCTYPE html>
<html lang="en">
	<head>
  	<meta charset="utf-8">
  	<meta name="description" content="Your description goes here">
  	<meta name="keywords" content="one, two, three">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Blank Template</title>

		<!-- external CSS link -->
		<link rel="stylesheet" href="css/normalize.css">
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>

		<h1>Here is some text</h1>

		<section class="heyo">
			<p class="someText">More text lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam iusto explicabo assumenda aliquid veritatis nihil, totam odio autem impedit ipsum ratione recusandae ipsa nisi, omnis, porro alias nobis tempore temporibus.</p>

			<p class="moreText">Even more text lorem ipsum dolor sit amet consectetur adipisicing elit. Quo cumque esse odio similique. Reiciendis assumenda, nam qui nihil dolorem fugiat consectetur animi unde repudiandae delectus esse, perspiciatis quibusdam. Inventore, fugiat.</p>
			
			<p class="lastText">Last of the text lorem ipsum dolor sit amet consectetur adipisicing elit. Velit repellendus alias voluptatibus praesentium atque sequi itaque saepe possimus, tenetur distinctio obcaecati ipsa quo quia odio nihil? Suscipit quam at aperiam!</p>
		</section>

		<script type="text/javascript" src="js/main.js"></script>
	</body>
</html>
```
```css
/* Box Model Hack */
* {
  box-sizing: border-box;
}

/* Clear fix hack */
.clearfix:after {
     content: ".";
     display: block;
     clear: both;
     visibility: hidden;
     line-height: 0;
     height: 0;
}

.clear {
	clear: both;
}

/******************************************
/* BASE STYLES
/*******************************************/

/******************************************
/* LAYOUT
/*******************************************/

/******************************************
/* ADDITIONAL STYLES
/*******************************************/

/* Please make the someText 12px, 
moreText 16px, and 
lastText 27px */


/* Please double the font-size of someText, 
moreText, and 
lastText (still using px) */


/* Please set a base font-size on heyo, and 
make someText 12px, moreText 16px, and 
lastText 27px BUT use ems instead of px */


/* Please double the size of someText, 
moreText, and 
lastText using ems, but only make one change */


/* Please wrap lastText in a new section 
with the class of utOh and give it a base font size of 40px */


/* Please fix your doubling of lastText, buy converting to rems */

```

Follow each instruction:
```css
/* Please make the someText 12px, 
moreText 16px, and 
lastText 27px */
.someText {
  font-size: 12px;
}

.moreText {
  font-size: 16px;
}

.lastText {
  font-size: 27px;
}
```

The issue with the next set is it means we have to do math to make these changes
```css
/* Please double the font-size of someText, 
moreText, and 
lastText (still using px) */
.someText {
  font-size: 24px;
}

.moreText {
  font-size: 32px;
}

.lastText {
  font-size: 54px;
}
```

If we use 10px as the base font size it makes the math easier for getting a specific px value 
```css
/* Please set a base font-size on heyo, and 
make someText 12px, moreText 16px, and 
lastText 27px BUT use ems instead of px */
.heyo {
  font-size: 10px;
}

.someText {
  font-size: 1.2em;
}

.moreText {
  font-size: 1.6em;
}

.lastText{
  font-size: 2.7em;
}
```

Now it is easy to change the font size of all of these elements at the same time while keeping scale
```css
/* Please double the size of someText, 
moreText, and 
lastText using ems, but only make one change */
.heyo {
  font-size: 20px;
}
```

If someone changs the font size of the parent container (or adds a new parent container with a different font size) it will affect your font size when using em's
```css
/* Please wrap lastText in a new section 
with the class of utOh and give it a base font size of 40px */
.utOh {
  font-size: 40px;
}
```
```html
<section class="utOh">
  <p class="lastText">Last of the text lorem ipsum dolor sit amet consectetur adipisicing elit. Velit repellendus alias voluptatibus praesentium atque sequi itaque saepe possimus, tenetur distinctio obcaecati ipsa quo quia odio nihil? Suscipit quam at aperiam!</p>
</section>
```

You can avoid this by using rem's which is the same idea as em's except instead of getting the font size from the parent the font size is retrieved from the `<html>` font size
So we can have a single base font size that will make it easy to adjust all font sizes 
We use `62.5%` as the value for html because the default value for html will tend to be `16px` if we use `62.5%` it will set the default value to 10
We don't override this with a value of `10px` because people who need to set a larger base font size so they can read would not be able to see your content
They may have set a base font size of 32 so they can read and if you hardcode it to 10 it will override their settings
```css
/* Please fix your doubling of lastText, 
buy converting to rems */
html {
  font-size: 62.5%;
}
.lastText {
  font-size: 5.4rem;
}
```

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

## Media Queries Practice
Use 'class11-materials/media-query-practice'
```html
<!DOCTYPE html>
<html lang="en">
	<head>
  	<meta charset="utf-8">
  	<meta name="description" content="Your description goes here">
  	<meta name="keywords" content="one, two, three">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Blank Template</title>

		<!-- external CSS link -->
		<link rel="stylesheet" href="css/normalize.css">
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<main>
			<section></section>
			<section></section>
			<section></section>
		</main>
		<section class="bottom">
			<section></section>
			<section></section>
		</section>
		<script type="text/javascript" src="js/main.js"></script>
	</body>
</html>
```
```css
/* Box Model Hack */
* {
  box-sizing: border-box;
}

/* Clear fix hack */
.clearfix:after {
     content: ".";
     display: block;
     clear: both;
     visibility: hidden;
     line-height: 0;
     height: 0;
}

.clear {
	clear: both;
}

/******************************************
/* BASE STYLES
/*******************************************/


/******************************************
/* LAYOUT
/*******************************************/

main section, .bottom section{
  width: 33.3333%;
  height: 300px;
  border: 1px solid black;
  float: left;
}
.bottom section{
  width: 50%;
}

/******************************************
/* ADDITIONAL STYLES
/*******************************************/

/* On mobile, please make all sections stack  */

/* On tablet, please make the sections in main stack  */

/* On laptop, please keep the normal layout, but everything should be light green */

/* On larger screens, please keep the normal layout, but everything should be light blue */

```

Work through the instructions
```css
/* On mobile, please make all sections stack  */
@media all and (max-width: 500px) {
  main section, .bottom section {
    width: 100%;
    float: none; /* Not necessary but just to be clear */
  }
}
```

For the next one we have to do the same thing but target a different set of sections and a different width
```css
/* On tablet, please make the sections in main stack  */
@media all and (max-width: 850px) {
  main section {
    width: 100%;
    float: none;
  }
}
```

Now we just have to change the background color instead of re-arranging the content
Notice that the rules that were written in the layout section and not in  a media query are also obeyed here since there are no rules stating otherwise
We can also use `min-width` instead of just max width since we want to target basically anything larger than a tablet
```css
/* On laptop, please keep the normal layout, but everything should be light green */
@media all and (min-width: 850px) {
  section {
    background-color: lightgreen;
  } 
}
```

Note that you could also do it like this but you would need to assign the clearfix class to `main` and `.bottom`
This is because the contents inside of them are floated which means they collapse since the contents are 'floating' above them and they have nothing to hold
```css
/* On laptop, please keep the normal layout, but everything should be light green */
@media all and (min-width: 850px) {
  main, .bottom {
    background-color: lightgreen;
  } 
}
```

Now lastly we can change the background color for larger screens
```css
/* On larger screens, please keep the normal layout, but everything should be light blue */
/* On larger screens, please keep the normal layout, but everything should be light blue */
@media all and (min-width: 1024px) {
  main, .bottom {
    background-color: skyblue;
  } 
}

```




## Important Addition To The Template
This is needed in order for `min-width` and `max-width` media queries to work on mobile devices

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

## Time For Some Layouts
## 🚨 Let's Talk About Floats 🚨 (Review)
Flexbox and grid are far superior and floats aren't as common to use when developing new applications
However it is important to know about floats because floats is how it was always done before
You will need to know this when working on existing projects

The biggest thing to keep in mind is that it is all about percentages
Many people are able to pick up floats fairly quickly and be better with it than flexbox
Eventually we will be moving to flex and grid but for now we will get used to floats

## Flexbox
There are some games that can be used to practice flexbox
There is a lot of vocabulary that is used with flexbox but it makes organizing content easier
## 🚨 WARNING 🚨
We are going to write bad code
We are going to go through some of our layouts with flexbox instead of floats

## Let's Write BADD CODE
With Flexbox instead of css

## Layout 1
Techcruch (see class11-materials/layout1) for html structure
Before we used floats and widths to get those areas to sit next to each other

Instead with flexbox we need to use `display: flex` to get items to sit next to each other
We want to target `nav`, `main`, and `aside` which are all contained in the `body` tag
Comment out the old code and add `display: flex` to the body
```css
body {
  display: flex;
}
```

And done. Next.
## Layout 2
Khan Academy (see class11-materials/layout2) for html structure
Khan academy has a nav and then two areas sitting next to each other
In the html the header has a nav inside of it with items we need to sit next to each other

We know to make items sit next to each other we just need to use `display: flex` on the parent (`nav`)
```css
nav {
  display: flex;
}
```
Now the nav items are sitting next to each other but we want the li's to sit next to each other too so we will add the ul to that as well
```css
nav, ul {
  display: flex;
}
```
There is something missing and that is the spacing between the elements
We can do this by using the `justify-content` property and `space-around` as a value
```css
nav, ul {
  display: flex;
  justify-content: space-around;
}
```

The problem now is that the `ul` doesn't have enough room to display the content
We would normally do this by providing a width
We can do this with flex by using `flex-basis` which lets us assign a percent value to our ul
```css
ul {
  flex-basis: 30%;
}
```

The last thing to worry about is the two sections inside of `main`
We want them to be side by side and want them to be display flex
We don't want to justify the content though so we will put it in its own rule
If we did justify the content with space around then all of the content including the heading and paragraph 
```css
main {
  display: flex;
}
```
The picture is a little big, downsize it by giving it a width
```css
img {
  width: 30%;
}
```
However the image is now far to the left
We can just add space around to the section holding the image
```css
nav, ul, main section:first-child {
  display: flex;
  justify-content: space-around;
}
```
Now the page is laid out as expected
## Layout 3
BBC (see class11-materials/layout3) for html structure

Here we have a navbar which we need to use flex on to get the items side by side
Then we want to space them out and give the ul some room
```css
nav, ul{
  display: flex;
  justify-content: space-around;
}

ul{
  flex-basis: 60%;
}
```
Next we want the items in main to sit next to each other so we can add it to the list
```css
nav, ul, main{
  display: flex;
  justify-content: space-around;
}
```
In order to get both the sections to be large, and also centered we can add a size to them with flex-basis 
There is an issue with the h2 but just throw it inside of the first section and don't worry about it
```css
main section{
  flex-basis: 48%;
}
```
Now for the second section inside of the main
We want to make them four squares inside of a larger square
To do this we have to flex the section
THen we want to use flex-wrap so they won't try to fit in a single line but will go to a second line if needed
Then we can use flex-basis to give each section 50% width
This will ensure that only 2 can be on a single line and the second two will wrap below to the next line
```css
main section + section{
  display: flex;
  flex-wrap: wrap;
  flex-basis: 50%;  
}
```

For the bottom section we can give the section a display flex
The easiest way to do this is to use a class `.container` and add the class to the container for the bottom articles
You will need to move the h2 since it will throw it off
```css
.container{
  display: flex;
}
```
```html
<section class="container">
  <section>
    <h2>News</h2>
    <img src="#" alt="Joe Byron">
    <h3>Lorem ipsum dolor sit amet consectetur</h3>
    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Unde voluptates, distinctio recusandae ea praesentium</p>
    <span>US ELECTION 2020</span>
  </section>
  <section>
    <img src="#" alt="Joe Byron">
    <h3>Lorem ipsum dolor sit amet consectetur</h3>
    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Unde voluptates, distinctio recusandae ea praesentium</p>
    <span>US ELECTION 2020</span>
  </section>
  <section>
    <img src="#" alt="Joe Byron">
    <h3>Lorem ipsum dolor sit amet consectetur</h3>
    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Unde voluptates, distinctio recusandae ea praesentium</p>
    <span>US ELECTION 2020</span>
  </section>
</section>
```

## Homework
Do: Code Homework Layout Photos - HTML & CSS
Read: Go Deep On Things That Don't Make Sense
