# Zivame.com

## Project Structure

  ### ViewModels
      Containing ViewController's responsibilities and delegate to update the result to the views
      
  ### Views
    Containing Generic Custom Re-Usable Views. 
  
  ### MainFiles
    Containing project related app settings Files like pList files, storyboard files, coredata files,googleplist file etc 
    
  ### NetworkLayer
    Firebase callback or hardcoded json string to decode model out of json dictionary data.
    NetworkLayer containing firebase function to get the one time data .
  
  ### Controllers
    Containing Main Container for patching diff layers like binding view to viewModels properties , networkLayer , 
    viewModel,model implementation to populate private datasource in the viewModel to fill view data.
  
  ### HelperFiles
   Containing App Specific Constants. Including Hardcoded Strings + Constant App Colors + Constant Font Colors
   etc.
  
  
  
