name = "3dfm"

version = "1.6.13"

authors = [
    "DNA Research"
]

description = \
    """
    Maya plugin for the 3Delight renderer.
    """

requires = [
    "3delight_core-{version}".format(version=str(version)),
    "cmake-3+",
    "maya-2016+<2020"
]

variants = [
    ["platform-linux"]
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

uuid = "3dfm-{version}".format(version=str(version))

def commands():
    env.MAYA_MODULE_PATH.append("{root}/maya/modules")
    env.MAYA_RENDER_DESC_PATH.append("{root}/maya/render_desc")
