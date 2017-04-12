# DITA-SEMIA Postprocessing
This DITA-OT plugin can convert images used by DITA maps for HTML output as a preprocess step.


## Features:
- Dynamically define the name of the PDF output file depending on the content
- Zip the resulting PDF filename
- Zip the resulting output folder (for HTML-based outputs)


## Parameters (ant properties):
- **dita-semia.pdf.outputfile.xsl**

  Absolute path to the xsl script returning the PDF filename as text. The input to the script is the merged dita map file. Make sure to the output mode to text.
  If this parameter is not set or the returned string is empty the PDF filename will no be changed. 

- **dita-semia.postprocessing.zip**

  Needs to be set to "true" to activate the zipping of the result.
  
  For **PDF** output the name of the zip file is the PDF filename plus an attached ".zip" (e.g. "my-file.PDF.zip").
  
  For **HTML**-based output the name of the zip file is the output folder name plus an attached ".zip" (e.g. "my-output.zip").   
  

## Installation

For **PDF** output simply integrate the plugin.
	
For **HTML**-based output DITA-OT does not define a general extension point. Thus, in your custom html project you need to add a dependency to "dita-semia.html.postprocessing" at the end. 