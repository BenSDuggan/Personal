# Phi Delta Epsilon Webmaster Stuff

## Pictures

Code used to convert:
```
convert input -strip -rotate "270" -resize 1000x1000 -density 72 -quality 75 out
```

## How to use Google Sheets
The system only needds one, publicly available Google Sheet.

### Enable Google Sheets
First we need to make it so that anyone on the web can access the Google Sheet.  To enable to Google Sheets first click on "Share" in the upper right hand corner.  Then click on "Advanced" in the lower right corner of the pop-up.  Next click on "Change..." which is next to the section about the link.  Lastely make sure the option for "Public on the web" is selected and that the Access is set to "Can view".  Next we need to Publish the sheet so that the code can access it.  To do this go to File -> Publish to the web.  Then click publish.  The Google sheet should be accessable to the code now.

### How to use the sheet
If a container contains a semicolen between then it will be treated as an array in the code.  Unless you are adding functionality you shouldn't incldue a semicolen.  If you need to for some reason then use `	&#59;`.  

## Family trees
Family trees are generated using the Google Sheet.

### Feachers
- You can have multiple bigs for one little.  To do this you will need to seperate the names of each big by a semicolen in the *big* section.  Take Abbie Watson as an example because her bigs are Mitchell Casiano and Arianna Dacanay.  In order to show this on the web-page you would need to type `Mitchell Casiano;Arianna Dacanay` under the *big* section for Abbie.