#
# Utility functions for use with Franklin.jl
#

"""
Parses hardcoded subdirectories for blog posts, 
and then generates headers and cards for each
post.

__References:__  
[1] https://franklinjl.org/syntax/utils/index.html
"""
function hfun_parseposts()

    # Hardcode
    ismd(f)    =  endswith(f, ".md")
    onlymd(l)  =  filter(ismd, l)
    onlydir(l) =  filter(isdir, l)
    
    # Get subdirs
    subdirs = readdir("writing"; join=true) |> onlydir

    # Get filepaths to all Markdown files
    paths = Vector{String}()
    for subdir ∈ subdirs
        append!(paths, readdir(subdir; join=true) |> onlymd)
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