<h2>https://amitxshukla.github.io</h2>

<a href="https://www.youtube.com/watch?v=Tua9Cbw_YgU&list=PLp0TENYyY8lF1I4EgKLcwRvxy820BgWpd" target="_blank">[Click here for Video Tutorials !]</a>

<h4> Objective: Angular Material - Static Website</h4>
In this tutorial, we will be using Angular Material to build a static website.
And in follow up tutorials, further We will enhance this webstie and implement Angular Universal and SEO for server side rendering and Search engine and social search capabilities.

I assume you already have a successful Angular Development environment already setup and 
if not, please visit 

<a href="https://github.com/AmitXShukla/Angular-Capacitor-Firebase-Setup" target="_blank">https://github.com/AmitXShukla/Angular-Capacitor-Firebase-Setup</a>

First let’s install Angular Material into our App.

<h4>Step 1: Start with a brand new Angular App.</h4>
Let's quickly confirm angular setup/installation

<span style="color:green">VSCODE > Terminal > node -v</span>  // show current node version installed

<span style="color:green">npm -v</span> // show current npm version

<span style="color:green">ng -v</span> // show current Angular-Cli version

<span style="color:green">ng new amitxshukla.github.io</span> // create a new ng app

<span style="color:green"> cd amitxshukla.github.io</span>

<span style="color:green"> ng serve</span>

<h4> Clean up tasks:</h4>
<b>update favicon</b> - 
update index.html to pick favicon from assets/icon directory and add copy new favicon.ico file to assets/icon folder

<h4>update polyfill.json</h4> - In case of using web animations or if you are planning to support older browser versions.

and in case of adding a polyfill, please make sure to npm install related package for chosen polyfill.

<h4>update gitignore file</h4>
- Please include files/folder which you do not wish to include to Git Repository like <dist> or <node_modules> folder
OR environment.ts, environment.prod.ts etc

<h4>update Angular-cli.json settings </h4>
"prefix": "app" 
get rid of "app" prefix, otherwise, this setting will prefix, all selector with this string, like FooterComponent will have selector = app-footer

<h4> Step 2: Install Angular Materials</h4>
<span style="color:green">npm install --save @angular/material @angular/cdk</span>
<span style="color:green">npm install --save @angular/animations</span>

Note: @angular/animations uses the WebAnimation API that isn't supported by all browsers yet. If you want to support Material component animations in these browsers, you'll have to include a polyfill.

<h4> Step 3: Include Angular Material Module</h4>
You have the option to either include individual Angular Material components or
Create a new custom material module and import this module
Whichever approach you use, be sure to import the Angular Material modules after Angular's BrowserModule, as the import order matters for NgModules.

create a new custom material module and include this is app.module

(These step is included below in development tasks)

<h4> Step 4. Include a theme</h4>
add this to styles.css or copy this over to assets/css directory

<span style="color:green">@import "~@angular/material/prebuilt-themes/indigo-pink.css";</span>

<h4>Step 5. Gesture support</h4>
Some components (mat-slide-toggle, mat-slider, matTooltip) rely on HammerJS for gestures

<span style="color:green">npm install --save hammerjs</span>

<h4>Step 6 (Optional): Add Material Icons</h4>
If you want to use the mat-icon component with the official Material Design Icons, load the icon font in your index.html.

<span style="color:green">link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"</span>

For more information on using Material Icons, check out the Material Icons Guide.
Note that mat-icon supports any font or svg icons; using Material Icons is one of many options.
_________________________

<h4>Development Tasks</h4>
create routes.ts

<span style="color:green">ng g interface shared/routes</span>

<h4> replace routes.ts text with </h4>
https://github.com/AmitXShukla/Angular-Material/blob/master/src/app/shared/routes.ts

<h4> include APP_ROUTES</h4> from shared/routes.ts to app.module.ts  
<span style="color:green">(add to IMPORT section)</span>

<h4>create custom material module</h4>
<span style="color:green">ng g module shared/custom.material</span>

<h4>copy below content to custom.material.ts file</h4>

https://github.com/AmitXShukla/Angular-Material/blob/master/src/app/shared/custommaterial/custommaterial.module.ts

<h4>update app.module.ts</h4> to include ElishCustomMaterialModule in IMPORT section 
<span style="color:green">(add to IMPORT section)</span>

<h4>Now You have all Angular Material dependencies installed.</h4>

_________________________

<h4>Define Website Content and requirements</h4>
This website will need a top tool bar.

Left most icon at top tool bar will act as a home button which further toggle a left navigation.
(by default once leftnav is open, it stays open and can be closed by home icon at top left)

Left navigation Menu Items should include links to -
    Subscribe/ Contact
    About me    (Tab layout   About Me    Askus Terms)
    IT Services
    Projects
    Blogs
    Videos
    Terms

Top tool bar should also include a mat-icon and header/title text for the page being displayed in middle.
At right most side of tool bar, it should include mat-icons for email, settings and social icon for contact

<b><i> All mat-icons must have a tool tip displayed</i></b>

At the bottom of the page, a footer needs to be included.
This footer will have copyright statement and include all navigation links for SEO rendering.

_________________________

<h4>Development tasks</h4>
Now it's time to add header and footer components

create a new footer 

<span style="color:green">ng g component shared/footer</span>

update footer.html with this text
<span style="color:green">copyright 2018, amitxshukla.github.io</span>

<span style="color:green">import FOOTER Component to app.module.ts  (add to <declarations> section)</span>

update app.component.html file and include at last

<span style="color:green">< footer >< /footer ></span>

<span style="color:green"> ng serve</span>

at this point to make sure, app displays footer statement and is running fine.

<h4>add a new header</h4>

Open app.component.ts and

Include tool bar code

Include material icons

Include Left Navigation

Fix, person_add mat-icon to include links from social plugin

register a new custom svgicon

Fix Left-Hand navigation

Create one page and link to this page to router-outlet and routes.ts

<h4>Register a new custom svgicon</h4>

in case of error, include HttpClientModule


<span style="color:green">Convert all MAT-ICON for offline use</span>