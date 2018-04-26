#### https://amitxshukla.github.io

[Click here for Video Tutorials !](https://www.youtube.com/watch?v=Tua9Cbw_YgU&list=PLp0TENYyY8lF1I4EgKLcwRvxy820BgWpd)

#### Angular Material - Static Website
In this tutorial, we will be using Angular Material to build a static website.
And in follow up tutorials, further We will enhance this webstie and implement Angular Universal and SEO for server side rendering and Search engine and social search capabilities.

I assume you already have a successful Angular Development environment already setup and 
if not, please visit https://github.com/AmitXShukla/Angular-Capacitor-Firebase-Setup

First let’s install Angular Material into our App.

#### Step 1: Start with a brand new Angular App.
Let's quickly confirm angular setup/installation
##### VSCODE > Terminal > node -v  // show current node version installed
##### npm -v // show current npm version
##### ng -v // show current Angular-Cli version
##### ng new amitxshukla.github.io // create a new ng app
##### cd amitxshukla.github.io
##### ng serve

#### Clean up tasks:
##### update favicon
(update index.html to pick favicon from assets/icon directory and add new favicon.ico file to assets/icon folder)
##### update polyfill.json 
in case of using web animations or if you are planning to support older browser versions,
and in case of adding a polyfill, please make sure to npm install related package for chosen polyfill
##### update gitignore file
##### update Angular-cli.json settings 
"prefix": "app" get rid of "app" prefix, otherwise, this setting will prefix, all selector with this string, like FooterComponent will have selector = app-footer

#### Step 2: Install Angular Materials
##### npm install --save @angular/material @angular/cdk
##### npm install --save @angular/animations
Note: @angular/animations uses the WebAnimation API that isn't supported by all browsers yet. If you want to support Material component animations in these browsers, you'll have to include a polyfill.

#### Step 3: Include Angular Material Module
You have the option to either include individual Angular Material components or
Create a new custom material module and import this module
Whichever approach you use, be sure to import the Angular Material modules after Angular's BrowserModule, as the import order matters for NgModules.

##### create a new custom material module and include this is app.module
(These step is included below in development tasks)

#### Step 4. Include a theme
##### add this to styles.css or copy this over to assets/css directory
##### @import "~@angular/material/prebuilt-themes/indigo-pink.css";

#### Step 5. Gesture support
Some components (mat-slide-toggle, mat-slider, matTooltip) rely on HammerJS for gestures

##### npm install --save hammerjs

#### Step 6 (Optional): Add Material Icons
If you want to use the mat-icon component with the official Material Design Icons, load the icon font in your index.html.
##### <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
For more information on using Material Icons, check out the Material Icons Guide.
Note that mat-icon supports any font or svg icons; using Material Icons is one of many options.

#### Development Start
##### create routes.ts  ng g interface shared/routes
##### replace routes.ts text with 
import { Router, RouterModule } from '@angular/router';
export const APP_ROUTES = RouterModule.forRoot([
    //{ path: '', redirectTo: '/aboutus', pathMatch: 'full' },
    //{ path: '**', redirectTo: '/aboutus', pathMatch: 'full' }
]);
We will update route.ts later as we add new components/pages, for now, let’s keep these line commented.

##### include APP_ROUTES from shared/routes.ts to app.module.ts  (add to IMPORT section)

##### create custom material module    ng g module shared/custom.material
##### copy below content to custom.material.ts file

Include link to ElishCustomerMaterialModule.ts

#####  update app.module.ts to include ElishCustomMaterialModule in IMPORT section (add to <IMPORT> section)

##### Now You have all Angular Material dependencies installed.

#### - Define Website Content and requirements
This website will need a top tool bar.
Left most icon at top tool bar will act as a home button which further toggle a left navigation.
(by default leftnav is kept open and can be closed by more-vert)
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
##### All mat-icons must have a tool tip displayed

2. At the bottom of the page, a footer needs to be included.
This footer will have copyright statement and include all navigation links for SEO rendering.

#### Development tasks
Now it's time to add header and footer components
create a new footer 
##### ng g component shared/footer
update footer.html with this text
##### copyright 2018, amitxshukla.github.io
##### import FOOTER Component to app.module.ts  (add to <declarations> section)
update app.component.html file and include at last
##### <footer></footer>

#####  ng serve
at this point to make sure, app displays footer statement and is running fine.

#### add a new header
Open app.component.ts and
Include tool bar code
Include material icons
Include Left Navigation

Fix, person_add mat-icon to include links from social plugin
register a new custome svgicon

Fix Left-Hand navigation
Create one page and link to this page to router-outlet and routes.ts

## Register a new custom svgicon
in case of error, include HttpClientModule

## Convert all MAT-ICON for offline use
