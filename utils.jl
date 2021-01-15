#
# Utility functions for use with Franklin.jl
#
import Dates

"""
Returns string of Julia code representing
the date at which a page was last modified.
"""
function lx_lastmodified(com, _)
    # Argument should be filepath
    content = Franklin.content(com.braces[1])
    isfile(content) || throw(ArgumentError("Invalid filepath provided to \\lastmodified"))
    y,m,d = map(x->x(t), (Dates.year, Dates.month, Dates.day))
    return "Date($(y), $(m), $(d))"
end

"""
Returns post card. 
"""
function postcard(path, picture, alt, bio)

    title = last(splitpath(path))
    mdate = Dates.unix2datetime(stat(path).mtime)

    html = """
    <div class="postcard">
        <img class="post-pic" src="$picture" alt="$alt">
        <p class="post-bio"> <b class="post-title">$title</b> <br> <i class="post-stamp">Posted on $(Dates.monthname(mdate)) $(Dates.day(mdate)), $(Dates.year(mdate)) </i> <br><br> $bio </p>
    </div>
    """

    return html

end

"""
Parses hardcoded subdirectories for blog posts, 
and then generates headers and cards for each
post.

__References:__  
[1] https://franklinjl.org/syntax/utils/index.html
"""
function lx_allposts(com, _)

    content = Franklin.content(com.braces[1])

    # Hardcoded helper functions
    ismd(f)       =  endswith(f, ".md")
    onlymd(l)     =  filter(ismd, l)
    onlydir(l)    =  filter(isdir, l)
    onlyname(s)   =  last(splitpath(s))
    getdate(f)    =  Dates.unix2datetime(stat(f).mtime)
    sortbydate(l) =  sort(l; by=getdate)

    # Get subdirs
    subdirs = readdir("writing"; join=true) |> onlydir .|> onlyname |> sort

    # Get filepaths to all Markdown files
    paths = Dict{String, Vector{String}}(subdirs .=> [Vector{String}() for i ∈ 1:length(subdirs)])
    for subdir ∈ subdirs
        append!(paths[subdir], readdir(joinpath("writing", subdir); join=true) |> onlymd |> sortbydate)
    end

    # Initialize return string
    lx = ""

    # Sort subdirs
    for subdir ∈ subdirs
        lx *= string("## ", subdir, "\n",)

        for path ∈ paths[subdir]
            lx *= string(
                "\n~~~\n", postcard(path, "/assets/profile-light.png", "Temporary picture.", 
                    "The first poem I've ever written! Not yet published :)"), "\n~~~\n"
            )
        end
    end
    
    return lx

end