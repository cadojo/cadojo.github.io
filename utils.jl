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
Finds if post is published.
"""
function ispublished(path)
    return postelement(path, "published") == "true"
end


"""
Finds the title of a post.
"""
function posttitle(path)
    isfile(path) || throw(ArgumentError("File $path does not exist!"))
    lines = open(path, "r") do file
        readlines(file)
    end
    for line ∈ lines
        if occursin("@def title", line)
            return split(line, "\"")[2] |> string
        end
    end
    return
end

"""
Finds the bio of a post.
"""
function postbio(path)
    isfile(path) || throw(ArgumentError("File $path does not exist!"))
    lines = open(path, "r") do file
        readlines(file)
    end
    for line ∈ lines
        if occursin("@def bio", line)
            return split(line, "\"")[2] |> string
        end
    end
    return
end

"""
Finds the picture associated with the post.
"""
function postpicture(path)
    isfile(path) || throw(ArgumentError("File $path does not exist!"))
    lines = open(path, "r") do file
        readlines(file)
    end
    for line ∈ lines
        if occursin("@def picture", line)
            return split(line, "\"")[2] |> string
        end
    end
    return
end

"""
Finds an element associated with a post.
"""
function postelement(path, element)
isfile(path) || throw(ArgumentError("File $path does not exist!"))
lines = open(path, "r") do file
    readlines(file)
end
for line ∈ lines
    if occursin("@def $element", line)
        return split(line, "\"")[2] |> string
    end
end
return
end


"""
Returns post card. 
"""
function postcard(path)

    title = posttitle(path)
    bio = postbio(path)
    picture, alt = postelement.(path, ("picture", "picturealt"))
    date = postelement(path, "publishdate")

    return """
    <div class="blogpost">
        <p class="post-bio"> <b class="post-title"><a href=../$(replace(replace(path, " "=>"%20"), ".md"=>""))>$title</a></b> <br> <i class="post-stamp">Posted on $date </i> <br> $bio </p>
    </div>
    """
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
    ismd(f)          =  endswith(f, ".md")
    onlymd(l)        =  filter(ismd, l)
    onlydir(l)       =  filter(isdir, l)
    onlyname(s)      =  last(splitpath(s))
    getdate(f)       =  Dates.unix2datetime(stat(f).mtime)
    sortbydate(l)    =  sort(l; by=getdate)
    onlypublished(l) = filter(ispublished, l)

    # Get subdirs
    subdirs = readdir("writing"; join=true) |> onlydir .|> onlyname |> sort

    # Get filepaths to all Markdown files
    paths = Dict{String, Vector{String}}(subdirs .=> [Vector{String}() for i ∈ 1:length(subdirs)])
    for subdir ∈ subdirs
        append!(paths[subdir], readdir(joinpath("writing", subdir); join=true) |> onlymd |> onlypublished |> sortbydate)
    end

    # Initialize return string
    lx = ""

    # Sort subdirs
    for subdir ∈ subdirs
        if !isempty(paths[subdir])
            lx *= string("## ", subdir, "\n",)
        end

        for path ∈ filter(ispublished, paths[subdir])
            lx *= string(
                "\n~~~\n", postcard(path), "\n~~~\n"
            )
        end
    end
    
    return lx

end