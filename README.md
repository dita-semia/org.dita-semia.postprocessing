# DITA-SEMIA Postprocessing
This DITA-OT plugin can perform some post-processing on the pulished content: set pdf filename depending on content (e.g. metadata) and zipping the result.


## Maintainance/Compatibility:
I'm using for our commercial publications. Thus, it is continiously maintained when . However, I'm not using github as main versioning system and will only occasionally this repository since I'm not aware of anybody else actually using it. So if you're interested in more frequent updates just let me know.

Also note that I'm not doing any testing with different DITA-OT version. Currently I'm using DITA-OT 2.4 so this is the only version I'm sure it is compatible with. But I expect little to no modification sbeing required to make it work at least with newer versions.


## Features:
- Dynamically define the name of the PDF output file depending on the content
- Zip the resulting PDF filename
- Zip the resulting output folder (for HTML-based outputs)


## Parameters (ant properties):
- **dita-semia.pdf.outputfile.xsl**

  Absolute path to the xsl script returning the PDF filename as text. The input to the script is the merged dita map file. Make sure to set the output mode to text.
  If this parameter is not set or the returned string is empty the PDF filename will not be changed. 

- **dita-semia.postprocessing.zip**

  Needs to be set to "true" to activate the zipping of the result.
  
  For **PDF** output the name of the zip file is the PDF filename plus an attached ".zip" (e.g. "my-file.PDF.zip").
  
  For **HTML**-based output the name of the zip file is the output folder name plus an attached ".zip" (e.g. "my-output.zip").   
  

## Installation

For **PDF** output simply integrate the plugin.
	
For **HTML**-based output DITA-OT does not define a general extension point. Thus, in your custom html project you need to add a dependency to "dita-semia.html.postprocessing" at the end. 
