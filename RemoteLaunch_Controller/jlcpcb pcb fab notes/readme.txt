Export producution outputs to JLCPCB:

https://support.jlcpcb.com/article/149-how-to-generate-gerber-and-drill-files-in-kicad

Generate BOM:
https://support.jlcpcb.com/article/84-how-to-generate-the-bom-and-centroid-file-from-kicad
- Create xml file
- Download   https://gist.github.com/arturo182/a8c4a4b96907cfccf616a1edb59d0389
- Use online xslt converter https://freeformatter.com/xsl-transformer.html




Generating Pick and Place files
The CPL file has to be generated from the PCB editor, click on File -> Fabrication output -> Footprint position (.pos) file 

The folling changes are required:

Ref to Designator PosX to Mid X PosY to Mid Y Rot to Rotation Side to Layer

Before, as exported from KiCAD:


