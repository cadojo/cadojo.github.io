@def title = "Announcing Free Control Theory Notes"
@def rss = "An introduction to control theory."
@def rss_title = "Announcing public control thoery notes"
@def tags = ["controls", "nasa", "dynamics", "plane", "air"]

@def ispost=true
@def bio="The introduction to a publicly available control theory note-set!"
@def published="true"
@def publishdate="June 28th, 2021"

# {{title}}

Courses related to control thoery are known within engineering programs 
to be notoriously difficult. Lots of analysis can be nuanced, and responsible
engineering requires a strong understanding of the foundations of control
design and analysis. It helps to have a refresher every now and then!

That's why I'm writing this post -- I'd like to announce publicly available 
[notes](https://jcarpinelli.dev/ControlTheoryNotes.jl/stable) that 
I'm writing with the help of the Julia Programming Language, and _Documenter.jl_.
I'll be walking through foundational concepts, and providing control design and 
analysis examples with one concrete system: an approximate 
[polynomial model](https://github.com/cadojo/PolynomialGTM.jl) for a NASA-developed
sub-scale model aircraft.

I'll have fun, and cement my understanding as I write out explanations for each topic. 
Hopefully, these notes will serve as a helpful introduction, or refresher, 
for other engineering students and professionals!
