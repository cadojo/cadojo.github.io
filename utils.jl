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
Parses hardcoded subdirectories for blog posts, 
and then generates headers and cards for each
post.

__References:__  
[1] https://franklinjl.org/syntax/utils/index.html
"""
function hfun_parseposts()

    # Hardcoded helper functions
    ismd(f)       =  endswith(f, ".md")
    onlymd(l)     =  filter(ismd, l)
    onlydir(l)    =  filter(isdir, l)
    onlyname(s)   =  last(splitpath(s))
    getdate(f)    =  Dates.unix2datetime(stat(f).mtime)
    sortbydate(l) =  sort(l; by=getdate)
    # Get subdirs
    subdirs = readdir("writing"; join=true) |> onlydir .|> onlyname

    # Get filepaths to all Markdown files
    paths = Dict{String, Vector{String}}(subdirs .=> [Vector{String}() for i ∈ 1:length(subdirs)])
    for subdir ∈ subdirs
        append!(paths[subdir], readdir(joinpath("writing", subdir); join=true) |> onlymd |> sortbydate)
    end

    #==
    list = readdir("blog")
    filter!(f -> endswith(f, ".md"), list)
    dates = [stat(joinpath("blog", f)).mtime for f in list]
    perm = sortperm(dates, rev=true)
    idxs = perm[1:min(3, length(perm))]
    io = IOBuffer()
    write(io, "<ul>")
    for (k, i) in enumerate(idxs)
        fi = "/blog/" * splitext(list[i])[1] * "/"
        write(io, """<li><a href="$fi">Post $k</a></li>\n""")
    end
    write(io, "</ul>")
    return String(take!(io))

    ==#
    paths

end