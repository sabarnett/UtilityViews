# ``UtilityViews``

UtilityViews is a framework of useful and commonly used views. 

## Overview

There are many views that appear in a number of apps where it makes sense to make them generic and reuse
the code. This framework contains a number of such views, ranging from simple text display views to more
complex picker views involving a significant amount of code. 


### KeyValueView

KeyValueView lets you display a key/value pair where the key can be either a string or an image. The key is
displayed on the left and the value on the right.

![Key Value View](KeyValueView.png)

See: ``KeyValueView``

### CheckBoxView

CheckBoxView is used when you want to show a text (key) value along with a boolean value to show state.

![Check Box View](CheckBoxView.png)

See: ``CheckBoxView``

### DateTimePickerButton

The DateTimePickerButton is used in conjunction with the ``DateTimePopup`` to present a 'button' that thge user can
tap to display a popup date/time selector. The button handles the date not being set.

![Date Time Picker Button](DateTimePickerButton.png)

See: ``DateTimePickerButton``

### DateTimePopup

Used in conjunction with the ``DateTimePickerButton`` the DateTimePopup presents a modal view to the user to select a date/time 
value. The code also handles tghere being no starting date and sets limits on what dates can be selected.

![Date Time Popup](DateTimePopup.png)

See: ``DateTimePopup``

### XDismissButton

XDsmissButton provides a consistently styled image to be used in conjunction with an overlay to close
a popup modal.

![Dismiss Button](XDismissButton.png)

See: ``XDismissButton``

### TextEdit

The TextEdit component provides a text input component that accepts multiple lines of text
with the advantage of having place holder text.

 ![Text Edit](TextEdit.png)

See: ``TextEdit``

### FloatingTextView

FloatingTextView is a variation on the standard TextInput input component that keeps the placeholder text visible
 on screen as the user types their input.

 ![Floating Text View](FloatingTextView.png)
 
See: ``FloatingTextView``


## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
