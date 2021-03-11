# FO4-ba2-utility

A batch script to help create a ba2 archive for Fallout 4 (or two if there are textures) from loose files.

Requires the *Fallout 4 Creation Kit*.

## Use

 This is a .cmd to automatize the packing of a mod made of loose files. Paste *create_ba2.cmd* in the folder of the mod you want to pack and double-click the batch file. The folder should contain at least a plugin file (.esp, .esm or .esl) and one or more folders containing files (*interface*, *materials*, *meshes*, *scripts*, *sound*, *strings*, *textures*).

**You should check beforehand the files and the folder structure of your mod as (almost) nothing will be checked by the batch file**.

## Install

* Download and install the launcher from [Bethesda.net](https://bethesda.net/en/game/bethesda-launcher).

* Open the launcher and download **Creation Kit Fallout 4**.

* Extract this utility wherever you see fit.

* Open _create_ba2.cmd_with a text editor and check line 10 if it corresponds to the path to your **Archive2.exe** tool from Creation Kit. The path is usually  something like: *C:\\Program Files (x86)\\Steam\\steamapps\\common\\Fallout 4\\Tools\\Archive2\\* (with trailing backslash and without quotes).

## Uninstall

Simply delete:

 create_ba2.cmd
 LICENSE
 README.md
