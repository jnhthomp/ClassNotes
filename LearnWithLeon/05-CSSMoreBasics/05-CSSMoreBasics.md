# CSS - More Baics
Slides: https://slides.com/leonnoel/100devs2-css-more-basics
___
## Agenda
Questions?
Review - CSS Fundamentals
Review - Specificity
Review - Relationship Selectors
Learn - Box Model
Learn - Simple Layout 
Lab - Create A Simple Layout
Homework - 3 Simple Layouts

## Questions
About last class or life
Nothing relevant to class
## Checking In
Like and Retweet the Tweet
!checkin
https://twitter.com/leonnoel/status/1486104346227970050

## Submitting Work
Khan Academy & Techcrunch HTML
in separate Glitches
Submit URL here: https://forms.gle/DmTgMUiGPUURWPmD7

## Want Friends? This Week
Alumni Twitter Space
This Friday Jan. 28th 6:00pm ET

## Alumni Twitter Space
This Friday Jan. 28th 6:00pm ET

## Channel Points
Things are now more expensive and rate limited (can only be used once a class)
Prices will be adjusted 

## Typing
Do not worry about having bad typing right now
You will gain speed over time
Right now focus on typing as correctly as you can efficiently
It is important to keep the strain on your fingers to a minimum

## Deep Not Wide
Learn what we are focusing on in class
Don't try to spread yourself too wide trying to learn things not covered in class

## YOU ARE DOING ANKI FINE
If you are doing ANKI good job
Be sure to do it every single day to maintain and continue to learn

## VOMIT CODE
Your goal for the first time is to be vomit your code and clean it up later
Just get it done and make it work
Then later refactor it to make it nice
If it does the thing it is supposed to do and looks like the photo, great!
We don't care about it being great code right now
We just want it to work while we learn

## YALL NASTY
Don't get to caught up in looking at other peoples code vomit and comparing it to yours
Don't feel bad about your code vomit because it may not be as nice as theirs

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

## ## CSS (Review)
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
## Let's Review Some Simple Styles
## Color (Review)
There are four main ways to use color in css
- Word
  - `color: red;`
  - Simple, name a color and if there is an existing preconfigured css reserved word for that color it will show
  An obvious issue with using colors is that while it will get you a general color you can't get very specific
  Usually this is great for prototyping or doing something quickly 
  For a list of these colors see https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#color_keywords
- Hex 
  - `color: #FF0000;`
  - Describes color by using 6 hexadecimal (1-9 and then A-F to represent 10-15 as single digit)
    Each pair combination (above example the first pair would be `FF`) is capable of representing a number up to 255
    The first set represents red (`FF` would be 255 value for red)
    The second set represents green (`00` would be a 0 value for green)
    The third set represents blue (`00` would also be 0 for blue)
- RGBa
  - `color: rgba(255, 0 0, 1);`
  - Similar to hex it describes color using 3 rgb values from 0 to 255 but just uses base 10 digits instead
    It also has a 'alpha' ('a' in 'RGBa') that can be used for opacity which is a value from 0 to 1 with 1 being solid and 0 being transparent
- HSLa
  - `color: hsla(0, 100%, 50%, 1);`
  - This uses 'hue', 'saturation', 'lightness', and 'alpha'
    Hue is a number between 1 and 360 to represent a color on the color wheel by degree
    Saturation describes the intensity of that color; think of it like grey scale, more saturation is less grey and less saturation is more grey
    Lightness represents how much white is in the color; turing u the whiteness will set it to a very bright version of whiteout version of that color while turning it down will set it to nearly black
    For example if you had 
    Alpha is the same as in 'RGBa' and determines the 'alpha' or opacity
    For example red is the first color on the color wheel so it will have a degree of 0
    So `hsla(0, 100%, 50%, 1)` would target the color that is at the 0 degree on the color wheel (red) with 100% saturation (as red as can be) and 50% lightness (not whited out and not blacked out either) and 1 on alpha (no transparency)
    If you were to turn up the lightness to 80% you would get a more pink color

```
h1{
  color: red;
}
h2{
  color: #FF0000;
}
p{
  color: rgba(255,0,0,1);
}
span{
  color: hsla(0, 100%, 50%,1);
}
```
## ## Font-family (Review)
Fonts are actually files and you need to provide that file to the browser so it knows how to render those fonts
Many fonts can be found for free on Google fonts: https://fonts.google.com/

When using a font you have to link it both within your html document as well as in css
Within HTML you have to provide the file in the within css you have to apply that style
The link to the font needs to come before the css file because otherwise your css file will be referencing a font that it cannot find because it has not yet been provided by the html file

html
```
<head>
  <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300;
  400;700&display=swap" rel="stylesheet">
</head>
```

css
```
p{
  font-family: 'Source Sans Pro', 'Helvetica' sans-serif;
}
```
Notice here we have multiple fonts listed
This is so that if for some reason our page or browser cannot access 'Source Sans Pro' the browser will the use 'Helvetica' and if that is not available the sans-serif will be used

## Font-weight (Review)
When adding fonts through google fonts you must also select the weights that you need as well
You can see in this link that 300, 400, and 700 are selected
Why not select all the weights? More files to download to which will result in longer times to load content you don't need
html
```
<head>
  <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300;
  400;700&display=swap" rel="stylesheet">
</head>
```
css
```
p{
  font-family: 'Source Sans Pro', 'Helvetica' sans-serif;
  font-weight: 700;
}
```

## 🛑 Stop 🛑 (Review)
How to research?
 
🚨 Use the MDN 🚨
The MDN has just about everything you could need to know about html and css
https://lmgtfy.com/?q=italicize+text+css+mdn&s=d

Use https://learn.shayhowe.com/html-css/

## Let's Code 
Some Basic CSS
Materials are in the 'class05-materials' folder
Inside there is basic-css-two
That has an html file with some comments that give you intructions
Try to do them within 5 minutes

The first instructions are:
```html
<!-- Please make the li's blue, underlined, 15px, and have a gray background -->
		<header>
			<nav>
				<ul>
					<li>News</li>
					<li>Sports</li>
					<li>Weather</li>
				</ul>
			</nav>
		</header>
```

We can do this with:
```css
/* Please make the li's blue, underlined, 15px, and have a gray background */
li {
  color: blue;
  text-decoration: underline;
  font-size: 15px;
  background-color: gray;
}
```

Then we have:
```html
<!-- Please make this section have a height of 300px, a light purple background, a gold border that is 5px thick -->
<section>
  <h1>Hello, Twitch!</h1>
</section>  
```
This is easy:
```css
/* Please make this section have a height of 300px, 
a light purple background, a gold border that is 5px thick */
section {
  height: 300px;
  background-color: rgb(206, 123, 206); /*Used color picker*/
  border: 5px solid gold;
}
```

Then inside of that section:
```html
<!-- Please make this h1 30px, gold, 
centered, and use the Source Sans Pro Font  -->
<h1>Hello, Twitch!</h1>
```
This is a little more involved
For this you will need to get the font from google fonts
Remember to select the 400 size and add the link to your html
```css
/* Please make this h1 30px, gold, centered, and use the Source Sans Pro Font  */
h1 {
  font-size: 30px;
  color: gold;
  text-align: center;
  font-family: 'Source Sans Pro', sans-serif; /*Added fallback just in case*/
}
```

Now for the footer:
```html
<!-- Please make this footer have a dark brown background, 
300px in height, and only 70% width. -->
		<footer>
			<h2>Hello, Mixer!</h2>
		</footer>
```
This is another easy one:
```css
/* Please make this footer have a dark brown background, 
300px in height, and only 70% width. */
footer {
  background-color: #281b0d; /*used color picker*/
  height: 300px;
  width: 70%
}
```

Now last we have the `<h2>`
```html
<!-- Please make this text have a line through it -->
<h2>Hello, Mixer!</h2>
```
We can use the `text-decoration` property for this
```css
/* Please make this text have a line through it */
h2 {
  text-decoration: line-through;
}
```

## ## Selecting By Relationship (Review)
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

## Let's Code
Some Relationships
THis is in the 'relationship-css-two' folder
4 minutes:

First here is the full html:
```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Blank Template</title>
		<!-- external CSS link -->
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<h1>Hello</h1>
		<section>
			<h2>World</h2>
			<h2>Zebra</h2>
		</section>
		<section>
			<article>
				<h2>Unicorn</h2>
				<h2>Hufflepuff</h2>
			</article>
		</section>
		<article>
			<h2>Duck</h2>
		</article>
	</body>
</html>

```

Now for the css challenges:
```css
/* Please Make only World and Zebra Blue */
section>h2 {
  color: blue;
}
```
```css
/* Please Make only Zebra Purple */
section>h2+h2{
  color: purple;
}
```
```css
/* Please Make only Hufflepuff Gold */
article>h2 + h2 {
  color: gold;
}
```
Here is where we run into problems
```css
/* Please keep Hufflepuff Gold and make ONLY Unicorn Gray  */
article>h2{
  color: gray;
}
```
That will make duck gray which we don't want
If we are more specific and do this:
```css
/* Please keep Hufflepuff Gold and make ONLY Unicorn Gray  */
section>article>h2{
  color: gray;
}
```
This will return duck to default but will make hufflepuff gray
This is because we are adding another point of specificity so it overrides the previous rule for hufflepuff
We can give hufflepuff more points again by adding more specificity to it
```css
/* Please Make only Hufflepuff Gold */
section article>h2 + h2 {
  color: gold;
}
```

## ## IDs & Classes (Review)
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

## Let's Code
Specificity Practice
We are going to practice specificity
This is in 'specificity-practice' folder in 'class05-materials'
Do it in 4 minutes
There are quite a few ways to do these since there are so many classes and ID's
Here is the html:
```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Blank Template</title>
		<!-- external CSS link -->
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<h1 id="hi">Hello</h1>
		<section class="top">
			<h2 id="rhino" class="africa fourLegs">Rhino</h2>
			<h2 id="zebra" class="africa fourLegs">Zebra</h2>
		</section>
		<section class="middle">
			<article>
				<h2 id="uni">Unicorn</h2>
				<h2 id="bestHouse" class="harryPotter triWizardChamp badger">Hufflepuff</h2>
			</article>
		</section>
		<article class="areDucksDinosaurs">
			<h2 class="likesToQuack fight1Or100">Duck</h2>
		</article>
	</body>
</html>
```

The problems to solve are in the css

For the first one we can select both Rhino and Zebra at the same time by using a class they both have in common
```css
/* Please Make only Rhino and Zebra Blue */
.fourLegs {
  color: blue;
}
```
You can target multiple different ids at the same time as well
```css
/* Please Make only Rhino and Zebra Blue */
#rhino, #zebra {
  color: blue;
}
```
Or we can target the element itself within the section that is assigned a class
```css
/* Please Make only Rhino and Zebra Blue */
.top>h2 {
  color: blue;
}
```

Because of the keyword ONLY the best answer is probably to target the ID's since we can have things added later that we don't want to be blue

Now for the next one 
```css
/* Please Make only Hufflepuff Gold */
#bestHouse {
  color: gold;
}
```
Again there are other ways to target this but the word only means the best way is to use an id so nothing else gets targetted on accident

```css
/* Please select Duck with the highest level of specificity possible */
html > body > h1#hi + section.top + section.middle + article.areDucksDinosaurs > h2.likesToQuack.fight1Or100 {
  color: green !important; /*just to check*/
}
```
The best way to use the most specificity possible is to start from the element itself and work backwords
If you type multiple classes or element selectors with no space you are wanting to fulfill all of those requirements
So we are saying that we want an element that is an `<h2>` that has the classes 'likes to quack' AND 'fight10or100'
That `<h2>` needs to be immediately inside of an `<article>` with the class 'areDucksDinosaurs'
The article element also needs to be an immediately sibling of a section with the class middle etc.
The `!important` adds an extra 1000 to the rule it is applied to

Do rhino for homework

## The Box Model
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

## Let's Draw
The Box Model
(See above)

## Time For Some Layouts
## 🚨 Let's Talk About Floats 🚨
Flexbox and grid are far superior and floats aren't as common to use when developing new applications
However it is important to know about floats because floats is how it was always done before
You will need to know this when working on existing projects

The biggest thing to keep in mind is that it is all about percentages
Many people are able to pick up floats fairly quickly and be better with it than flexbox
Eventually we will be moving to flex and grid but for now we will get used to floats

## Floats
The biggest thing about floats is that when you float an element it will try to get into a corner
If you float something left it will try as hard as it can to go up and to the left as much as it can 
Same goes for the right
If you float something right it will try as hard as it can to go up as far as it can and to the right as far as it can

When you use floats you are using a side effect
If stuff tries to get into a corner they will sit next to each other

## 15 Minutes OF PAIN
Here is a layout
```
____________________________
|          header           |
|___________________________|
|         |      |          |
|  sect   | sect |   sect   |
|         |      |          |
|_________|______|__________|
|          footer           |
|___________________________|
```
This can be done with floats
The header would be 100% width and float left so it would go to the top and to the left by itself

First create an index.thml file and add the boilerplate for index
Then create css.html and link it within index.html

Now within the body of index.html add a header, footer, and three sections
```html
<body>
  <header class="header"></header>
  <section class="one"></section>
  <section class="one"></section>
  <section class="one"></section>
  <footer class="footer"></footer>
</body>
```
Now we can add some css to style the header
```css
header {
  background-color: coral;
  height: 100px;
}
```
But we will want to do something pretty similar for the footer too so we can add that to this rule as well with a ,
```css
header, footer {
  background-color: coral;
  height: 100px;
}
```

Now we can start on the sections
We have three of them and we want them to take up the whole space so we will set their width to '33.333%'
```css
section {
  height: 300px;
  width: 33.333%;
  border: 5px solid red;
  background-color: cornflowerblue;
}
```
If we do this our sections are the correct size but instead are stacked on top of each other

But if we float them left:
```css
section {
  height: 300px;
  width: 33.333%;
  border: 5px solid red;
  background-color: cornflowerblue;
  float: left;
}
```
Our page is all jacked up
The footer went all the way up to the header
This is because it is almost like the sections that were floated were literally lifted off the page and the footer went up underneath them 
Remember all elements generally want to be as close to the top of the page as possible
The way to fix this is called a clearfix

clear is a keyword to tell elements to look to the left or right and if there is anything floating to render after it instead of going up underneath
So we can fix the footer by adding clear to it
```css
header, footer {
  background-color: coral;
  width: 100%;
  height: 100px;
  clear: both;
}
```

Now our issue we have three sections but only two are next to each other
This is because of the box model
We defined the inner part of the element to be a third of the page but when we add a border the total size of the element is wider than a third of the page

We could of course do all the math and calculate what percentage our box has to be with these borders
Or we could tell the browser to ignore the border

To do this we will go to the top of our css and use the asterisk (*) as our selector which means select EVERYTHING
Then we can use a property called `box-sizing` and set it to `border-box`
This will make the border be counted as part of the 33.333% width that we set on the section
```
* {
  box-sizing: border-box;
}
```

## Homework
Do Rhino specificity from specificity practice
To Complete The Three Layouts
Read: https://learn.shayhowe.com/advanced-html-css/responsive-web-design/

## Layout 1
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
## Layout 2
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
## Layout 3
```
_____________________________
|___________________________|
|     |            |     |  |
|     |            |     |  |
|     |            |     |  |
|_____|____________|_____|__|
|___________________________|
```
