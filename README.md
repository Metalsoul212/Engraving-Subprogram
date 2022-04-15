# Engraving-Subprogram
Engraving Canned Cycle and its supporting files.

Currently documentation is not 100% complete.

Why use it
This engraving program is incredibly versatile. It was designed to be easy to use for simple engravings, while at the same time allowing for extreme control on positioning. This system will allow you to easily program engravings that tightly follow contours, edges, and fit neatly between different part features. 
While a CAM system can directly program engravings, they lack one feature that this system does easily and very well; serial numbers, sequential letters, and the ability to have dynamically changing engravings. With a creative programmer this system has very few limits and dozens of customizable features and options to fine tune every aspect of how the text is engraved.
How it works
The programmer will use the main shape subprogram (Shape) into the program of the part to be engraved and create an accompanying small (Detail) subprogram that details what the engraved text will be. The Shape program will handle the placement of the characters and call on a Character subprogram, the Character program will machine actual the individual characters themselves. 
Defining an engraving is done by combining Detail subprograms to create a Detail Block. These Detail subprograms let the programmer define the letters, numbers, and symbols that make up the engraving, including special Serial numbers, Sequential letters, Date, and Logo. Every engraving will need one of these Detail Block's to define what the engraving is.
The main idea is to have the main Shape program look though a detail block to populate a range of variables to create a list (Queue) of what needs to be engraved and in what order. The Shape will then determine its start point and work down from the top of the Queue to position and machine the individual characters using the Character subprogram.
For the Shape program to look ahead and determine its start points it will look at the elements in the Queue and increment a spacing sum (SSum). The SSum is a sum of all the character widths in the entire Queue. Using the SSum, the Upper Bound and the Letter Height we can calculate the dimensional Finished Size of the engraving. From the Finish Size we can calculate where to start the engraving based on the justification and alignment requirements.
#504 holds a value that represents how many units of space the finished size of the engraving will take up when it is machined.
