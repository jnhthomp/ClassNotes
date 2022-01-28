# CSS - Review And Responsive
Slides: https://slides.com/leonnoel/100devs2-review-and-responsive
___
## Agenda
Questions?
Review - HTML Fundamentals
Review - CSS Fundamentals
Review - Box Model
Review - Float 😱
Review - Three Simple Layouts 
Learn - Responsive Basics
Homework - Simple Responsive Site
## Questions
About last class or life
(nothing applicable)
## Checking In
Like and Retweet the Tweet
!checkin
https://twitter.com/leonnoel/status/1486829337026260994

## Friends?
Study Community Survey:
https://forms.gle/5qvnYVw3tA3Xaoye8

For smaller groups use the link above to be added to a study group

## Alumni Twitter Space
Tomorrow Friday Jan. 28th 6:00pm ET

## Submitting Work

Simple Site Lab and Layouts in codepen.io
Submit URLs here: https://forms.gle/rvPhDrbp56DQKgPaA

## Sleep?
Make sure to prioritize getting good sleep
Memory consolidation happens when you are sleeping
Make sure you are not studying so much that you cannot learn enough
Try https://sleepyti.me and try their suggested sleep times to not interrupt your rem cycle when you wake

## YOU OWE YOU
You owe it to yourself to make yourself better and put in the time. Do it.

## What is the internet? (Review)
To be clear this is a 'jobs' program 
This will cover more than just coding
To make the lessons behind coding click properly learning to code isn't just learning to type in code
You also need to understand the technologies that run our code
We will be doing full stack web development so we need to understand the technologies behind the web

So what is the internet?
The internet is like a wire

On this wire there are two different kinds of computers
```
[client devices]-------------[servers]
```
Client devices are devices that consume content on the web
This includes phones, laptops, computers etc.

Servers are called such because they serve webpages, data, and content
They will provide html, css, js to client devices

This is done when a request comes from a client device and arrives at a server
The server hears this request and responds with... something

If the teacher asked you to open a word document you would probably use microsoft word to open it
If he gave you a pdf you would probably open it with adobe

The idea here is that we have programs that we can run on our devices to run certain files

On our computers we have a program called a browser (firefox, chrome, internet explorer etc)
These browsers are able to open and run html, css, and js files and display things based on those files

From our client devices we are using a program called a browser and making requests to a server
The server hears this request processes it and returns something

Think of it like a restaurant 
From your table you can make requests from the kitchen and the kitchen will send you food
You don't really care about what happens in the kitchen you just expect to receive the food

Our browsers are made to run the files that are sent back from

For an example lets pretend we will order from dominos
From the browser if we visit dominos.com the request will leave the phone and browser and make it all the way to the dominos server
Then the server will respond with html, css, and js files (these are individual files that handle different things)
The browser will receive these and put them together to display the website
The actual content such as the text and pictures is html
The styling such as colors and positions and sizing is css
Then any actions such as being able to drag ingredients or interact with the content is js (javascript)

There are a lot of things that happen on the server that we are not interested in such as processing credit cards, storing orders, sending the order to the local dominos etc.
That stuff is considered server side

We are here to be full stack web developers
This means we should be able to write code that runs client side such as html, css, and js as well as the server side stuff that goes on in the background

People who focus on the client side are called frontend developer
People who focus on the server side are called backend developer
People who focus on both are called full stack developers

You need to know at least the basics of both to be able to do either even if you only want to focus on one
You won't really know which you prefer until you build a full app from scratch

Remember how we said the internet is a wire?
There are actually wires that go along the atlantic that transmit 50tb per second with 8 wires per tube
That is how are requests are actually able to move around the world
These requests only have 3 seconds to go from the client to the server and back
If it takes longer then people 'bounce' (real term)
when someone bounces they leave because the site took too long

There are a lot of things that happen between the client and server
One example is wifi it must first go from your phone to your router
Then after it leaves the router it will go to your isp (internet service provider)
These are the people who we pay to connect to these big wires
ISP's focus on something called 'last mile' 
They are really good at connecting your house to these big pipes
It can cost $5 million  PER BLOCK to lay fiber in a city like Boston

After leaving the ISP your request will be sent to a dns (domain name server)
This is another computer on this wire and acts as a fancy phonebook
Imagine you were trying to get to someones back porch what would you need?
GPS would give that exact location
The same thing happens on the internet
When we type in dominos.com that is not enough to find the server
What we actually need is an ip address
An ip address is an exact address for a server so you can find it easier
There is no way to remember ip addresses so we use easy to remember website names
We provide these names to a dns which translates something like dominos.com to an ip address like 23.11.226.94
Then you are routed to the server which also has to jump through these hoops to get the response back to the client

This all works because of http (hypertext transfer protocol)
This allows us to make requests and receive responses

Something changed recently that made http better
Now we have https (hypertext transfer protocol secured)
What used to happen is that when your request was making this journey any computer or router in the network could intercept and see these requests and responses
Now this data is encrypted
You can still see a lot of this data but now the content within the request is encrypted
ISPs are actually allowed to record and sell this data

Incognito browsers don't stop this it only prevents local history from being recorded
It doesn't prevent any of the data from getting lost

If you don't want your isp or dns to see that information you have to use a vpn (virtual private network) instead
This is someone else's computer that you send encrypted traffic to
Then that other computer will make that request for you and send you an encrypted request back
The thing about VPN's is that it is only secure if you trust the vpn provider more than you trust your isp

There are other technologies like TOR which also work to privatize and anonymize requests but that is not important now
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

## HTML SYNTAX (Review)
We said that HTML, CSS, and JS are the lanuages of the web
(although html and css are not really languages)
NEW: We consider something a language if you can perform logical operations and get responses from them

Like any language though html has a syntax 
These are basically spelling and grammar rules that you must follow with html
For example You must encase your content within an opening tag and a closing tag
```
 (opening tag)     content
|--------------||----------|
<p class="nice">Hello There!</p>
   |__________|             |__|
    class/attribute        Closing tag
```
NEW: Attributes help to describe and format the content inside of the tags
NEW: MDN is mozilla's official documentation on the web

AR Q: What are html attributes?
AR Q: Where can you find documentation on HTML, CSS, and JS?
## Time For Some TAGS (Review)
When using tags it comes down to the semantic reasons behind that tag and the importance of the content
## Heading Elements (tags) (Review)
```
<h1> MOST IMPORTANT </h1>
<h2> .............. </h2>
<h3> .............. </h3>
<h4> .............. </h4>
<h5> .............. </h5>
<h6> .............. </h6>
```
These are called heading elements
They are used to describe content after it
Think of them like titles 
Sometimes there are multiple types of headings or sections that need described

`<h>` tags with larger numbers are smaller and less important text headings
`<h1>` is for the most important content on the screen and should technically be used once per page
You should move to higher numbers when content is less important than other content

## Other Text Elements (Review)
```
<p> Paragraph </p>
<span> Short text </span>
<pre> Preserves Whitespace </pre>
```
`<pre>` This should probably never be used 
what it does it preserves all whitespaces within the tag
The issue is that it messes with positioning and spacing which is more under css
## Containing Elements (Review)
```
<div> </div> // General containing element
<section> </section> // Groups like content together
<article> </article>
<aside> </aside>
<header> </header>
<footer> </footer>
```
Most of what we do on the web is containing other content
With HTML5 we got a lot of new containing elements
Before this we pretty much only used divs

`<section>` can be used to hold content that is related to each other
`<article>` is meant to contain things meant to be shared
  content in this tag can usually standalone
`<aside>` This is for extra content such as ads
`<Header>` Group content at beginning of document
`<Footer>` Group content at the end of a document
## Let's Mark Up
BBC Solution
Lets try marking up the bbc site that was homework a while ago
Use the image in 'class06-materials' for reference
We will do this in only html right now

Looking at the header we can see there is a nav inside
Inside of that nav there are images and list of links

Then the next area is probably going to be a section and inside of it there could be considered two more sections containing image, h1, span, and h2 tags as needed
For some of these we might even set these as background images in html instead of using an image tag

Then below that follows a very similar pattern having a section with subsections to hold the images and titles
One could consider these small subsections at the bottom an article but don't have to be

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
## Font-family (Review)
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
We will start with 'basic-css-two'
Try to perform the comments in css within 4 minutes
Hint: You may need to google for the last one as there is a new property that we don't know

The html is irrelevant since we are targetting tags directly

For the first css we should know all of these:
```css
/* Please make the anchor tags gold, 20px, and have a purple background */
a {
  color: gold;
  font-size: 20px;
  background-color: purple;
}
```

Second is similar except you may need to look up a value to get a lighter shade of orange
```css
/* Please make the section have a height of 200px,
a 10px thick blue border, and a light orange background */
section {
  height: 200px;
  border: 10px solid blue;
  background-color: rgb(255, 218, 148);
}
```

The third one is straightforward:
```css
/* Please make the aside have a height of 300px, a thin red border, and a teal background  */
aside {
  height: 300px;
  border: 1px solid red;
  background-color: teal;
}
```

Finally the last one is slightly tricky because we don't know how to add color to text decoration:
```css
/* Please make the aside paragraph have white text, 18px, and a red underline */
aside > p {
  color: white;
  font-size: 18px;
  text-decoration: underline;
  text-decoration-color: red;
}
```

That shouldn't have been too bad, we have covered everything at this point except for `text-decoration-color` which may have taken some googling and maybe finding a color for orange
You can also make it one line with:
```css
aside > p{
  text-decoration: underline red;
}
```
Or you could have used `border-bottom: 1px solid red;` but would have taken some tweaking to fix the length

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
## Let's Code
Some Relationships
Now try the 'relationship-css-two' in 4 minutes

For this the html is relevant since we need to utilize relationships:
```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Blank Template</title>
		<!-- external CSS link -->
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<header>
			<nav>
				<ul>
					<li><a href="#">sunshine</a></li>
					<li><a href="#">rainbows</a></li>
				</ul>
				<ul>
					<li><a href="#">bob</a></li>
					<li><a href="#">pizza</a></li>
				</ul>
			</nav>
		</header>
		<section>
			<h1>Look behind you!</h1>
			<h2>Just kidding!</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliqui.
			</p>
		</section>
		<article>
			<h1>Breaking News: It is hot!</h1>
			<h2>Really hot</h2>
			<h2>Like WILD hot</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Read more <a href="#">here</a>
			</p>
		</article>
		<aside>
			<p>This is an ad. Follow me on <a href="https://leonnoel.com/twitter">twitter</a> and here on twitch!</p>
		</aside>
	</body>
</html>

```

Now we can try targetting the relationships with css
Since this is the only section with an h2 this is easy
```css
/* NO classes or IDs */
/* Please make only "Just kidding!" yellow */
section > h2 {
  color: yellow;
}
```

Next: we could be less specific and just say `aside a {...}` also
```css
/* Please make only "twitter" red and 20px */
aside > p > a {
  color: red;
  font-size: 20px;
}
```

Since both 'really hot' and 'like wild hot' are h2 tags within an aside we can use the cascade to our advantage or add more specificity
```css
article > h2 {
  color: purple;
  font-size: 12px;
}

article > h2 + h2 {
  color: blue;
  font-size: 20px;
}
```

Lastly we have:
```css
/* Please make only bob and pizza green */
nav>ul + ul>li > a {
  color: green;
}
```
For this one we had to be careful and use the next sibling to avoid changing the color of 'sunshine' and 'rainbows' as well

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
## Let's Code 
Specificity Practice
For this excercise use the 'specificity-practice' folder
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
		<header class="top">
			<h1 id="bringThePain" class="painIsFrenchBread titans">Welcome To The Thunderdome</h1>
		</header>
		<section id="rugratsWildThornberrysBestCrossOverAllTime">
			<h2>Hello, world!</h2>
			<aside class="extraExtraReadAllAboutIt">
				<h3>This is an ad. You are beautiful.</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</aside>
		</section>
		<section id="chunkyMilk">
			<h2>I like turtles.</h2>
			<p class="passTheRemote turtles" >Let's get down to business to learn some web development.</p>
		</section>
	</body>
</html>

```
Now follow the instructions in the css file
The first one is pretty straightforward
```css
/* Please make "This is an ad..." blue, but make sure it is specific enough 
that you could add other h3's somewhere eles in the document. */
aside.extraExtraReadAllAboutIt > h3 {
  color: blue;
}
```
We could have assigned an id to h3 to ensure but this is specific enough for the point of this exercise

This one is another straightforward one but we don't have as specific of contsraints
```css
/* Please make "I like turtles." red */
section#chunkyMilk > h2 {
  color: red;
}
```

Now we need to use as much specificity as possible 
It helps to work backwards and add specificity as you go
```css
/* Please select "Hello, world!" with the highest level of specificity possible*/
html > head + body > header.top + section#rugratsWildThornberrysBestCrossOverAllTime > h2{
  color: coral !important;
}
```

```css
/* Please select "Let's get down to business..." with the highest level of specificity possible */
html > head + body > header.top + section#rugratsWildThornberrysBestCrossOverAllTime + section#chunkyMilk>h2 + p.passTheRemote.turtles{
  color: coral !important;
}
```

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
## Let's Draw (Review)
The Box Model
(See above)

## Let's Code
The Box Model
For this exercise use the 'box-model-practice' folder in 'class06-materials'
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
		<h1>This is an h1</h1>
		<h2>This is an h2</h2>
		<p>This is a paragraph with some <span>spans</spans> inside of <span>the</span> paragraph</p>
		<section>
			<h2>This is an h2 <span>inside</span> of a section</h2>
		</section>

		<ol>
			<li>Please make the h1 30px, with a little padding on the left, and thin red border</li>
			<li>Please make the h2 25px, with padding on top/bottom, a thick gold border, and margin on the top/bottom</li>
			<li>Please make the spans have a thin black border, a little padding, and blue</li>
			<li>Please make the section 25% width, 200px tall, centered, and with a thin purple border</li>
		</ol>

	</body>
</html>

```

Now follow the instructions in the css
```css
/* Please make the h1 30px, 
with a little padding on the left, and thin red border */
h1 {
  font-size: 30px;
  padding-left: 10px;
  border: 2px solid red;
}
```
instead of using `padding-left` you could also use the shorthand version of `padding`
```css
h1 {
  padding: 0 0 0 10px; /*padding: top right bottom left;*/
}
```

We can use another shorthand for padding in this one
```css
/* Please make the h2 25px, 
with padding on top/bottom, a thick gold border, 
and margin on the top/bottom */
h2 {
  padding: 20px 0; /*padding: top/bottom left/right;*/
  border: 10px solid gold;
  margin-top: 20px;
  margin-bottom: 20px;
}
```

Ths one is straightforward
```css
/* Please make the spans have a thin black border, 
a little padding, and blue */
span {
  border: 2px solid black;
  padding: 5px;
  color: blue;
}
```

This one has centering which can be tough
```css
/* Please make the section 25% width, 
200px tall, centered, and with a thin purple border */
section {
  width: 25%;
  height: 200px;
  margin: 0 auto; /*0 top/bottom margin auto left and right*/
  border: 2px solid purple;
}
```

## Let's Look
Starter Template
Leon provided a template that we can use for our projects

The html sets the language to english:
```html
<html lang="en">
```

This lets the doc know what kind of characters we will use 
utf-8 has all characters
```html
<meta charset="utf-8">
```

This is used to set a description and keywords so that google can tell what your website is about
This isn't used as much anymore
```html
    	<meta name="description" content="Your description goes here">
    	<meta name="keywords" content="one, two, three">
```

This is what shows up in the browser tab
```html
<title>Blank Template</title>
```

Then `normalize.css` is linked for us already which sets more standard css styles
There is also another style.css that we can use for our regular css
```html
<!-- external CSS link -->
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/style.css">
```

We will add viewport later but not yet


The 'normalise.css' is the important lesson to take away tonight
This template has both 'normalise.css' and a 'reset.css'

What 'reset.css' will do is scorch the earth and get rid of every single default style that comes in the browser
This will cause `<h1>`'s to look like `<span>`'s and everything as similar as possible

Alternatively there is 'normalise.css' which will keep some basic default styling but keep it consistent between browsers

There is also the box model hack as well as clear fix included so we can add those classes as needed

Keep track of this (maybe keep a copy of it in your notes root) as we will update it over time


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
## Media Queries 
Media queries are what we use to make our site responsive
```css
@media screen and (max-width: 600px) {
    h1 {
        color: blue;
    }
}
```

This gives us the ability to display certain rules at certain screen sizes
The above rule would only exist between 0px and 600px wide screens
If the screen was larger the rule wouldn't apply until you resized the browser window to fit within that margin

___
<center>Class ended here</center>

## Let's Code
A Media Query
## Homework
Make 15 minutes of pain responsive

Read: https://learn.shayhowe.com/advanced-html-css/
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

