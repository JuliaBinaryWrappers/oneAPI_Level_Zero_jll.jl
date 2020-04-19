# Autogenerated wrapper script for oneAPI_Level_Zero_jll for x86_64-linux-gnu-cxx03
export libze_loader, libze_validation_layer

using NEO_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libze_loader`
const libze_loader_splitpath = ["lib", "libze_loader.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libze_loader_path = ""

# libze_loader-specific global declaration
# This will be filled out by __init__()
libze_loader_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libze_loader = "libze_loader.so.0.91"


# Relative path to `libze_validation_layer`
const libze_validation_layer_splitpath = ["lib", "libze_validation_layer.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libze_validation_layer_path = ""

# libze_validation_layer-specific global declaration
# This will be filled out by __init__()
libze_validation_layer_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libze_validation_layer = "libze_validation_layer.so.0.91"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"oneAPI_Level_Zero")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (NEO_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (NEO_jll.LIBPATH_list,))

    global libze_loader_path = normpath(joinpath(artifact_dir, libze_loader_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libze_loader_handle = dlopen(libze_loader_path)
    push!(LIBPATH_list, dirname(libze_loader_path))

    global libze_validation_layer_path = normpath(joinpath(artifact_dir, libze_validation_layer_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libze_validation_layer_handle = dlopen(libze_validation_layer_path)
    push!(LIBPATH_list, dirname(libze_validation_layer_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

