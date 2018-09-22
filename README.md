# Zivame.com

## To Initiate the project follow following steps -:
  i) Create Project on Firebase get the google-info-plist file , add it into the project.
  ii) Enable Anonymous SignIn in firebase and change rules of realtime firebaseDatabase to read:true.
  iii) Add following jsonData in realtime database -:
  
	 {
    "details": 
    {
        "basicDetailsTab": 
        {
            "count": 1,
            "values": 
            [                
                {
                    "text": "It\\'92s the bra that has just what your curves need. Carry yourself with ease and comfort all day long with a piece that will feel like second skin. Timeless in design and contemporary in style, this classic bra is likely to become an instant favourite for everyday wear.\\\\n\\\\nSometimes all a full-figured woman wants is a good quality foundation bra that is comfortable and gives reliable support. The double layered, seamed cups of this bra provide wirefree comfort and full coverage even as the wide side wings prevent spillage. Plus! The wider elastics give added support and comfort."
                }
            ]
        },
        "fabricAndCareTab": 
        {
            "count": 1,
            "values": 
            [                
                {
                    "list": 
                    [
                        "Fabric: Cotton Spandex",
                        "Do Not Dry Clean",
                        "Do Not Bleach",
                        "Wash Dark Colours Separately",
                        "Do Not Iron",
                        "Hand Wash Allowed",
                        "Do Not Tumble Dry"
                    ]
                }
            ]
        },
        "reviewsTab": 
        {
            "count": 1,
            "values": 
            [                
                {
                    "rating": 4,
                    "reviews": 
                    [                        
                        {
                            "customerName": "Akshita",
                            "description": "Good quality cotton; nice fit, even for people to use for the dfslaldkdjalkdjaslkdjaskdjaslkdjaslkdjaslkdjsaldksajdlkasjdlksajdlaskdj",
                            "likes": 1,
                            "rating": 5,
                            "reviewId": 53487,
                            "timeLine": "2 years ago"
                        },                        
                        {
                            "customerName": "Anonymous",
                            "description": "Very comfortable especially for bigger sizes",
                            "likes": 1,
                            "rating": 5,
                            "reviewId": 59766,
                            "timeLine": "1 year ago"
                        }
                    ],
                    "totalReviewCount": 109
                }
            ]
        }
    }
	}
	
a) if values array is changed the number of bar items increases whereas -:
each value array has an array to increase number of elements in a tab.
b) There Are 3 kinds of CustomTabs which are been included on the based of objects count received.


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
  
  
  
