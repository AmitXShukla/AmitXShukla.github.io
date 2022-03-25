# WebScrapping, Web automation using Julia Langauge

## AI Bot - automating document download using Chrome, Selenium webdriver

**Objective** This AI bot, take print screens, download documents from web browser.
AI Script, uses **headless chrome webdriver** for proxy browsing.

Further, GUMBO and Cascadia packages are used to crawl and read web contents.

- Related Article: how to parse XML/JSON files and convert into ORM
- Related Article: how to Read Scanned Images and parse PDF files

---

+ First step is to [download chrome webdriver](https://chromedriver.chromium.org/downloads). Please make sure, webdriver version matches with your chrome version (Open Chrome -> Help -> About chrome -> check version).
+ make sure to download appropriate version depending on machine OS and unzip/extract to a local folder.
+ Open a terminal window, browse to directory where webdriver is downloaded and start webdriver as ./webdriver --url-base=/wd/hub

following message should appear on your terminal window.
./chromedriver --url-base=/wd/hub
Starting ChromeDriver 99.0.4844.51 (d537ec02474b5afe23684e7963d538896c63ac77-refs/branch-heads/4844@{#875}) on port 9515
Only local connections are allowed.
Please see https://chromedriver.chromium.org/security-considerations for suggestions on keeping ChromeDriver safe.
ChromeDriver was started successfully.


```julia
import Pkg
Pkg.add("WebDriver")
```

    [32m[1m    Updating[22m[39m registry at `~/.julia/registries/General`
    [32m[1m    Updating[22m[39m git-repo `https://github.com/JuliaRegistries/General.git`
    [32m[1m   Resolving[22m[39m package versions...
    [32m[1m  No Changes[22m[39m to `~/.julia/environments/v1.7/Project.toml`
    [32m[1m  No Changes[22m[39m to `~/.julia/environments/v1.7/Manifest.toml`



```julia
using WebDriver
capabilities = Capabilities("chrome")
ENV["WEBDRIVER_HOST"] = "127.0.0.1"
ENV["WEBDRIVER_PORT"] = "9515"
```




    "9515"




```julia
wd = RemoteWebDriver(capabilities, host=ENV["WEBDRIVER_HOST"], port=parse(Int, ENV["WEBDRIVER_PORT"]))
```




    Remote WebDriver





```julia
session = Session(wd)
```




    Session





```julia
sessions(wd)
```




    1-element Vector{String}:
     "f00406b9c4696534906c90d93e9bf492"




```julia
current_url(session)
```




    "data:,"




```julia
navigate!(session, "https://clinicaltrials.gov")
```

once, website is open, in your chrome browser window, right click on Input or Button you want to search or click on.
make sure, element is selected then click on copy -> copy xpath

this is the xpath you want to pass in your Element method.

    //*[@id="home-search-other-query"]


```julia
element = Element(session, "xpath", """//*[@id="home-search-other-query"]""")
element_keys!(element, "Cardiac Arrest")
```


```julia
downloadbtn = Element(session, "xpath", """//*[@id="save-list-link"]""")
click!(downloadbtn)
```


```julia
savebtn = Element(session, "xpath", """//*[@id="submit-download-list"]""")
click!(savebtn)
```

## Taking screen-shot and saving as png file


```julia
using Base64
ss = write(joinpath(@__DIR__, "my_screenshot.png"), base64decode(screenshot(session)))
```




    108173



## Webscrapping


Gumbo.jl is a Julia wrapper around Google's gumbo library for parsing HTML 

and Cascadia.jl package is used for automatic extraction of information from html pages.


```julia
Pkg.add("HTTP")
Pkg.add("Gumbo")
Pkg.add("Cascadia")
```

    [32m[1m   Resolving[22m[39m package versions...
    [32m[1m  No Changes[22m[39m to `~/.julia/environments/v1.7/Project.toml`
    [32m[1m  No Changes[22m[39m to `~/.julia/environments/v1.7/Manifest.toml`
    [32m[1m   Resolving[22m[39m package versions...
    [32m[1m  No Changes[22m[39m to `~/.julia/environments/v1.7/Project.toml`
    [32m[1m  No Changes[22m[39m to `~/.julia/environments/v1.7/Manifest.toml`
    [32m[1m   Resolving[22m[39m package versions...
    [32m[1m   Installed[22m[39m Cascadia ─ v1.0.1
    [32m[1m    Updating[22m[39m `~/.julia/environments/v1.7/Project.toml`
     [90m [54eefc05] [39m[92m+ Cascadia v1.0.1[39m
    [32m[1m    Updating[22m[39m `~/.julia/environments/v1.7/Manifest.toml`
     [90m [54eefc05] [39m[92m+ Cascadia v1.0.1[39m
    [32m[1mPrecompiling[22m[39m project...
    [32m  ✓ [39mCascadia
      1 dependency successfully precompiled in 0 seconds (76 already precompiled)


## Download data from web page


```julia
# download contact details from my GitHub page
navigate!(session, "https://github.com/AmitXShukla")
html = parsehtml(source(session))
eachmatch(Selector("#js-pjax-container"), html.root)
```




    1-element Vector{HTMLNode}:
     HTMLElement{:main}:<main data-pjax-container="" id="js-pjax-container">
      <div class="mt-4 position-sticky top-0 d-none d-md-block color-bg-default width-full border-bottom
        color-border-muted" style="z-index:3;">
        <div class="container-xl px-3 px-md-4 px-lg-5">
          <div class="Layout Layout--flowRow-until-md Layout--sidebarPosition-start Layout--sidebarPosition-flowRow-start" data-view-component="true">
            <div class="Layout-sidebar" data-view-component="true">
              <div class="user-profile-sticky-bar">
                <div class="user-profile-mini-vcard d-table">
                  <span class="user-profile-mini-avatar d-table-cell v-align-middle lh-condensed-ultra pr-2">
                    <img alt="@AmitXShukla" class="rounded-2 avatar-user" height="32" src="https://avatars.githubusercontent.com/u/20031132?s=64&amp;v=4" width="32"/>
                  </span>
                  <span class="d-table-cell v-align-middle lh-condensed">
                    <strong>
                      AmitXShukla
                    </strong>
                    <span class="user-following-container">
                      <span class="follow d-block">
                        <a class="btn btn-sm mini-follow-button" data-hydro-click="{&quot;event_type&quot;:&quot;authentication.click&quot;,&quot;payload&quot;:{&quot;location_in_page&quot;:&quot;follow button&quot;,&quot;repository_id&quot;:null,&quot;auth_type&quot;:&quot;LOG_IN&quot;,&quot;originating_url&quot;:&quot;https://github.com/AmitXShukla&quot;,&quot;user_id&quot;:null}}" data-hydro-click-hmac="8d03b63dbcad7c036d67a75a4e189d2cc66bf77bf9a603c39e4f02ffe8649a92" href="/login?return_to=https%3A%2F%2Fgithub.com%2FAmitXShukla">
                          Follow
                        </a>
    ...





```julia
using Cascadia, Gumbo, HTTP

r = HTTP.get("http://stackoverflow.com/questions/tagged/julia-lang")
h = parsehtml(String(r.body))

qs = eachmatch(Selector(".question-summary"),h.root)

println("StackOverflow Julia Questions (votes  answered?  url)")

for q in qs
    votes = nodeText(eachmatch(Selector(".votes .vote-count-post "), q)[1])
    answered = length(eachmatch(Selector(".status.answered"), q)) > 0 || length(eachmatch(Selector(".status.answered-accepted"), q)) > 0
    href = eachmatch(Selector(".question-hyperlink"), q)[1].attributes["href"]
    votes, answered, "http://stackoverflow.com",href
end
```

    StackOverflow Julia Questions (votes  answered?  url)

