# CSS - The Basics
Slids: https://slides.com/leonnoel/100devs2-css-the-basics/
___
## Agenda
Questions?
Review - Client Server Model
Review - Progressive Enhancement
Learn - CSS Fundamentals
Learn - Parent / Child Selectors
Hint At - Classes and IDs
Learn - Specificity
Lab - Style A Simple Site

## Questions
About last class or life

## Checking In
Like and Retweet the Tweet
!checkin

## Submitting Work
BBC HTML in a Glitch.com
Submit URL here: https://forms.gle/inMYVvbEZt2fmzng9

## Please Use Search (Review)
Some questions have already been asked
Look for them before asking again to reduce spam and help mods

## Please Use Threads! (Review)
In Help Channels, Not Replies! 
All questions in help channels should have a thread to reply to to keep questions organized

## You Have The Power To Help (Review)
Jump in those threads please!
If you know the answers to questions help your fellow students

## Typing
This is a good website to practice typing if you aren't quite good yet
Try to aim for 60 wpm
https://www.keybr.com/

## !?! READING !?!
Why assign so much reading?
Because most of us will join a company that uses a language that they have never learned or a technology they have never used
It will be up to you to research and learn and it will usually be an old aweful document

## Deep Not Wide
Early on you are better off going deep and learning the material we have deeply instead of looking at all the bells and whistles (vscode extensions, github, terminal prettiness etc)

## FOR THE LOVE OF ALL THAT IS HOLY
FLATTEN YOUR FORGETTING CURVES

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

## CSS
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


## CSS SYNTAX
(Spelling And Grammer Rules) 
CSS has its own syntax just like html
```
Selector
|
p {           ---
  color: red     |- Declaration block
}   |     |   ---
Property value

```

## CSS BREAK DOWN
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

## Let's Learn
Some Simple Styles

## Color
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


## Font-family
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

## Font-weight
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
## 🛑 Stop 🛑
How to research?
 
🚨 Use the MDN 🚨
The MDN has just about everything you could need to know about html and css
https://lmgtfy.com/?q=italicize+text+css+mdn&s=d

Use https://learn.shayhowe.com/html-css/

## Let's Code
Some Basic CSS

In 'class04-materials' there is a folder called 'basic-css'
Inside, there is an 'index.html' file, a 'style.css' file (in 'css' folder) and a 'main.js' file (in js folder, don't worry about this for now)

Open the 'basic-css' folder within vscode and view the 'index.html' file
We can see that it links to the stylesheet in the head of index.html
```
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Blank Template</title>
		<!-- external CSS link -->
		<link rel="stylesheet" href="css/style.css">
	</head>
...
```

Right now if we open that file it is blank but we can edit it to apply css styles
If we look at the html we can see it has some instructions for us
The first is in the first heading of the body:
```
	</head>
	<body>

		<h1>Make this text blue, underlined, and have a gold background</h1>
    ...
```
So we will want to apply styles within 'styles.css' to accomplish this
We will need to write a rule which targets the `<h1>` with a selector
Then within the declaration block has a declaration to apply: 
- The `color` property with the value `blue`
- Underline the content (with `text decoration` property)
- Set the `background` property to a value of `gold`

It may be useful to keep the instructions we are using as a comment within css 
You can do this with `/* Comment here */`

```
/* Make this text blue, underlined, and have a gold background */
h1 {
  color: blue;
  text-decoration: underline;
  background-color: gold;
}
```

Now if we save and reload our page it should have the styles that we applied

Now for the `<h2>`, `<p>`, and `<h3>` that remain
First the `<h2>`
```
<h2>Make this text purple, bolded, 25px, and hav an orange border </h2>
```
We can again use the `color` property but then we will need to use the `font-weight` property to set a value of `bold`
`font-size` can set a `25px` size and we can use border shorthand to create a border
```
h2 {
  color: purple;
  font-weight: bold;
  font-size: 25px;
  border: solid 1px orange;
}
```

Now for the `<p>` tag
```
<section>
  <p>Make this section width of 50%, height of 200px, background of gray, border of black, and the paragraph text white</p>
</section>
```

This one specified the `<section>` should have most of the styles applied to it and the paragraph should only have the text set to white
Most of these are pretty straightforward properties that we have discussed already
```
section {
  width: 50%;
  height: 200px;
  background-color: gray;
  border: 5px solid black;
}

p {
  color: white;
}
```

Lastly we have the `<h3>`
```
<footer>
  <h3>Make this footer have a black background, with light green border, and this text 20px white plus a font-family of Roboto</h3>
</footer>
```
Tkhe only thing different here is applying the font family
To do this search for Roboto on google fonts (https://fonts.google.com/specimen/Roboto?query=roboto)
I only grabbed the 400 weight because that was all we need
Then grab the `<link>` provided by google fonts and paste it into the head of our html
Remember it must be before the css sheet so our style sheet is able to access those fonts
```
<head>
  <title>Blank Template</title>
  <!-- external CSS link -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="css/style.css">
</head>
```
Then we can apply these styles in our css
```
footer {
  background-color: black;
  border: solid 1px lightgreen;
}
h3 {
  font-size: 20px;
  color: white;
  font-family: roboto;
}
```

Make sure you save both the css AND html before refreshing your browser to see these changes

## Selecting By Relationship
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
Now within the 'class04-materials' folder find the 'relationship-css' folder
Open both 'index.html' and 'style.css'

Now lets practice targetting some of these tags within css using relationships
The first tag is the `<h1>` tag holding 'Hello'
```
<body>
		<h1>Hello</h1>
    ...
```
This one is easy since it is the only `<h1>` we don't have to define a relationship but we could with `<body>`
```
h1 {
  color: purple
}
```

What if we wanted all `<h2>` tags to be yellow?
```
h2 {
  color: yellow;
}
```

Ok now lets start using relationships to make only the `<h2>` tags that have 'world' and 'zebra' yellow?
Currently unicorn and duck are also yellow but we don't want them to be
We can be more specific when we apply our yellow rule
Since they are both direct children of a `<section>` tag and no other `<h2>` tags are we can specify the following
Only `<h2>` tags that are direct children of `<section>` have a `color` of `yellow`
```
section > h2 {
  color: yellow;
}
```
Doing this 'world' and 'zebra' remain yellow but the 'unicorn' and 'duck' headings return to black

Remember we can't use:
```
section h2 {
  color: yellow;
}
```
Even though it is similar then any `<h2>` tags that are nested within `<section>` tags (such as the unicorn text)
Since unicorn is not a direct child if we are more specific and use the '>' symbol to signify only DIRECT children get this styling

Now what if we wanted unicorn and duck to be red?
Both of these are `<h2>` tags inside of `<article>` tags so we can target them that way
We don't have to be specific and reference direct children but we can so we probably should
It depends on if you want to be exact or flexible
```
article > h2 {
  color: red;
}
```

What if we wanted to make just unicorn to be orange?
Well unicron is a direct child of an `<article>` which is a direct child of a `<section>` while duck is a direct child of an `<article>` which is a direct child of a `<body>` tag
We can target this `<section>`, `<article>`, `<h2>` chain by being specific which will exclude duck
```
section > article > h2 {
  color: orange;
}
```

Here we are giving a high specificity score to the unicorn element because of how specifically it was targetted
So no matter where we put this rule it will overwrite the `article > h2` rule that we wrote earlier

## IDs & Classes
These are identifiers that allow you to target elements and give the highest specificity score to elements that are targetted by it

## IDs
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

## Classes
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

## Specificity
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
Simple Site Lab
This lab is in the 'class04-materials' folder named 'simple-site-lab.png' along with a photo 'logo.png'
The assignment is to replicate the 'simple-site-lab.png' image using html and css

## Homework
Due Thursday - Jan. 27th
Read: http://learnlayout.com/
Do: Practice Typing - https://www.keybr.com/
Do: https://www.typingtest.com/ (Five Minute Test)
Do: Finish Simple Site Lab from class-04 (HTML & CSS)