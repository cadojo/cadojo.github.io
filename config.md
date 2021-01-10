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
@def ignore = ["node_modules/", "franklin", "franklin.pub"]

<!--
Add here global latex commands to use throughout your
pages. It can be math commands but does not need to be.
For instance:
* \newcommand{\phrase}{This is a long phrase to copy.}
-->
\newcommand{\html}[1]{~~~#1~~~}
\newcommand{\socials}[0]{\html{
    <div class="allsocials">
    <a href="mailto:jdcarpinelli@gmail.com" <i class="fas fa-envelope"></i></a>
    <a href="https://github.com/cadojo" <i class="fab fa-github"></i></a>
    <a href="https://instagram.com/joeycarpinelli" <i class="fab fa-instagram"></i></a>
    <a href="https://twitter.com/cadojo_" <i class="fab fa-twitter"></i></a>
    </div>
}}
\newcommand{\profilepic}[2]{\html{<img class="profile-pic" src="#1" alt="#2">}}
\newcommand{\profilebio}[1]{\html{
    <div class="profile-bio">
        !#1
        <br> <br>
        <a href="mailto:jdcarpinelli@gmail.com" target="_blank" <i class="fas fa-envelope"></i></a> &thinsp;
        <a href="https://github.com/cadojo" target="_blank" <i class="fab fa-github"></i></a> &thinsp;
        <a href="https://instagram.com/joeycarpinelli" target="_blank"  <i class="fab fa-instagram"></i></a> &thinsp;
        <a href="https://twitter.com/cadojo_" target="_blank" <i class="fab fa-twitter"></i></a>
    </div>}
}

\newcommand{\makeprofile}[3]{
    @@profile
    \profilepic{!#1}{!#2}
    \profilebio{!#3}
    @@
}