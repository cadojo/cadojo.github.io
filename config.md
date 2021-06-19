<!--
Add here global page variables to use throughout your
website.
The website_* must be defined for the RSS to work
-->
@def website_title = "Personal Site"
@def website_descr = "Background, projects, and words."
@def website_url   = "https://cadojo.github.io"

@def author = "Joey Carpinelli"

@def mintoclevel = 2

<!-- @def prepath = "project" -->

<!--
Add here files or directories that should be ignored by Franklin, otherwise
these files might be copied and, if markdown, processed by Franklin which
you might not want. Indicate directories by ending the name with a `/`.
-->
@def ignore = ["node_modules/", "franklin", "franklin.pub", "writing/Controls/Controls01_Introduction.html"]

<!--
Add here global latex commands to use throughout your
pages. It can be math commands but does not need to be.
For instance:
* \newcommand{\phrase}{This is a long phrase to copy.}
-->
\newcommand{\html}[1]{~~~#1~~~}

\newcommand{\makeprofile}[3]{
    @@profile
    \profilepic{!#1}{!#2}
    \profilebio{!#3}
    @@
}